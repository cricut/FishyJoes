'use strict';

// adapted from https://github.com/devsnek/napi-wasi-experiments/blob/main/napi.js

// const vm = require('vm');
import util from 'util';
import { Buffer } from 'buffer';

const NAPI_AUTO_LENGTH = -1;

const NAPI_OK = 0;
const NAPI_INVALID_ARG = 1;
const NAPI_OBJECT_EXPECTED = 2;
const NAPI_STRING_EXPECTED = 3;
const NAPI_NAME_EXPECTED = 4;
const NAPI_FUNCTION_EXPECTED = 5;
const NAPI_NUMBER_EXPECTED = 6;
const NAPI_BOOLEAN_EXPECTED = 7;
const NAPI_ARRAY_EXPECTED = 8;
const NAPI_GENERIC_FAILURE = 9;
const NAPI_PENDING_EXCEPTION = 10;
const NAPI_CANCELLED = 11;
const NAPI_ESCAPE_CALLED_TWICE = 12;
const NAPI_HANDLE_SCOPE_MISMATCH = 13;
const NAPI_CALLBACK_SCOPE_MISMATCH = 14;
const NAPI_QUEUE_FULL = 15;
const NAPI_CLOSING = 16;
const NAPI_BIGINT_EXPECTED = 17;
const NAPI_DATE_EXPECTED = 18;
const NAPI_ARRAYBUFFER_EXPECTED = 19;
const NAPI_DETACHABLE_ARRAYBUFFER_EXPECTED = 20;
const NAPI_WOULD_DEADLOCK = 21;

const NAPI_UNDEFINED = 0;
const NAPI_NULL = 1;
const NAPI_BOOLEAN = 2;
const NAPI_NUMBER = 3;
const NAPI_STRING = 4;
const NAPI_SYMBOL = 5;
const NAPI_OBJECT = 6;
const NAPI_FUNCTION = 7;
const NAPI_EXTERNAL = 8;
const NAPI_BIGINT = 9;

const NAPI_DEFAULT = 0;
const NAPI_WRITABLE = 1 << 0;
const NAPI_ENUMERATE = 1 << 1;
const NAPI_CONFIGURABLE = 1 << 2;
const NAPI_STATIC = 1 << 10;

const NAPI_KEY_ALL_PROPERTIES = 0;
const NAPI_KEY_WRITABLE = 1 << 0;
const NAPI_KEY_ENUMERABLE = 1 << 1;
const NAPI_KEY_CONFIGURABLE = 1 << 2;
const NAPI_KEY_SKIP_STRINGS = 1 << 3;
const NAPI_KEY_SKIP_SYMBOLS = 1 << 4;

const NAPI_KEY_KEEP_NUMBERS = 0;
const NAPI_KEY_NUMBERS_TO_STRINGS = 1;

const NAPI_KEY_INCLUDE_PROTOTYPES = 0;
const NAPI_KEY_OWN_ONLY = 1;

const kFuncNormal = Symbol('kFuncNormal');
const kFuncConstructor = Symbol('kFuncConstructor');
const kFuncMethod = Symbol('kFuncMethod');

const kNoException = Symbol('kNoException');

const hasOwnProperty = Function.prototype.call.bind(Object.prototype.hasOwnProperty);

export class NAPI {
  constructor() {
    this.indirectFunctionTable = undefined;
    this.memory = undefined;
    this.view = undefined;
    this.instanceData = { data: 0 };

    this.scopes = [];
    this.handles = [null];
    this.references = [];

    this.externalData = new WeakMap();
    this.wrapData = new WeakMap();
    this.typeTags = new WeakMap();
    this.finalizationRegistry = new FinalizationRegistry((item) => {
      const [cbIdx, envPtr, data, hint] = item
      try {
        this.indirectFunctionTable.get(cbIdx)(envPtr, data, hint);
      } catch (e) {
        internalBinding('task_queue').triggerFatalException(e);
      }
    });

    this.exception = kNoException;
    this.lastErrorCode = NAPI_OK;
    this.exports = this.makeExports();
  }

  wrap(f, bypass = false) {
    return (...args) => {
      if (!bypass && this.exception !== kNoException) {
        return NAPI_PENDING_EXCEPTION;
      }
      this.lastErrorCode = NAPI_OK;
      try {
        this.refreshMemory();
        const r = f(...args);
        if (r !== NAPI_OK) {
          this.lastErrorCode = r;
        }
        return r;
      } catch (e) {
        if (typeof e === 'number') {
          this.lastErrorCode = e;
          return e;
        }
        this.exception = e;
        this.lastErrorCode = NAPI_PENDING_EXCEPTION;
        return NAPI_PENDING_EXCEPTION;
      }
    };
  }

  createFunction(envPtr, cb, data, name = undefined, mode = kFuncNormal, owner = undefined) {
    const self = this;
    const f = self.indirectFunctionTable.get(cb);
    let func;
    if (mode === kFuncConstructor) {
      func = (0, function (...args) {
        if (new.target === undefined) {
          throw new TypeError(`Class constructor ${name ? `${name} ` : ''}cannot be invoked without 'new'`);
        }
        const scope = self.openHandleScope(false);
        try {
          const callbackInfo = {
            this: this,
            newTarget: new.target,
            args,
            data,
          };
          const idx = f(envPtr, self.store(callbackInfo));
          return self.load(idx);
        } finally {
          self.closeHandleScope(scope);
          if (self.exception !== kNoException) {
            const e = self.exception;
            self.exception = kNoException;
            throw e; // eslint-disable-line no-unsafe-finally
          }
        }
      });
    } else {
      func = (0, function (...args) {
        if (owner !== undefined && !(this instanceof owner)) {
          throw new TypeError('Illegal invocation');
        }
        const scope = self.openHandleScope(false);
        try {
          const callbackInfo = {
            this: this,
            newTarget: new.target,
            args,
            data,
          };
          const idx = f(envPtr, self.store(callbackInfo));
          return self.load(idx);
        } finally {
          self.closeHandleScope(scope);
          if (self.exception !== kNoException) {
            const e = self.exception;
            self.exception = kNoException;
            throw e; // eslint-disable-line no-unsafe-finally
          }
        }
      });
    }
    if (name) {
      Object.defineProperty(func, 'name', {
        value: name,
        configurable: true,
      });
    }
    return func;
  }

  readPropertyDescriptors(count, ptr) {
    const descriptors = [];
    for (let i = 0; i < count; i += 1) {
      const utf8namePtr = this.view.getUint32(ptr, true);
      ptr += 4;
      const nameIdx = this.view.getUint32(ptr, true);
      ptr += 4;
      const method = this.view.getUint32(ptr, true);
      ptr += 4;
      const getter = this.view.getUint32(ptr, true);
      ptr += 4;
      const setter = this.view.getUint32(ptr, true);
      ptr += 4;
      const valueIdx = this.view.getUint32(ptr, true);
      ptr += 4;
      const attributes = this.view.getUint32(ptr, true);
      ptr += 4;
      const dataPtr = this.view.getUint32(ptr, true);
      ptr += 4;

      const name = utf8namePtr !== 0
        ? this.readCStringFrom(utf8namePtr)
        : this.load(nameIdx);

      if (typeof name !== 'string' && typeof name !== 'symbol') {
        throw NAPI_NAME_EXPECTED;
      }

      const descriptor = {};
      if ((attributes & NAPI_WRITABLE) !== 0) {
        descriptor.writable = true;
      }
      if ((attributes & NAPI_ENUMERATE) !== 0) {
        descriptor.enumerable = true;
      }
      if ((attributes & NAPI_CONFIGURABLE) !== 0) {
        descriptor.configurable = true;
      }
      if ((attributes & NAPI_STATIC) === NAPI_STATIC) {
        descriptor.static = true;
      }

      descriptors.push({
        method,
        getter,
        setter,
        valueIdx,
        dataPtr,
        descriptor,
        name,
      });
    }
    return descriptors;
  }

  throwError(C, codePtr, msgPtr) {
    const msg = this.readCStringFrom(msgPtr);
    this.exception = new C(msg);
    if (codePtr !== 0) {
      this.exception.code = this.readCStringFrom(codePtr);
    }
    return NAPI_OK;
  }

  createError(C, codeIdx, msgIdx, resultPtr) {
    const msg = this.load(msgIdx);
    if (typeof msg !== 'string') {
      return NAPI_STRING_EXPECTED;
    }
    const e = new C(msg);
    if (codeIdx !== 0) {
      e.code = this.load(codeIdx);
    }
    this.writeValue(resultPtr, this.store(e));
    return NAPI_OK;
  }

  makeExports() {
    return {
      napi_get_last_error_info: (envPtr, napiExtendedErrorInfoPtr) => {
        this.view.setBigUint64(napiExtendedErrorInfoPtr, 0);
        this.view.setUint32(napiExtendedErrorInfoPtr + 8, 0);
        this.view.setUint32(napiExtendedErrorInfoPtr + 12, this.lastErrorCode);
        return NAPI_OK;
      },
      napi_throw: this.wrap((envPtr, valueIdx) => {
        this.exception = this.load(valueIdx);
        return NAPI_OK;
      }),
      napi_throw_error: this.wrap((envPtr, codePtr, msgPtr) =>
        this.throwError(Error, codePtr, msgPtr)),
      napi_throw_type_error: this.wrap((envPtr, codePtr, msgPtr) =>
        this.throwError(TypeError, codePtr, msgPtr)),
      napi_throw_range_error: this.wrap((envPtr, codePtr, msgPtr) =>
        this.throwError(RangeError, codePtr, msgPtr)),
      napi_create_error: this.wrap((envPtr, codeIdx, msgIdx, resultPtr) =>
        this.createError(Error, codeIdx, msgIdx, resultPtr)),
      napi_create_type_error: this.wrap((envPtr, codeIdx, msgIdx, resultPtr) =>
        this.createError(TypeError, codeIdx, msgIdx, resultPtr)),
      napi_create_range_error: this.wrap((envPtr, codeIdx, msgIdx, resultPtr) =>
        this.createError(RangeError, codeIdx, msgIdx, resultPtr)),

      napi_get_and_clear_last_exception: this.wrap((envPtr, resultPtr) => {
        if (this.exception === kNoException) {
          return NAPI_GENERIC_FAILURE;
        }
        const e = this.exception;
        this.exception = kNoException;
        this.writeValue(resultPtr, this.store(e));
        return NAPI_OK;
      }, true),
      napi_is_exception_pending: this.wrap((envPtr, resultPtr) => {
        this.view.setUint8(resultPtr, this.exception !== kNoException);
        return NAPI_OK;
      }, true),

      napi_fatal_exception: this.wrap((envPtr, valueIdx) => {
        const value = this.load(valueIdx);
        internalBinding('task_queue').triggerFatalException(value);
        return NAPI_OK;
      }),

      // napi_fatal_error: (locationPtr, locationLen, messagePtr, messageLen) => {
      //   this.refreshMemory();

      //   const location = this.readString(locationPtr, locationLen);
      //   const message = this.readString(messagePtr, messageLen);

      //   if (location) {
      //     process._rawDebug(`FATAL ERROR: ${location} ${message}`);
      //   } else {
      //     process._rawDebug(`FATAL ERROR: ${message}`);
      //   }
      //   process.abort();

      //   // unreachable
      //   return NAPI_GENERIC_FAILURE;
      // },

      napi_open_handle_scope: this.wrap((envPtr, resultPtr) => {
        const idx = this.openHandleScope(false);
        this.view.setUint32(resultPtr, idx, true);
        return NAPI_OK;
      }),
      napi_close_handle_scope: this.wrap((envPtr, scopePtr) => {
        this.closeHandleScope(scopePtr);
        return NAPI_OK;
      }, true),
      napi_open_escapable_handle_scope: this.wrap((envPtr, resultPtr) => {
        const idx = this.openHandleScope(true);
        this.view.setUint32(resultPtr, idx, true);
        return NAPI_OK;
      }),
      napi_close_escapable_handle_scope: this.wrap((envPtr, scopePtr) => {
        this.closeHandleScope(scopePtr);
        return NAPI_OK;
      }, true),
      napi_escape_handle: this.wrap((envPtr, scopePtr, escapeeIdx, resultPtr) => {
        const scope = this.load(scopePtr);
        if (!scope.escapable) {
          return NAPI_HANDLE_SCOPE_MISMATCH;
        }
        if (scope.escaped) {
          return NAPI_ESCAPE_CALLED_TWICE;
        }
        this.handles[scope.escapeSlot] = this.load(escapeeIdx);
        this.writeValue(resultPtr, scope.escapeSlot);
        return NAPI_OK;
      }, true),

      napi_create_reference: this.wrap((envPtr, valueIdx, initialRefcount, resultPtr) => {
        const value = this.load(valueIdx);
        const ref = { value, ref: initialRefcount };
        this.references.push(ref);
        this.writeValue(resultPtr, this.references.length - 1);
        return NAPI_OK;
      }),
      napi_delete_reference: (envPtr, refIdx) => {
        this.references[refIdx] = undefined;
        return NAPI_OK;
      },
      napi_reference_ref: this.wrap((envPtr, refIdx, resultPtr) => {
        const ref = this.references[refIdx];
        if (ref.ref === 0) {
          return NAPI_GENERIC_FAILURE;
        }
        ref.ref += 1;
        if (resultPtr) {
          this.view.setUint32(resultPtr, ref.ref, true);
        }
        return NAPI_OK;
      }),
      napi_reference_unref: this.wrap((envPtr, refIdx, resultPtr) => {
        const ref = this.references[refIdx];
        if (ref.ref === 0) {
          return NAPI_GENERIC_FAILURE;
        }
        ref.ref -= 1;
        if (resultPtr) {
          this.view.setUint32(resultPtr, ref.ref, true);
        }
        return NAPI_OK;
      }),
      napi_get_reference_value: this.wrap((envPtr, refIdx, resultPtr) => {
        this.writeValue(resultPtr, this.store(this.references[refIdx].value));
        return NAPI_OK;
      }),

      // No-op env cleanup
      napi_add_env_cleanup_hook: () => NAPI_OK,
      napi_remove_env_cleanup_hook: () => NAPI_OK,

      napi_create_array: this.wrap((envPtr, resultPtr) => {
        this.writeValue(resultPtr, this.store([]));
        return NAPI_OK;
      }),
      napi_create_array_with_length: this.wrap((envPtr, length, resultPtr) => {
        this.writeValue(resultPtr, this.store(new Array(length)));
        return NAPI_OK;
      }),
      napi_create_arraybuffer: this.wrap((envPtr, length, dataPtr, resultPtr) => {
        this.writeValue(resultPtr, this.store(this.memory.buffer.slice(dataPtr, dataPtr + length)));
        return NAPI_OK;
      }),
      // napi_create_buffer
      // napi_create_buffer_copy
      napi_create_date: this.wrap((envPtr, time, resultPtr) => {
        this.writeValue(resultPtr, this.store(new Date(time)));
        return NAPI_OK;
      }),
      napi_create_external: this.wrap((envPtr, data, finalizeCb, finalizeHint, resultPtr) => {
        const obj = {};
        this.finalizationRegistry
          .register(obj, [finalizeCb, envPtr, data, finalizeHint]);
        this.externalData.set(obj, data);
        let idx = this.store(obj);
        this.writeValue(resultPtr, idx);
        // console.log(`created external ${idx} -> ${data}`);
        return NAPI_OK;
      }),
      // napi_create_external_arraybuffer
      // napi_create_external_buffer
      napi_create_object: this.wrap((envPtr, resultPtr) => {
        this.writeValue(resultPtr, this.store({}));
        return NAPI_OK;
      }),
      napi_create_symbol: this.wrap((envPtr, descriptionIdx, resultPtr) => {
        this.writeValue(resultPtr, this.store(Symbol(this.load(descriptionIdx))));
        return NAPI_OK;
      }),
      napi_create_typedarray: this.wrap((envPtr, type, length, arraybufferIdx, byteOffset, resultPtr) => {
        const ab = new [
          Int8Array,
          Uint8Array,
          Uint8ClampedArray,
          Int16Array,
          Uint16Array,
          Int32Array,
          Uint32Array,
          Float32Array,
          Float64Array,
          BigInt64Array,
          BigUint64Array,
        ][type](this.load(arraybufferIdx), byteOffset, length);
        this.writeValue(resultPtr, this.store(ab));
        return NAPI_OK;
      }),
      napi_create_dataview: this.wrap((envPtr, byteLength, arraybufferIdx, byteOffset, resultPtr) => {
        const dv = new DataView(this.load(arraybufferIdx), byteOffset, byteLength);
        this.writeValue(resultPtr, this.store(dv));
        return NAPI_OK;
      }),
      napi_create_int32: this.wrap((envPtr, value, resultPtr) => {
        this.writeValue(resultPtr, this.store(value));
        return NAPI_OK;
      }),
      napi_create_uint32: this.wrap((envPtr, value, resultPtr) => {
        this.writeValue(resultPtr, this.store(value));
        return NAPI_OK;
      }),
      napi_create_int64: this.wrap((envPtr, value, resultPtr) => {
        this.writeValue(resultPtr, this.store(value));
        return NAPI_OK;
      }),
      napi_create_double: this.wrap((envPtr, value, resultPtr) => {
        this.writeValue(resultPtr, this.store(value));
        return NAPI_OK;
      }),
      napi_create_bigint_int64: this.wrap((envPtr, value, resultPtr) => {
        this.writeValue(resultPtr, this.store(value));
        return NAPI_OK;
      }),
      napi_create_bigint_uint64: this.wrap((envPtr, value, resultPtr) => {
        this.writeValue(resultPtr, this.store(value));
        return NAPI_OK;
      }),
      napi_create_bigint_words: this.wrap((envPtr, signBit, wordCount, wordsPtr, resultPtr) => {
        let b = 0n;
        let shift = 0n;
        for (let i = 0; i < wordCount; i += 1) {
          const word = this.view.getBigUint64((i * 64) + wordsPtr, true);
          b += word << shift;
          shift += 64n;
        }
        const value = ((-1) ** signBit) * b;
        this.writeValue(resultPtr, this.store(value));
        return NAPI_OK;
      }),
      napi_create_string_latin1: this.wrap((envPtr, strPtr, length, resultPtr) => {
        const str = this.readString(strPtr, length, 'latin1');
        this.writeValue(resultPtr, this.store(str));
        return NAPI_OK;
      }),
      napi_create_string_utf16: this.wrap((envPtr, strPtr, length, resultPtr) => {
        const str = this.readString(strPtr, length, 'utf16');
        this.writeValue(resultPtr, this.store(str));
        return NAPI_OK;
      }),
      napi_create_string_utf8: this.wrap((envPtr, strPtr, length, resultPtr) => {
        const str = this.readString(strPtr, length, 'utf8');
        this.writeValue(resultPtr, this.store(str));
        return NAPI_OK;
      }),

      napi_get_array_length: this.wrap((envPtr, valueIdx, resultPtr) => {
        const a = this.load(valueIdx);
        if (!util.types.isArray(a)) {
          return NAPI_ARRAY_EXPECTED;
        }
        this.view.setUint32(resultPtr, a.length, true);
        return NAPI_OK;
      }),
      napi_get_prototype: this.wrap((envPtr, valueIdx, resultPtr) => {
        const proto = Object.getPrototypeOf(this.load(valueIdx));
        this.writeValue(resultPtr, this.store(proto));
        return NAPI_OK;
      }),
      napi_get_typedarray_info: this.wrap((envPtr, typedarrayIdx, typePtr, lengthPtr, dataPtr, arraybufferPtr, byteOffsetPtr) => {
        const typedArray = this.load(typedarrayIdx);
        if (!util.types.isTypedArray(typedArray)) {
          return NAPI_ARRAYBUFFER_EXPECTED;
        }
        this.view.setUint32(typePtr, {
          Int8Array: 0,
          Uint8Array: 1,
          Uint8ClampedArray: 2,
          Int16Array: 3,
          Uint16Array: 4,
          Int32Array: 5,
          Uint32Array: 6,
          Float32Array: 7,
          Float64Array: 8,
          BigInt64Array: 9,
          BigUint64Array: 10,
        }[typedArray[Symbol.toStringTag]]);
        this.view.setUint32(lengthPtr, typedArray.length);
        this.view.setUint32(dataPtr, 0);
        this.writeValue(arraybufferPtr, this.store(typedArray.buffer));
        this.view.setUint32(byteOffsetPtr, typedArray.byteOffset);
        return NAPI_OK;
      }),
      napi_get_dataview_info: this.wrap((envPtr, dataviewIdx, byteLengthPtr, dataPtr, arraybufferPtr, byteOffsetPtr) => {
        const dataView = this.load(dataviewIdx);
        if (!util.types.isDataView(dataView)) {
          return NAPI_INVALID_ARG;
        }
        this.view.setUint32(byteLengthPtr, dataView.byteLength);
        this.view.setUint32(dataPtr, 0);
        this.writeValue(arraybufferPtr, dataView.buffer);
        this.view.setUint32(byteOffsetPtr, dataView.byteOffset);
        return NAPI_OK;
      }),
      napi_get_date_value: this.wrap((envPtr, valueIdx, resultPtr) => {
        const d = this.load(valueIdx);
        if (!util.types.isDate(d)) {
          return NAPI_DATE_EXPECTED;
        }
        this.view.setFloat64(resultPtr, d.getTime(), true);
        return NAPI_OK;
      }),
      napi_get_value_bool: this.wrap((envPtr, valueIdx, resultPtr) => {
        const b = this.load(valueIdx);
        if (typeof b !== 'boolean') {
          return NAPI_BOOLEAN_EXPECTED;
        }
        this.view.setUint8(resultPtr, b);
        return NAPI_OK;
      }),
      napi_get_value_double: this.wrap((envPtr, valueIdx, resultPtr) => {
        const v = this.load(valueIdx);
        if (typeof v !== 'number') {
          return NAPI_NUMBER_EXPECTED;
        }
        this.view.setFloat64(resultPtr, v, true);
        return NAPI_OK;
      }),
      napi_get_value_bigint_int64: this.wrap((envPtr, valueIdx, resultPtr, losslessPtr) => {
        const b = this.load(valueIdx);
        if (typeof b !== 'bigint') {
          return NAPI_BIGINT_EXPECTED;
        }
        if (losslessPtr !== 0) {
          this.view.setUint8(losslessPtr, BigInt.asIntN(64, b) !== b);
        }
        this.view.setBigInt64(resultPtr, b, true);
        return NAPI_OK;
      }),
      napi_get_value_bigint_uint64: this.wrap((envPtr, valueIdx, resultPtr, losslessPtr) => {
        const b = this.load(valueIdx);
        if (typeof b !== 'bigint') {
          return NAPI_BIGINT_EXPECTED;
        }
        if (losslessPtr !== 0) {
          this.view.setUint8(losslessPtr, BigInt.asUintN(64, b) !== b);
        }
        this.view.setBigUint64(resultPtr, b, true);
        return NAPI_OK;
      }),
      napi_get_value_bigint_words: this.wrap((envPtr, valueIdx, signBitPtr, wordCountPtr, wordsPtr) => {
        const b = this.load(valueIdx);
        if (typeof b !== 'bigint') {
          return NAPI_BIGINT_EXPECTED;
        }
        if (signBitPtr !== 0) {
          this.view.setUint8(signBitPtr, b < 0n);
        }
        const wordCount = this.view.getUint32(wordCountPtr, true);
        let i = 0;
        let ull = b < 0n ? -b : b;
        for (; i < wordCount; i += 1) {
          const bv = ull & ((1n << 64n) - 1);
          this.view.setBigUint64(wordsPtr + (i * 64), bv, true);
          ull >>= 64n;
        }
        while (ull > 0) {
          i += 1;
          ull >>= 64n;
        }
        this.view.setUint32(wordCountPtr, i, true);
        return NAPI_OK;
      }),
      napi_get_value_external: this.wrap((envPtr, valueIdx, resultPtr) => {
        const e = this.load(valueIdx);
        if (!this.externalData.has(e)) {
          return NAPI_INVALID_ARG;
        }
        // console.log(`get_external ${valueIdx} -> ${this.externalData.get(e)}`);
        this.view.setUint32(resultPtr, this.externalData.get(e), true);
        return NAPI_OK;
      }),
      napi_get_value_int32: this.wrap((envPtr, valueIdx, resultPtr) => {
        const n = this.load(valueIdx);
        if (typeof n !== 'number') {
          return NAPI_NUMBER_EXPECTED;
        }
        this.view.setInt32(resultPtr, n, true);
        return NAPI_OK;
      }),
      napi_get_value_int64: this.wrap((envPtr, valueIdx, resultPtr) => {
        const n = this.load(valueIdx);
        if (typeof n !== 'number') {
          return NAPI_NUMBER_EXPECTED;
        }
        this.view.setBigInt64(resultPtr, BigInt(Math.floor(n)), true);
        return NAPI_OK;
      }),
      napi_get_value_string_latin1: this.wrap((envPtr, valueIdx, bufPtr, bufSize, resultPtr) => {
        const s = this.load(valueIdx);
        if (typeof s !== 'string') {
          return NAPI_STRING_EXPECTED;
        }
        const written = Buffer.from(this.memory.buffer).write(s, bufPtr, bufSize, 'latin1');
        this.view.setUint32(resultPtr, written, true);
        return NAPI_OK;
      }),
      napi_get_value_string_utf8: this.wrap((envPtr, valueIdx, bufPtr, bufSize, resultPtr) => {
        const s = this.load(valueIdx);
        if (typeof s !== 'string') {
          return NAPI_STRING_EXPECTED;
        }
        if (bufPtr === 0) {
          const length = (new TextEncoder()).encode(s).length;
          this.view.setUint32(resultPtr, length, true);
        } else {
          const written = Buffer.from(this.memory.buffer).write(s, bufPtr, bufSize, 'utf8');
          this.view.setUint32(resultPtr, written, true);
        }
        return NAPI_OK;
      }),
      napi_get_value_string_utf16: this.wrap((envPtr, valueIdx, bufPtr, bufSize, resultPtr) => {
        const s = this.load(valueIdx);
        if (typeof s !== 'string') {
          return NAPI_STRING_EXPECTED;
        }
        const written = Buffer.from(this.memory.buffer).write(s, bufPtr, bufSize, 'utf16');
        this.view.setUint32(resultPtr, written, true);
        return NAPI_OK;
      }),
      napi_get_value_uint32: this.wrap((envPtr, valueIdx, resultPtr) => {
        const n = this.load(valueIdx);
        if (typeof n !== 'number') {
          return NAPI_NUMBER_EXPECTED;
        }
        this.view.setUint32(resultPtr, n, true);
        return NAPI_OK;
      }),
      napi_get_boolean: this.wrap((envPtr, value, resultPtr) => {
        this.writeValue(resultPtr, this.store(Boolean(value)));
        return NAPI_OK;
      }),
      napi_get_global: this.wrap((envPtr, resultPtr) => {
        this.writeValue(resultPtr, this.store(globalThis));
        return NAPI_OK;
      }),
      napi_get_null: this.wrap((envPtr, resultPtr) => {
        this.writeValue(resultPtr, this.store(null));
        return NAPI_OK;
      }),
      napi_get_undefined: this.wrap((envPtr, resultPtr) => {
        this.writeValue(resultPtr, this.store(undefined));
        return NAPI_OK;
      }),
      napi_coerce_to_bool: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.writeValue(resultPtr, this.store(Boolean(this.load(valueIdx))));
        return NAPI_OK;
      }),
      napi_coerce_to_number: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.writeValue(resultPtr, this.store(Number(this.load(valueIdx))));
        return NAPI_OK;
      }),
      napi_coerce_to_object: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.writeValue(resultPtr, this.store(Object(this.load(valueIdx))));
        return NAPI_OK;
      }),
      napi_coerce_to_string: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.writeValue(resultPtr, this.store(String(this.load(valueIdx))));
        return NAPI_OK;
      }),
      napi_typeof: this.wrap((envPtr, valueIdx, resultPtr) => {
        const v = this.load(valueIdx);
        let vt;
        switch (typeof v) {
        case 'undefined':
          vt = NAPI_UNDEFINED;
          break;
          // null handled below
        case 'boolean':
          vt = NAPI_BOOLEAN;
          break;
        case 'number':
          vt = NAPI_NUMBER;
          break;
        case 'string':
          vt = NAPI_STRING;
          break;
        case 'symbol':
          vt = NAPI_SYMBOL;
          break;
        case 'object':
          if (v === null) {
            vt = NAPI_NULL;
          } else if (this.externalData.has(v)) {
            vt = NAPI_EXTERNAL;
          } else {
            vt = NAPI_OBJECT;
          }
          break;
        case 'function':
          vt = NAPI_FUNCTION;
          break;
          // external handled above
        case 'bigint':
          vt = NAPI_BIGINT;
          break;
        default:
          throw new RangeError();
        }
        this.view.setUint32(resultPtr, vt, true);
        return NAPI_OK;
      }),
      napi_instanceof: this.wrap((envPtr, objectIdx, constructorIdx, resultPtr) => {
        const object = this.load(objectIdx);
        const cons = this.load(constructorIdx);
        if (typeof cons !== 'function') {
          this.exception = new TypeError('Constructor must be a function');
          return NAPI_FUNCTION_EXPECTED;
        }
        this.view.setUint8(resultPtr, object instanceof cons);
        return NAPI_OK;
      }),
      napi_is_array: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.view.setUint8(resultPtr, util.types.isArray(this.load(valueIdx)));
        return NAPI_OK;
      }),
      napi_is_arraybuffer: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.view.setUint8(resultPtr, util.types.isArrayBuffer(this.load(valueIdx)));
        return NAPI_OK;
      }),
      napi_is_buffer: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.view.setUint8(resultPtr, Buffer.isBuffer(this.load(valueIdx)));
        return NAPI_OK;
      }),
      napi_is_date: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.view.setUint8(resultPtr, util.types.isDate(this.load(valueIdx)));
        return NAPI_OK;
      }),
      napi_is_error: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.view.setUint8(resultPtr, util.types.isNativeError(this.load(valueIdx)));
        return NAPI_OK;
      }),
      napi_is_typedarray: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.view.setUint8(resultPtr, util.types.isTypedArray(this.load(valueIdx)));
        return NAPI_OK;
      }),
      napi_is_dataview: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.view.setUint8(resultPtr, util.types.isDataView(this.load(valueIdx)));
        return NAPI_OK;
      }),
      napi_strict_equals: this.wrap((envPtr, lhsIdx, rhsIdx, resultPtr) => {
        this.view.setUint8(resultPtr, this.load(lhsIdx) === this.load(rhsIdx));
        return NAPI_OK;
      }),
      napi_detach_arraybuffer: this.wrap((env, valueIdx) => {
        const ab = this.load(valueIdx);
        if (!util.types.isArrayBuffer(ab)) {
          return NAPI_DETACHABLE_ARRAYBUFFER_EXPECTED;
        }
        return NAPI_OK;
      }),
      napi_is_detached_arraybuffer: this.wrap((envPtr, valueIdx, resultPtr) => {
        const ab = this.load(valueIdx);
        if (!util.types.isArrayBuffer(ab)) {
          return NAPI_ARRAYBUFFER_EXPECTED;
        }
        this.view.setUint8(resultPtr, false);
        return NAPI_OK;
      }),
      napi_get_property_names: this.wrap((envPtr, valueIdx, resultPtr) => {
        const object = this.load(valueIdx);
        this.writeValue(resultPtr, this.store(Object.keys(object)));
        return NAPI_OK;
      }),
      napi_get_all_property_names: this.wrap((envPtr, valueIdx, keyMode, keyFilter, keyConversion, resultPtr) => {
        const object = this.load(valueIdx);

        const onlyWritable = !!(keyFilter & NAPI_KEY_WRITABLE);
        const onlyEnumerable = !!(keyFilter & NAPI_KEY_ENUMERABLE);
        const onlyConfigurable = !!(keyFilter & NAPI_KEY_CONFIGURABLE);
        const skipStrings = !!(keyFilter & NAPI_KEY_SKIP_STRINGS);
        const skipSymbols = !!(keyFilter & NAPI_KEY_SKIP_SYMBOLS);

        let includePrototypes = false;
        switch (keyMode) {
        case NAPI_KEY_INCLUDE_PROTOTYPES:
          includePrototypes = true;
          break;
        case NAPI_KEY_OWN_ONLY:
          includePrototypes = false;
          break;
        default:
          return NAPI_INVALID_ARG;
        }

        let numbersAsStrings = false;
        switch (keyConversion) {
        case NAPI_KEY_KEEP_NUMBERS:
          numbersAsStrings = false;
          break;
        case NAPI_KEY_NUMBERS_TO_STRINGS:
          numbersAsStrings = true;
          break;
        default:
          return NAPI_INVALID_ARG;
        }


        let targets;
        if (includePrototypes) {
          targets = [];
          let p = object;
          while (p !== null) {
            targets.push(p);
            p = Object.getPrototypeOf(p);
          }
        } else {
          targets = [object];
        }

        const keys = targets.flatMap((target) =>
          Object.entries(Object.getOwnPropertyDescriptors(target))
            .filter(([name, d]) => {
              if (onlyWritable && !d.writable) {
                return false;
              }
              if (onlyEnumerable && !d.enumerable) {
                return false;
              }
              if (onlyConfigurable && !d.configurable) {
                return false;
              }
              if (skipStrings && typeof name === 'string') {
                return false;
              }
              if (skipSymbols && typeof name === 'symbol') {
                return false;
              }
              return true;
            })
            .map(([name]) => {
              if (numbersAsStrings) {
                return name;
              }
              const nameNum = +name;
              if (nameNum.toString() === name && nameNum >= 0 && nameNum < 2 ** 53 - 1) {
                return nameNum;
              }
              return name;
            }));

        this.writeValue(resultPtr, this.store(keys.flat()));
        return NAPI_OK;
      }),
      napi_set_property: this.wrap((envPtr, objectIdx, keyIdx, valueIdx) => {
        const object = this.load(objectIdx);
        const key = this.load(keyIdx);
        const value = this.load(valueIdx);
        object[key] = value;
        return NAPI_OK;
      }),
      napi_get_property: this.wrap((envPtr, objectIdx, keyIdx, resultPtr) => {
        const object = this.load(objectIdx);
        const key = this.load(keyIdx);
        this.writeValue(resultPtr, this.store(object[key]));
        return NAPI_OK;
      }),
      napi_has_property: this.wrap((envPtr, objectIdx, keyIdx, resultPtr) => {
        const object = this.load(objectIdx);
        const key = this.load(keyIdx);
        this.view.setUint8(resultPtr, key in object);
        return NAPI_OK;
      }),
      napi_delete_property: this.wrap((envPtr, objectIdx, keyIdx, resultPtr) => {
        const object = this.load(objectIdx);
        const key = this.load(keyIdx);
        this.view.setUint8(resultPtr, delete object[key]);
        return NAPI_OK;
      }),
      napi_has_own_property: this.wrap((envPtr, objectIdx, keyIdx, resultPtr) => {
        const object = this.load(objectIdx);
        const key = this.load(keyIdx);
        if (typeof key !== 'string' && typeof key !== 'symbol') {
          return NAPI_NAME_EXPECTED;
        }
        this.view.setUint8(resultPtr, hasOwnProperty(object, key));
        return NAPI_OK;
      }),
      napi_set_named_property: this.wrap((envPtr, objectIdx, utf8NamePtr, valueIdx) => {
        const object = this.load(objectIdx);
        const name = this.readCStringFrom(utf8NamePtr);
        const value = this.load(valueIdx);
        object[name] = value;
        return NAPI_OK;
      }),
      napi_get_named_property: this.wrap((envPtr, objectIdx, utf8NamePtr, resultPtr) => {
        const object = this.load(objectIdx);
        const name = this.readCStringFrom(utf8NamePtr);
        this.writeValue(resultPtr, this.store(object[name]));
        return NAPI_OK;
      }),
      napi_has_named_property: this.wrap((envPtr, objectIdx, utf8NamePtr, resultPtr) => {
        const object = this.load(objectIdx);
        const key = this.readCStringFrom(utf8NamePtr);
        this.writeValue(resultPtr, this.store(Object.prototype.hasOwnProperty.call(object, key)));
        return NAPI_OK;
      }),
      napi_set_element: this.wrap((envPtr, objectIdx, index, valueIdx) => {
        this.load(objectIdx)[index] = this.load(valueIdx);
        return NAPI_OK;
      }),
      napi_get_element: this.wrap((envPtr, objectIdx, index, resultPtr) => {
        this.writeValue(resultPtr, this.store(this.load(objectIdx)[index]));
        return NAPI_OK;
      }),
      napi_has_element: this.wrap((envPtr, objectIdx, index, resultPtr) => {
        const object = this.load(objectIdx);
        this.view.setUint8(resultPtr, hasOwnProperty(object, index));
        return NAPI_OK;
      }),
      napi_delete_element: this.wrap((envPtr, objectIdx, index, resultPtr) => {
        const object = this.load(objectIdx);
        this.view.setUint8(resultPtr, delete object[index]);
        return NAPI_OK;
      }),
      napi_define_properties: this.wrap((envPtr, objectIdx, propertyCount, propertiesPtr) => {
        const object = this.load(objectIdx);
        if (typeof object !== 'object' || object === null) {
          return NAPI_OBJECT_EXPECTED;
        }
        this.readPropertyDescriptors(propertyCount, propertiesPtr)
          .forEach(({
            method,
            getter,
            setter,
            valueIdx,
            dataPtr,
            descriptor,
            name,
          }) => {
            if (getter || setter) {
              const get = getter ? this.createFunction(envPtr, getter, dataPtr) : undefined;
              const set = setter ? this.createFunction(envPtr, setter, dataPtr) : undefined;
              Object.defineProperty(object, name, { ...descriptor, get, set });
            } else if (method) {
              const value = this.createFunction(envPtr, method, dataPtr, name);
              Object.defineProperty(object, name, { ...descriptor, value });
            } else {
              const value = this.load(valueIdx);
              Object.defineProperty(object, name, { ...descriptor, value });
            }
          });
        return NAPI_OK;
      }),
      napi_object_freeze: this.wrap((envPtr, objectIdx) => {
        Object.freeze(this.load(objectIdx));
        return NAPI_OK;
      }),
      napi_object_seal: this.wrap((envPtr, objectIdx) => {
        Object.seal(this.load(objectIdx));
        return NAPI_OK;
      }),
      napi_call_function: (envPtr, recvIdx, funcIdx, argc, argvPtr, resultPtr) => {
        if (this.exception !== kNoException) {
          return NAPI_PENDING_EXCEPTION;
        }

        const recv = this.load(recvIdx);
        const func = this.load(funcIdx);

        if (typeof func !== 'function') {
          return NAPI_FUNCTION_EXPECTED;
        }

        const args = [];
        for (let i = 0; i < argc; i += 1) {
          // TODO: use this.view instead???
          args.push(this.load(argvPtr + (i * 4)));
        }

        try {
          const result = Reflect.apply(func, recv, args);
          this.writeValue(resultPtr, this.store(result));
        } catch (e) {
          this.exception = e;
          return NAPI_PENDING_EXCEPTION;
        }

        return NAPI_OK;
      },
      napi_create_function: this.wrap((envPtr, utf8NamePtr, length, cb, data, resultPtr) => {
        let name;
        if (length > 0) {
          name = this.readString(utf8NamePtr, length);
        }
        const func = this.createFunction(envPtr, cb, data, name);
        this.writeValue(resultPtr, this.store(func));
        return NAPI_OK;
      }),
      napi_get_cb_info: this.wrap((envPtr, cbinfoIdx, argcPtr, argvPtr, thisArgPtr, dataPtr) => {
        const info = this.load(cbinfoIdx);

        const argc = this.view.getUint32(argcPtr, true);

        this.view.setUint32(argcPtr, info.args.length, true);
        for (let i = 0; i < argc; i += 1) {
          this.writeValue(argvPtr + (i * 4), this.store(info.args[i]));
        }

        this.writeValue(thisArgPtr, this.store(info.this));

        this.view.setUint32(dataPtr, info.data, true);

        return NAPI_OK;
      }),
      napi_get_new_target: this.wrap((envPtr, cbinfoIdx, resultPtr) => {
        const info = this.load(cbinfoIdx);
        this.writeValue(resultPtr, this.store(info.newTarget));
        return NAPI_OK;
      }),
      napi_new_instance: this.wrap((envPtr, consIdx, argc, argvPtr, resultPtr) => {
        const cons = this.load(consIdx);
        if (typeof cons !== 'function') {
          return NAPI_FUNCTION_EXPECTED;
        }
        const args = [];
        for (let i = 0; i < argc; i += 1) {
          args.push(this.load(this.readValue(argvPtr + (i * 4))));
        }
        const result = Reflect.construct(cons, args);
        this.writeValue(resultPtr, this.store(result));
        return NAPI_OK;
      }),
      napi_define_class: this.wrap((envPtr, utf8NamePtr, utf8NameLength, constructorIdx, data, propertyCount, propertiesPtr, resultPtr) => {
        const func = this.createFunction(
          envPtr, constructorIdx, data, utf8NameLength > 0
            ? this.readString(utf8NamePtr, utf8NameLength)
            : undefined, kFuncConstructor);
        this.readPropertyDescriptors(propertyCount, propertiesPtr)
          .forEach(({
            method,
            getter,
            setter,
            valueIdx,
            dataPtr,
            descriptor,
            name,
          }) => {
            const target = descriptor.static ? func : func.prototype;
            if (getter || setter) {
              const get = getter ? this.createFunction(envPtr, getter, dataPtr) : undefined;
              const set = setter ? this.createFunction(envPtr, setter, dataPtr) : undefined;
              delete descriptor.writable;
              Object.defineProperty(target, name, { ...descriptor, get, set });
            } else if (method) {
              const value = this.createFunction(envPtr, method, dataPtr, name, kFuncMethod, descriptor.static ? undefined : func);
              Object.defineProperty(target, name, { ...descriptor, value });
            } else {
              const value = this.load(valueIdx);
              Object.defineProperty(target, name, { ...descriptor, value });
            }
          });
        this.writeValue(resultPtr, this.store(func));
        return NAPI_OK;
      }),

      napi_wrap: this.wrap((envPtr, jsObjectIdx, nativeObjectPtr, finalizeCb, finalizeHint, resultPtr) => {
        const jsObject = this.load(jsObjectIdx);
        if (this.wrapData.has(jsObject)) {
          return NAPI_INVALID_ARG;
        }
        this.finalizationRegistry
          .register(jsObject, [finalizeCb, envPtr, nativeObjectPtr, finalizeHint]);
        this.wrapData.set(jsObject, nativeObjectPtr);
        if (resultPtr !== 0) {
          const ref = { value: jsObject, ref: 1 };
          this.references.push(ref);
          this.writeValue(resultPtr, this.references.length - 1);
        }
        return NAPI_OK;
      }),
      napi_unwrap: this.wrap((envPtr, jsObjectIdx, resultPtr) => {
        const jsObject = this.load(jsObjectIdx);
        if (!this.wrapData.has(jsObject)) {
          return NAPI_INVALID_ARG;
        }
        this.view.setUint32(resultPtr, this.wrapData.get(jsObject), true);
        return NAPI_OK;
      }),
      napi_remove_wrap: this.wrap((envPtr, jsObjectIdx, resultPtr) => {
        const jsObject = this.load(jsObjectIdx);
        if (!this.wrapData.has(jsObject)) {
          return NAPI_INVALID_ARG;
        }
        const nativeObjectPtr = this.wrapData.get(jsObject);
        this.wrapData.delete(jsObject);
        this.finalizationRegistry.unregister(jsObject);
        this.writeValue(resultPtr, nativeObjectPtr);
        return NAPI_OK;
      }),
      napi_type_tag_object: this.wrap((envPtr, jsObjectIdx, typeTagPtr) => {
        const jsObject = this.load(jsObjectIdx);
        if (!util.types.isObject(jsObject)) {
          return NAPI_OBJECT_EXPECTED;
        }
        if (this.typeTags.has(jsObject)) {
          return NAPI_INVALID_ARG;
        }
        const typeTag = {
          upper: this.view.getBigUint64(typeTagPtr),
          lower: this.view.getBigUint64(typeTagPtr + 8),
        };
        this.typeTags.set(jsObject, typeTag);
        return NAPI_OK;
      }),
      napi_check_object_type_tag: this.wrap((envPtr, jsObjectIdx, typeTagPtr, resultPtr) => {
        const jsObject = this.load(jsObjectIdx);
        if (!util.types.isObject(jsObject)) {
          return NAPI_OBJECT_EXPECTED;
        }
        const typeTag = {
          upper: this.view.getBigUint64(typeTagPtr),
          lower: this.view.getBigUint64(typeTagPtr + 8),
        };
        const thisTag = this.typeTags.get(jsObject);
        if (thisTag) {
          this.view.setUint32(
            resultPtr,
            typeTag.upper === thisTag.upper && typeTag.lower === thisTag.lower,
          );
        } else {
          this.view.setUint32(resultPtr, 0);
        }
        return NAPI_OK;
      }),
      napi_add_finalizer: this.wrap((envPtr, jsObjectIdx, nativeObjectPtr, finalizeCb, finalizeHint, resultPtr) => {
        const jsObject = this.load(jsObjectIdx);
        this.finalizationRegistry
          .register(jsObject, [finalizeCb, envPtr, nativeObjectPtr, finalizeHint]);
        if (resultPtr !== 0) {
          const ref = { value: jsObject, ref: 1 };
          this.references.push(ref);
          this.writeValue(resultPtr, this.references.length - 1);
        }
        return NAPI_OK;
      }),

      napi_create_promise: this.wrap((envPtr, deferredPtr, promisePtr) => {
        let resolve;
        let reject;
        const promise = new Promise((r, j) => {
          resolve = r;
          reject = j;
        });
        const deferred = { resolve, reject };
        this.writeValue(deferredPtr, this.store(deferred));
        this.writeValue(promisePtr, this.store(promise));
        return NAPI_OK;
      }),
      napi_resolve_deferred: this.wrap((envPtr, deferredIdx, resolutionIdx) => {
        const deferred = this.load(deferredIdx);
        const resolution = this.load(resolutionIdx);
        deferred.resolve(resolution);
        return NAPI_OK;
      }),
      napi_reject_deferred: this.wrap((envPtr, deferredIdx, rejectionIdx) => {
        const deferred = this.load(deferredIdx);
        const rejection = this.load(rejectionIdx);
        deferred.resolve(rejection);
        return NAPI_OK;
      }),
      napi_is_promise: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.view.setUint8(resultPtr, util.types.isPromise(this.load(valueIdx)));
      }),
      // napi_run_script: this.wrap((envPtr, scriptIdx, resultPtr) => {
      //   const script = this.load(scriptIdx);
      //   const result = vm.runInThisContext(script);
      //   this.writeValue(resultPtr, this.store(result));
      //   return NAPI_OK;
      // }),
      napi_set_instance_data: this.wrap((envPtr, data, finalizeCb, finalizeHint) => {
        let instanceObject = { data }
        this.finalizationRegistry
          .register(instanceObject, [finalizeCb, envPtr, data, finalizeHint]);
        this.instanceData = instanceObject
      }),
      napi_get_instance_data: this.wrap((envPtr, dataPtr) => {
        this.writeValue(dataPtr, this.instanceData.data);
      }),
    };
  }

  refreshMemory() {
    if (this.view.byteLength === 0) {
      this.view = new DataView(this.memory.buffer);
    }
  }

  openHandleScope(escapable) {
    const scope = {
      escapable,
      start: this.handles.length,
      escaped: false,
      escapeSlot: escapable
        ? this.store(undefined)
        : undefined,
    };
    this.scopes.push(scope);
    return this.scopes.length - 1;
  }

  closeHandleScope(scopePtr) {
    const scope = this.scopes[scopePtr];
    if (this.scopes.length - 1 !== scopePtr) {
      throw new Error();
    }
    this.scopes.pop();
    this.handles.length = scope.start;
  }

  store(obj) {
    const idx = this.handles.length;
    this.handles.push(obj);
    return idx;
  }

  load(idx) {
    return this.handles[idx];
  }

  readValue(ptr) {
    return this.view.getUint32(ptr, true);
  }

  writeValue(ptr, idx) {
    this.view.setUint32(ptr, idx, true);
  }

  readCStringFrom(ptr) {
    const u8 = new Uint8Array(this.memory.buffer);
    const end = u8.indexOf(0, ptr);
    return this.readString(ptr, end - ptr);
  }

  readString(index, length, encoding = 'utf8') {
    if (length === NAPI_AUTO_LENGTH) {
      return this.readCStringFrom(index);
    }
    return Buffer.from(this.memory.buffer, index, length).toString(encoding);
  }

  init(instance) {
    this.memory = instance.exports.memory;
    this.view = new DataView(this.memory.buffer);
    this.indirectFunctionTable = instance.exports.__indirect_function_table;
    const scope = this.openHandleScope(false);
    const register = instance.exports.napi_register_wasm_v1
      || instance.exports.napi_register_module_v1;
    try {
      const idx = register(this.store({}), this.store({}));
      return this.load(idx);
    } finally {
      this.closeHandleScope(scope);
      if (this.exception !== kNoException) {
        const e = this.exception;
        this.exception = kNoException;
        throw e; // eslint-disable-line no-unsafe-finally
      }
    }
  }
}
