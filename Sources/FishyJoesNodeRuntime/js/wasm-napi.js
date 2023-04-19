'use strict';

// adapted from https://github.com/devsnek/napi-wasi-experiments/blob/main/napi.js

// const vm = require('vm');
import util from 'util';
import { Buffer } from 'buffer';

const NAPI_AUTO_LENGTH = -1 >>> 0;

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

const error_messages = [
  undefined,
  "Invalid argument",
  "An object was expected",
  "A string was expected",
  "A string or symbol was expected",
  "A function was expected",
  "A number was expected",
  "A boolean was expected",
  "An array was expected",
  "Unknown failure",
  "An exception is pending",
  "The async work item was cancelled",
  "napi_escape_handle already called on scope",
  "Invalid handle scope usage",
  "Invalid callback scope usage",
  "Thread-safe function queue is full",
  "Thread-safe function handle is closing",
  "A bigint was expected",
  "A date was expected",
  "An arraybuffer was expected",
  "A detachable arraybuffer was expected",
  "Main thread would deadlock",
];

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

const NAPI_THREADSAFE_FUNCTION_RELEASE_MODE_RELEASE = 0;
const NAPI_THREADSAFE_FUNCTION_RELEASE_MODE_ABORT = 1;

const NAPI_THREADSAFE_FUNCTION_CALL_MODE_NONBLOCKING = 0;
const NAPI_THREADSAFE_FUNCTION_CALL_MODE_BLOCKING = 1;

const kFuncNormal = Symbol('kFuncNormal');
const kFuncConstructor = Symbol('kFuncConstructor');
const kFuncMethod = Symbol('kFuncMethod');

const kNoException = Symbol('kNoException');

const hasOwnProperty = Function.prototype.call.bind(Object.prototype.hasOwnProperty);

export class NAPI {
  constructor() {
    this.indirectFunctionTable = undefined;
    this.memory = undefined;
    this.malloc = undefined;
    this.free = undefined;
    this.errorMessageTable = undefined;
    this.view = undefined;
    this.instanceData = { data: 0 };

    this.scopes = [];
    this.handles = [Symbol("NULL_HANDLE_DEREFERENCE")];
    this.nextRef = 1;
    this.references = {};

    this.externalData = new WeakMap();
    this.wrapData = new WeakMap();
    this.typeTags = new WeakMap();
    this.finalizationRegistry = new FinalizationRegistry((item) => {
      const [cbIdx, envPtr, data, hint] = item
      try {
        if (cbIdx !== 0) {
          this.indirectFunctionTable.get(cbIdx)(envPtr, data, hint);
        }
      } catch (e) {
        console.error("Error calling finalization callback");
        throw e;
      }
    });

    this.exception = kNoException;
    this.lastErrorCode = NAPI_OK;
    this.extendedErrorInfoPtr = undefined;
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

  clearError() {
    this.exception = kNoException;
    this.lastErrorCode = NAPI_OK;
  }

  returnError(errorCode) {
    if (errorCode !== NAPI_OK) {
      console.trace();
      console.warn(`NAPI error ${errorCode}: ${error_messages[errorCode]}`);
    }
    return errorCode
  }

  createFunction(envPtr, cb, data, name = undefined, mode = kFuncNormal, owner = undefined) {
    const self = this;
    const f = self.indirectFunctionTable.get(cb);
    let func;
    if (mode === kFuncConstructor) {
      func = (0, function (...args) {
        self.clearError()
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
          return idx === 0 ? undefined : self.load(idx);
        } finally {
          self.closeHandleScope(scope);
          if (self.exception !== kNoException) {
            const e = self.exception;
            self.exception = kNoException;
            throw e; // nosonar eslint-disable-line no-unsafe-finally
          }
        }
      });
    } else {
      func = (0, function (...args) {
        self.clearError()
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
          return idx === 0 ? undefined : self.load(idx);
        } finally {
          self.closeHandleScope(scope);
          if (self.exception !== kNoException) {
            const e = self.exception;
            self.exception = kNoException;
            throw e; // nosonar eslint-disable-line no-unsafe-finally
          }
        }
      });
    }
    if (typeof name !== 'undefined') {
      Object.defineProperty(func, 'name', {
        value: name,
        configurable: true,
      });
    }
    return func;
  }

  readPropertyDescriptors(count, ptr) {
    count >>>= 0;
    const descriptors = [];
    for (let i = 0; i < count; i += 1) {
      const utf8namePtr = this.readU32(ptr);
      ptr += 4;
      const nameIdx = this.readU32(ptr);
      ptr += 4;
      const method = this.readU32(ptr);
      ptr += 4;
      const getter = this.readU32(ptr);
      ptr += 4;
      const setter = this.readU32(ptr);
      ptr += 4;
      const valueIdx = this.readU32(ptr);
      ptr += 4;
      const attributes = this.readU32(ptr);
      ptr += 4;
      const dataPtr = this.readU32(ptr);
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
      if ((attributes & NAPI_STATIC) !== 0) {
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
      return this.returnError(NAPI_STRING_EXPECTED);
    }
    const e = new C(msg);
    if (codeIdx !== 0) {
      e.code = this.load(codeIdx);
    }
    this.writeU32(resultPtr, this.store(e));
    return NAPI_OK;
  }

  makeExports() {
    return {
      napi: this.makeNAPIExports(),
      env: this.makeEnvExports(),
    }
  }

  makeEnvExports() {
    // Needed to support various C/C++ features
    let tempRet0 = 0;
    return {
      setTempRet0: (value) => { tempRet0 = value; },
      getTempRet0: () => tempRet0,
      mprotect: () => 0
    };
  }

  makeNAPIExports() {
    return {
      napi_get_last_error_info: (envPtr, extendedErrorInfoPtrPtr) => {
        this.writeU32(this.extendedErrorInfoPtr + 0, this.readU32(this.errorMessageTable + 4 * this.lastErrorCode)); // const char* error_message
        this.writeU32(this.extendedErrorInfoPtr + 4, 0); // void* engine_reserved
        this.writeU32(this.extendedErrorInfoPtr + 8, 0); // uint32_t engine_error_code
        this.writeU32(this.extendedErrorInfoPtr + 12, this.lastErrorCode); // napi_status error_code
        this.writeU32(extendedErrorInfoPtrPtr, this.extendedErrorInfoPtr);
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
          return this.returnError(NAPI_GENERIC_FAILURE);
        }
        const e = this.exception;
        this.exception = kNoException;
        this.writeU32(resultPtr, this.store(e));
        return NAPI_OK;
      }, true),
      napi_is_exception_pending: this.wrap((envPtr, resultPtr) => {
        this.writeU8(resultPtr, this.exception !== kNoException);
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
        this.writeU32(resultPtr, idx);
        return NAPI_OK;
      }),
      napi_close_handle_scope: this.wrap((envPtr, scopePtr) => {
        this.closeHandleScope(scopePtr);
        return NAPI_OK;
      }, true),
      napi_open_escapable_handle_scope: this.wrap((envPtr, resultPtr) => {
        const idx = this.openHandleScope(true);
        this.writeU32(resultPtr, idx);
        return NAPI_OK;
      }),
      napi_close_escapable_handle_scope: this.wrap((envPtr, scopePtr) => {
        this.closeHandleScope(scopePtr);
        return NAPI_OK;
      }, true),
      napi_escape_handle: this.wrap((envPtr, scopePtr, escapeeIdx, resultPtr) => {
        const scope = this.scopes[scopePtr];
        if (!scope.escapable) {
          return this.returnError(NAPI_HANDLE_SCOPE_MISMATCH);
        }
        if (scope.escaped) {
          return this.returnError(NAPI_ESCAPE_CALLED_TWICE);
        }
        scope.escaped = true;
        this.handles[scope.escapeSlot] = this.load(escapeeIdx);
        this.writeU32(resultPtr, scope.escapeSlot);
        return NAPI_OK;
      }, true),

      napi_create_reference: this.wrap((envPtr, valueIdx, initialRefcount, resultPtr) => {
        const value = this.load(valueIdx);
        this.writeU32(resultPtr, this.createReference(value, initialRefcount));
        return NAPI_OK;
      }),
      napi_delete_reference: (envPtr, refIdx) => {
        delete this.references[refIdx];
        return NAPI_OK;
      },
      napi_reference_ref: this.wrap((envPtr, refIdx, resultPtr) => {
        const ref = this.references[refIdx];
        if (ref.ref < 0) {
          return this.returnError(NAPI_GENERIC_FAILURE);
        } else if (ref.ref === 0) {
          // convert weak reference to strong
          ref.value = ref.value.deref()
        }
        ref.ref += 1;
        if (resultPtr) {
          this.writeU32(resultPtr, ref.ref);
        }
        return NAPI_OK;
      }),
      napi_reference_unref: this.wrap((envPtr, refIdx, resultPtr) => {
        const ref = this.references[refIdx];
        if (ref.ref <= 0) {
          return NAPI_GENERIC_FAILURE;
        }
        ref.ref -= 1;
        if (ref.ref === 0) {
          // convert strong reference to weak
          ref.value = new WeakRef(ref.value)
        }
        if (resultPtr) {
          this.writeU32(resultPtr, ref.ref);
        }
        return NAPI_OK;
      }),
      napi_get_reference_value: this.wrap((envPtr, refIdx, resultPtr) => {
        const ref = this.references[refIdx]
        if (ref.ref > 0) {
          // strong
          this.writeU32(resultPtr, this.store(ref.value));
        } else {
          // weak
          const value = ref.value.deref()
          // if (value === undefined) {
          //   this.writeU32(resultPtr, 0);
          // } else {
            this.writeU32(resultPtr, this.store(value));
          // }
        }
        return NAPI_OK;
      }),

      // No-op env cleanup
      napi_add_env_cleanup_hook: () => NAPI_OK,
      napi_remove_env_cleanup_hook: () => NAPI_OK,

      napi_create_array: this.wrap((envPtr, resultPtr) => {
        this.writeU32(resultPtr, this.store([]));
        return NAPI_OK;
      }),
      napi_create_array_with_length: this.wrap((envPtr, length, resultPtr) => {
        length >>>= 0;
        this.writeU32(resultPtr, this.store(new Array(length)));
        return NAPI_OK;
      }),
      napi_create_arraybuffer: this.wrap((envPtr, length, dataPtr, resultPtr) => {
        length >>>= 0;
        dataPtr >>>= 0;
        this.writeU32(resultPtr, this.store(this.memory.buffer.slice(dataPtr, dataPtr + length)));
        return NAPI_OK;
      }),
      // napi_create_buffer
      // napi_create_buffer_copy
      napi_create_date: this.wrap((envPtr, time, resultPtr) => {
        this.writeU32(resultPtr, this.store(new Date(time)));
        return NAPI_OK;
      }),
      napi_create_external: this.wrap((envPtr, data, finalizeCb, finalizeHint, resultPtr) => {
        const obj = {};
        this.finalizationRegistry
          .register(obj, [finalizeCb, envPtr, data, finalizeHint]);
        this.externalData.set(obj, data);
        let idx = this.store(obj);
        this.writeU32(resultPtr, idx);
        return NAPI_OK;
      }),
      // napi_create_external_arraybuffer
      // napi_create_external_buffer
      napi_create_object: this.wrap((envPtr, resultPtr) => {
        this.writeU32(resultPtr, this.store({}));
        return NAPI_OK;
      }),
      napi_create_symbol: this.wrap((envPtr, descriptionIdx, resultPtr) => {
        let symbol
        if (descriptionIdx === 0) {
          symbol = Symbol()
        } else {
          symbol = Symbol(this.load(descriptionIdx));
        }
        this.writeU32(resultPtr, this.store(symbol));
        return NAPI_OK;
      }),
      napi_create_typedarray: this.wrap((envPtr, type, length, arraybufferIdx, byteOffset, resultPtr) => {
        length >>>= 0;
        byteOffset >>>= 0;
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
        this.writeU32(resultPtr, this.store(ab));
        return NAPI_OK;
      }),
      napi_create_dataview: this.wrap((envPtr, byteLength, arraybufferIdx, byteOffset, resultPtr) => {
        byteLength >>>= 0;
        byteOffset >>>= 0;
        let buffer = this.load(arraybufferIdx)
        if (byteOffset + byteLength > buffer.byteLength) {
          throw new RangeError();
        }
        const dv = new DataView(buffer, byteOffset, byteLength);
        this.writeU32(resultPtr, this.store(dv));
        return NAPI_OK;
      }),
      napi_create_int32: this.wrap((envPtr, value, resultPtr) => {
        this.writeU32(resultPtr, this.store(value));
        return NAPI_OK;
      }),
      napi_create_uint32: this.wrap((envPtr, value, resultPtr) => {
        value >>>= 0;
        this.writeU32(resultPtr, this.store(value));
        return NAPI_OK;
      }),
      napi_create_int64: this.wrap((envPtr, value, resultPtr) => {
        this.writeU32(resultPtr, this.store(Number(value)));
        return NAPI_OK;
      }),
      napi_create_double: this.wrap((envPtr, value, resultPtr) => {
        this.writeU32(resultPtr, this.store(value));
        return NAPI_OK;
      }),
      napi_create_bigint_int64: this.wrap((envPtr, value, resultPtr) => {
        this.writeU32(resultPtr, this.store(value));
        return NAPI_OK;
      }),
      napi_create_bigint_uint64: this.wrap((envPtr, value, resultPtr) => {
        this.writeU32(resultPtr, this.store(BigInt.asUintN(64, value)));
        return NAPI_OK;
      }),
      napi_create_bigint_words: this.wrap((envPtr, signBit, wordCount, wordsPtr, resultPtr) => {
        // For compatibility with node's version of BigInt
        if (wordCount < 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        if (wordCount > (1 << 22)) {
          throw new RangeError("Maximum BigInt size exceeded");
        }

        let b = 0n;
        let shift = 0n;
        for (let i = 0; i < wordCount; i += 1) {
          const word = this.readU64(wordsPtr + (i * 8));
          b += word << shift;
          shift += 64n;
        }
        const value = BigInt((-1) ** signBit) * b;
        this.writeU32(resultPtr, this.store(value));
        return NAPI_OK;
      }),
      napi_create_string_latin1: this.wrap((envPtr, strPtr, length, resultPtr) => {
        if (envPtr === 0 || (length !== 0 && strPtr === 0) || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const str = this.readString(strPtr, length, 'latin1');
        this.writeU32(resultPtr, this.store(str));
        return NAPI_OK;
      }),
      napi_create_string_utf16: this.wrap((envPtr, strPtr, length, resultPtr) => {
        if (envPtr === 0 || (length !== 0 && strPtr === 0) || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const str = this.readString(strPtr, length, 'utf16le');
        this.writeU32(resultPtr, this.store(str));
        return NAPI_OK;
      }),
      napi_create_string_utf8: this.wrap((envPtr, strPtr, length, resultPtr) => {
        if (envPtr === 0 || (length !== 0 && strPtr === 0) || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const str = this.readString(strPtr, length, 'utf8');
        this.writeU32(resultPtr, this.store(str));
        return NAPI_OK;
      }),

      napi_get_array_length: this.wrap((envPtr, valueIdx, resultPtr) => {
        const a = this.load(valueIdx);
        if (!util.isArray(a)) {
          return this.returnError(NAPI_ARRAY_EXPECTED);
        }
        this.writeU32(resultPtr, a.length);
        return NAPI_OK;
      }),
      napi_get_prototype: this.wrap((envPtr, valueIdx, resultPtr) => {
        if (envPtr === 0 || valueIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const proto = Object.getPrototypeOf(this.load(valueIdx));
        this.writeU32(resultPtr, this.store(proto));
        return NAPI_OK;
      }),
      napi_get_typedarray_info: this.wrap((envPtr, typedarrayIdx, typePtr, lengthPtr, dataPtr, arraybufferPtr, byteOffsetPtr) => {
        const typedArray = this.load(typedarrayIdx);
        if (!util.types.isTypedArray(typedArray)) {
          return this.returnError(NAPI_ARRAYBUFFER_EXPECTED);
        }
        this.writeU32(typePtr, {
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
        this.writeU32(lengthPtr, typedArray.length);
        this.writeU32(dataPtr, 0);
        this.writeU32(arraybufferPtr, this.store(typedArray.buffer));
        this.writeU32(byteOffsetPtr, typedArray.byteOffset);
        return NAPI_OK;
      }),
      napi_get_dataview_info: this.wrap((envPtr, dataviewIdx, byteLengthPtr, dataPtr, arraybufferPtr, byteOffsetPtr) => {
        const dataView = this.load(dataviewIdx);
        if (!util.types.isDataView(dataView)) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        this.writeU32(byteLengthPtr, dataView.byteLength);
        this.writeU32(dataPtr, 0);
        this.writeU32(arraybufferPtr, this.store(dataView.buffer));
        this.writeU32(byteOffsetPtr, dataView.byteOffset);
        return NAPI_OK;
      }),
      napi_get_date_value: this.wrap((envPtr, valueIdx, resultPtr) => {
        const d = this.load(valueIdx);
        if (!util.types.isDate(d)) {
          return this.returnError(NAPI_DATE_EXPECTED);
        }
        this.writeF64(resultPtr, d.getTime());
        return NAPI_OK;
      }),
      napi_get_value_bool: this.wrap((envPtr, valueIdx, resultPtr) => {
        if (envPtr === 0 || valueIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const b = this.load(valueIdx);
        if (typeof b !== 'boolean') {
          return this.returnError(NAPI_BOOLEAN_EXPECTED);
        }
        this.writeU8(resultPtr, b);
        return NAPI_OK;
      }),
      napi_get_value_double: this.wrap((envPtr, valueIdx, resultPtr) => {
        if (envPtr === 0 || valueIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const v = this.load(valueIdx);
        if (typeof v !== 'number') {
          return this.returnError(NAPI_NUMBER_EXPECTED);
        }
        this.writeF64(resultPtr, v);
        return NAPI_OK;
      }),
      napi_get_value_bigint_int64: this.wrap((envPtr, valueIdx, resultPtr, losslessPtr) => {
        const b = this.load(valueIdx);
        if (typeof b !== 'bigint') {
          return this.returnError(NAPI_BIGINT_EXPECTED);
        }
        if (losslessPtr !== 0) {
          this.writeU8(losslessPtr, BigInt.asIntN(64, b) === b);
        }
        this.writeI64(resultPtr, b);
        return NAPI_OK;
      }),
      napi_get_value_bigint_uint64: this.wrap((envPtr, valueIdx, resultPtr, losslessPtr) => {
        const b = this.load(valueIdx);
        if (typeof b !== 'bigint') {
          return this.returnError(NAPI_BIGINT_EXPECTED);
        }
        if (losslessPtr !== 0) {
          this.writeU8(losslessPtr, BigInt.asUintN(64, b) === b);
        }
        this.writeU64(resultPtr, b);
        return NAPI_OK;
      }),
      napi_get_value_bigint_words: this.wrap((envPtr, valueIdx, signBitPtr, wordCountPtr, wordsPtr) => {
        const b = this.load(valueIdx);
        if (typeof b !== 'bigint') {
          return this.returnError(NAPI_BIGINT_EXPECTED);
        }
        if (signBitPtr !== 0) {
          this.writeU8(signBitPtr, b < 0n);
        }
        const wordCount = this.readU32(wordCountPtr);
        let i = 0;
        let ull = b < 0n ? -b : b;
        for (; i < wordCount, ull > 0; i += 1) {
          const bv = ull & ((1n << 64n) - 1n);
          this.writeU64(wordsPtr + (i * 8), bv);
          ull >>= 64n;
        }
        while (ull > 0) {
          i += 1;
          ull >>= 64n;
        }
        this.writeU32(wordCountPtr, i);
        return NAPI_OK;
      }),
      napi_get_value_external: this.wrap((envPtr, valueIdx, resultPtr) => {
        const e = this.load(valueIdx);
        if (!this.externalData.has(e)) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        this.writeU32(resultPtr, this.externalData.get(e));
        return NAPI_OK;
      }),
      napi_get_value_int32: this.wrap((envPtr, valueIdx, resultPtr) => {
        if (envPtr === 0 || valueIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        let n = this.load(valueIdx);
        if (typeof n !== 'number') {
          return this.returnError(NAPI_NUMBER_EXPECTED);
        }
        this.writeI32(resultPtr, isFinite(n) ? n : 0);
        return NAPI_OK;
      }),
      napi_get_value_int64: this.wrap((envPtr, valueIdx, resultPtr) => {
        if (envPtr === 0 || valueIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        let n = this.load(valueIdx);
        if (typeof n !== 'number') {
          return this.returnError(NAPI_NUMBER_EXPECTED);
        }
        this.writeI64(resultPtr, BigInt(isFinite(n) ? Math.trunc(n) : 0));
        return NAPI_OK;
      }),
      napi_get_value_string_latin1: this.wrap((envPtr, valueIdx, bufPtr, bufSize, resultPtr) => {
        bufPtr >>>= 0;
        bufSize >>>= 0;
        if (envPtr === 0 || valueIdx === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const s = this.load(valueIdx);
        if (typeof s !== 'string') {
          return this.returnError(NAPI_STRING_EXPECTED);
        }
        if (bufPtr === 0) {
          if (resultPtr === 0) {
            return this.returnError(NAPI_INVALID_ARG);
          }
          this.writeU32(resultPtr, s.length)
        } else {
          const written = Buffer.from(this.memory.buffer).write(s, bufPtr, bufSize - 1, 'latin1');
          this.writeU8(bufPtr + written, 0);
          this.writeU32(resultPtr, written);
        }
        return NAPI_OK;
      }),
      napi_get_value_string_utf8: this.wrap((envPtr, valueIdx, bufPtr, bufSize, resultPtr) => {
        bufPtr >>>= 0;
        bufSize >>>= 0;
        if (envPtr === 0 || valueIdx === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const s = this.load(valueIdx);
        if (typeof s !== 'string') {
          return this.returnError(NAPI_STRING_EXPECTED);
        }
        if (bufPtr === 0) {
          if (resultPtr === 0) {
            return this.returnError(NAPI_INVALID_ARG);
          }
          const length = (new TextEncoder()).encode(s).length;
          this.writeU32(resultPtr, length);
        } else {
          const written = Buffer.from(this.memory.buffer).write(s, bufPtr, bufSize - 1, 'utf8');
          this.writeU8(bufPtr + written, 0);
          this.writeU32(resultPtr, written);
        }
        return NAPI_OK;
      }),
      napi_get_value_string_utf16: this.wrap((envPtr, valueIdx, bufPtr, bufSize, resultPtr) => {
        bufPtr >>>= 0;
        bufSize >>>= 0;
        if (envPtr === 0 || valueIdx === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const s = this.load(valueIdx);
        if (typeof s !== 'string') {
          return this.returnError(NAPI_STRING_EXPECTED);
        }
        if (bufPtr === 0) {
          if (resultPtr === 0) {
            return this.returnError(NAPI_INVALID_ARG);
          }
          this.writeU32(resultPtr, s.length)
        } else {
          const written = Buffer.from(this.memory.buffer).write(s, bufPtr, (bufSize - 1) * 2, 'utf16le');
          this.writeU8(bufPtr + written, 0);
          this.writeU8(bufPtr + written + 1, 0);
          this.writeU32(resultPtr, written / 2);
        }
        return NAPI_OK;
      }),
      napi_get_value_uint32: this.wrap((envPtr, valueIdx, resultPtr) => {
        if (envPtr === 0 || valueIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        let n = this.load(valueIdx);
        if (typeof n !== 'number') {
          return this.returnError(NAPI_NUMBER_EXPECTED);
        }
        this.writeU32(resultPtr, isFinite(n) ? n : 0);
        return NAPI_OK;
      }),
      napi_get_boolean: this.wrap((envPtr, value, resultPtr) => {
        this.writeU32(resultPtr, this.store(Boolean(value)));
        return NAPI_OK;
      }),
      napi_get_global: this.wrap((envPtr, resultPtr) => {
        this.writeU32(resultPtr, this.store(globalThis));
        return NAPI_OK;
      }),
      napi_get_null: this.wrap((envPtr, resultPtr) => {
        this.writeU32(resultPtr, this.store(null));
        return NAPI_OK;
      }),
      napi_get_undefined: this.wrap((envPtr, resultPtr) => {
        this.writeU32(resultPtr, this.store(undefined));
        return NAPI_OK;
      }),
      napi_coerce_to_bool: this.wrap((envPtr, valueIdx, resultPtr) => {
        if (envPtr === 0 || valueIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        this.writeU32(resultPtr, this.store(Boolean(this.load(valueIdx))));
        return NAPI_OK;
      }),
      napi_coerce_to_number: this.wrap((envPtr, valueIdx, resultPtr) => {
        if (envPtr === 0 || valueIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        this.writeU32(resultPtr, this.store(Number(this.load(valueIdx))));
        return NAPI_OK;
      }),
      napi_coerce_to_object: this.wrap((envPtr, valueIdx, resultPtr) => {
        if (envPtr === 0 || valueIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        this.writeU32(resultPtr, this.store(Object(this.load(valueIdx))));
        return NAPI_OK;
      }),
      napi_coerce_to_string: this.wrap((envPtr, valueIdx, resultPtr) => {
        if (envPtr === 0 || valueIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const value = this.load(valueIdx)
        if (typeof value === 'symbol') {
          throw new TypeError()
        }
        this.writeU32(resultPtr, this.store(String(value)));
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
        this.writeU32(resultPtr, vt);
        return NAPI_OK;
      }),
      napi_instanceof: this.wrap((envPtr, objectIdx, constructorIdx, resultPtr) => {
        const object = this.load(objectIdx);
        const cons = this.load(constructorIdx);
        if (typeof cons !== 'function') {
          this.exception = new TypeError('Constructor must be a function');
          return this.returnError(NAPI_FUNCTION_EXPECTED);
        }
        this.writeU8(resultPtr, object instanceof cons);
        return NAPI_OK;
      }),
      napi_is_array: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.writeU8(resultPtr, util.isArray(this.load(valueIdx)));
        return NAPI_OK;
      }),
      napi_is_arraybuffer: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.writeU8(resultPtr, util.types.isArrayBuffer(this.load(valueIdx)));
        return NAPI_OK;
      }),
      napi_is_buffer: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.writeU8(resultPtr, Buffer.isBuffer(this.load(valueIdx)));
        return NAPI_OK;
      }),
      napi_is_date: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.writeU8(resultPtr, util.types.isDate(this.load(valueIdx)));
        return NAPI_OK;
      }),
      napi_is_error: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.writeU8(resultPtr, util.types.isNativeError(this.load(valueIdx)));
        return NAPI_OK;
      }),
      napi_is_typedarray: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.writeU8(resultPtr, util.types.isTypedArray(this.load(valueIdx)));
        return NAPI_OK;
      }),
      napi_is_dataview: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.writeU8(resultPtr, util.types.isDataView(this.load(valueIdx)));
        return NAPI_OK;
      }),
      napi_strict_equals: this.wrap((envPtr, lhsIdx, rhsIdx, resultPtr) => {
        this.writeU8(resultPtr, this.load(lhsIdx) === this.load(rhsIdx));
        return NAPI_OK;
      }),
      napi_detach_arraybuffer: this.wrap((env, valueIdx) => {
        const ab = this.load(valueIdx);
        if (!util.types.isArrayBuffer(ab)) {
          return this.returnError(NAPI_DETACHABLE_ARRAYBUFFER_EXPECTED);
        }
        return NAPI_OK;
      }),
      napi_is_detached_arraybuffer: this.wrap((envPtr, valueIdx, resultPtr) => {
        const ab = this.load(valueIdx);
        if (!util.types.isArrayBuffer(ab)) {
          return this.returnError(NAPI_ARRAYBUFFER_EXPECTED);
        }
        this.writeU8(resultPtr, false);
        return NAPI_OK;
      }),
      napi_get_property_names: this.wrap((envPtr, valueIdx, resultPtr) => {
        if (envPtr === 0 || valueIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        let object = this.load(valueIdx);
        // from https://stackoverflow.com/a/59341249/73681
        const result = []
        for (let key in object) {
          result.push(key);
        }
        this.writeU32(resultPtr, this.store(result));
        return NAPI_OK;
      }),
      napi_get_all_property_names: this.wrap((envPtr, valueIdx, keyMode, keyFilter, keyConversion, resultPtr) => {
        if (envPtr === 0 || valueIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
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

        const keys = targets.flatMap((target) => {
          const descriptors = Object.getOwnPropertyDescriptors(target)
          return Reflect.ownKeys(descriptors).filter(name => {
            const d = target[name];
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
            .map(name => {
              if (numbersAsStrings) {
                return name;
              }
              const nameNum = +name;
              if (nameNum.toString() === name && nameNum >= 0 && nameNum < 2 ** 53 - 1) {
                return nameNum;
              }
              return name;
            })
        });

        this.writeU32(resultPtr, this.store(keys.flat()));
        return NAPI_OK;
      }),
      napi_set_property: this.wrap((envPtr, objectIdx, keyIdx, valueIdx) => {
        if (envPtr === 0 || objectIdx === 0 || keyIdx === 0 || valueIdx === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const object = this.load(objectIdx);
        const key = this.load(keyIdx);
        const value = this.load(valueIdx);
        object[key] = value;
        return NAPI_OK;
      }),
      napi_get_property: this.wrap((envPtr, objectIdx, keyIdx, resultPtr) => {
        if (envPtr === 0 || objectIdx === 0 || keyIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const object = this.load(objectIdx);
        const key = this.load(keyIdx);
        this.writeU32(resultPtr, this.store(object[key]));
        return NAPI_OK;
      }),
      napi_has_property: this.wrap((envPtr, objectIdx, keyIdx, resultPtr) => {
        if (envPtr === 0 || objectIdx === 0 || keyIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const object = this.load(objectIdx);
        const key = this.load(keyIdx);
        this.writeU8(resultPtr, key in object);
        return NAPI_OK;
      }),
      napi_delete_property: this.wrap((envPtr, objectIdx, keyIdx, resultPtr) => {
        if (envPtr === 0 || objectIdx === 0 || keyIdx === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const object = this.load(objectIdx);
        const key = this.load(keyIdx);
        let success = false
        try {
          // deleting a non-configurable property is a TypeError in strict mode
          success = delete object[key];
        } catch (e) {
          if (!(e instanceof TypeError)) {
            throw e;
          }
        }
        if (resultPtr != 0) {
          this.writeU8(resultPtr, success);
        }
        return NAPI_OK;
      }),
      napi_has_own_property: this.wrap((envPtr, objectIdx, keyIdx, resultPtr) => {
        if (envPtr === 0 || objectIdx === 0 || keyIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const object = this.load(objectIdx);
        const key = this.load(keyIdx);
        if (typeof key !== 'string' && typeof key !== 'symbol') {
          return this.returnError(NAPI_NAME_EXPECTED);
        }
        this.writeU8(resultPtr, hasOwnProperty(object, key));
        return NAPI_OK;
      }),
      napi_set_named_property: this.wrap((envPtr, objectIdx, utf8NamePtr, valueIdx) => {
        if (envPtr === 0 || objectIdx === 0 || utf8NamePtr === 0 || valueIdx === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const object = this.load(objectIdx);
        const name = this.readCStringFrom(utf8NamePtr);
        const value = this.load(valueIdx);
        object[name] = value;
        return NAPI_OK;
      }),
      napi_get_named_property: this.wrap((envPtr, objectIdx, utf8NamePtr, resultPtr) => {
        if (envPtr === 0 || objectIdx === 0 || utf8NamePtr === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const object = this.load(objectIdx);
        const name = this.readCStringFrom(utf8NamePtr);
        this.writeU32(resultPtr, this.store(object[name]));
        return NAPI_OK;
      }),
      napi_has_named_property: this.wrap((envPtr, objectIdx, utf8NamePtr, resultPtr) => {
        if (envPtr === 0 || objectIdx === 0 || utf8NamePtr === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const object = this.load(objectIdx);
        const key = this.readCStringFrom(utf8NamePtr);
        this.writeU8(resultPtr, key in object);
        return NAPI_OK;
      }),
      napi_set_element: this.wrap((envPtr, objectIdx, index, valueIdx) => {
        if (envPtr === 0 || objectIdx === 0 || valueIdx === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        index >>>= 0;
        this.load(objectIdx)[index] = this.load(valueIdx);
        return NAPI_OK;
      }),
      napi_get_element: this.wrap((envPtr, objectIdx, index, resultPtr) => {
        if (envPtr === 0 || objectIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        index >>>= 0;
        this.writeU32(resultPtr, this.store(this.load(objectIdx)[index]));
        return NAPI_OK;
      }),
      napi_has_element: this.wrap((envPtr, objectIdx, index, resultPtr) => {
        if (envPtr === 0 || objectIdx === 0 || resultPtr === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        index >>>= 0;
        const object = this.load(objectIdx);
        this.writeU8(resultPtr, hasOwnProperty(object, index));
        return NAPI_OK;
      }),
      napi_delete_element: this.wrap((envPtr, objectIdx, index, resultPtr) => {
        if (envPtr === 0 || objectIdx === 0) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        index >>>= 0;
        const object = this.load(objectIdx);
        let success = false
        try {
          // deleting a non-configurable property is a TypeError in strict mode
          success = delete object[index];
        } catch (e) {
          if (!(e instanceof TypeError)) {
            throw e;
          }
        }
        if (resultPtr != 0) {
          this.writeU8(resultPtr, success);
        }
        return NAPI_OK;
      }),
      napi_define_properties: this.wrap((envPtr, objectIdx, propertyCount, propertiesPtr) => {
        if (envPtr === 0 || objectIdx === 0 || (propertyCount > 0 && propertiesPtr == 0)) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        propertyCount >>>= 0;
        const object = this.load(objectIdx);
        if (typeof object !== 'object' || object === null) {
          return this.returnError(NAPI_OBJECT_EXPECTED);
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
              delete descriptor.writable;
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
      napi_call_function: this.wrap((envPtr, recvIdx, funcIdx, argc, argvPtr, resultPtr) => {
        argc >>>= 0;
        const recv = this.load(recvIdx);
        const func = this.load(funcIdx);

        if (typeof func !== 'function') {
          return this.returnError(NAPI_FUNCTION_EXPECTED);
        }

        const args = [];
        for (let i = 0; i < argc; i += 1) {
          args.push(this.load(this.readU32(argvPtr + (i * 4))));
        }

        try {
          const result = Reflect.apply(func, recv, args);
          this.writeU32(resultPtr, this.store(result));
        } catch (e) {
          this.exception = e;
          return this.returnError(NAPI_PENDING_EXCEPTION);
        }

        return NAPI_OK;
      }),
      napi_create_function: this.wrap((envPtr, utf8NamePtr, length, cb, data, resultPtr) => {
        length >>>= 0;
        if (envPtr === 0 || cb === 0 || resultPtr === 0) {
          return NAPI_INVALID_ARG;
        }
        let name;
        if (length > 0) {
          name = this.readString(utf8NamePtr, length);
        }
        const func = this.createFunction(envPtr, cb, data, name);
        this.writeU32(resultPtr, this.store(func));
        return NAPI_OK;
      }),
      napi_create_reference: this.wrap((envPtr, valueIdx, initialRefcount, resultPtr) => {
        const value = this.load(valueIdx);
        this.writeU32(resultPtr, this.createReference(value, initialRefcount));
        return NAPI_OK;
      }),
      napi_delete_reference: (envPtr, refIdx) => {
        delete this.references[refIdx];
        return NAPI_OK;
      },
      napi_create_threadsafe_function: this.wrap((envPtr, funcIdx, asyncResourceIdx, asyncResourceNameIdx, maxQueueSize, initialThreadCount, finalizeData, finalizeCallback, callJavascriptMainThreadCallbackContext, callJavascriptMainThreadCallback, resultPtr) => {
          debugger;
       if (funcIdx === null && callJavascriptMainThreadCallback === null) {
         return NAPI_INVALID_ARG;
       }
       const threadsafeFunction = {
         "func": this.load(funcIdx),
         "asyncResource": this.load(asyncResourceIdx),
         "asyncResourceName": this.load(asyncResourceNameIdx),
         "maxQueueSize": maxQueueSize >>> 0,
         "queueSize": 0,
         "threadCount": initialThreadCount >>> 0,
         finalizeData,
         "finalizeCallback": this.indirectFunctionTable.get(finalizeCallback),
         callJavascriptMainThreadCallbackContext,
         "callJavascriptMainThreadCallback": this.indirectFunctionTable.get(callJavascriptMainThreadCallback),
         "env": envPtr,
         isCancelled: false
       };
       this.writeU32(resultPtr, this.createReference(threadsafeFunction, 1));
        return NAPI_OK;
      }),
      napi_get_threadsafe_function_context: this.wrap((threadsafeFunctionIdx, resultPtr) => {
       const threadsafeFunction = this.references[threadsafeFunctionIdx].value;
       this.writeU32(resultPtr, threadsafeFunction.callJavascriptMainThreadCallbackContext);
        return NAPI_OK;
      }),
      napi_call_threadsafe_function: this.wrap((threadsafeFunctionIdx, data, mode) => {
       const threadsafeFunction = this.references[threadsafeFunctionIdx].value;
       if (threadsafeFunction.isCancelled) {
           return NAPI_CLOSING;
       }

       // If the maxQueueSize is 0 then there is no limit so just call the function
       if (threadsafeFunction.maxQueueSize !== 0) {
           if (threadsafeFunction.queueSize < threadsafeFunction.maxQueueSize) {
               threadsafeFunction.queueSize += 1;
           } else {
               if (mode === NAPI_THREADSAFE_FUNCTION_CALL_MODE_BLOCKING) {
                   // TODO: If/when this is ever multithreaded, block until this can execute
               } else if (mode === NAPI_THREADSAFE_FUNCTION_CALL_MODE_NONBLOCKING) {
                   return NAPI_QUEUE_FULL;
               } else {
                   return NAPI_INVALID_ARG;
               }
           }
       }

       if (threadsafeFunction.callJavascriptMainThreadCallback !== null) {
           // TODO: If/when this is ever multithraded, ensure this is called on the main thread
           const env = threadsafeFunction.env
           const funcIdx = this.store(threadsafeFunction.func);
           const context = threadsafeFunction.callJavascriptMainThreadCallbackContext;
           const callback = threadsafeFunction.callJavascriptMainThreadCallback
           callback(env, funcIdx, context, data);
       } else if (threadsafeFunction.func !== null) {
             const args = [];
             args.push(threadsafeFunction.env);
             // createFunction() uses the same index for both the function and the context
             const callbackInfo = threadsafeFunction.func;
             args.push(callbackInfo);
             const func = this.load(threadsafeFunction.func);
             result = Reflect.apply(func, undefined, args);
       } else {
           return NAPI_INVALID_ARG;
       }

       if (threadsafeFunction.maxQueueSize !== 0) {
           threadsafeFunction.queueSize -= 1;
           // TODO: If/when this is ever multithraded, wake the next blocked execution if there are any
       }

        return NAPI_OK;
      }),
      napi_acquire_threadsafe_function: this.wrap((threadsafeFunctionIdx) => {
       const threadsafeFunction = this.references[threadsafeFunctionIdx].value;
       threadsafeFunction.threadCount += 1;
        return NAPI_OK;
      }),
      napi_release_threadsafe_function: this.wrap((threadsafeFunctionIdx, mode) => {
       const threadsafeFunction = this.references[threadsafeFunctionIdx].value;
       threadsafeFunction.threadCount -= 1;

       if (mode === NAPI_THREADSAFE_FUNCTION_RELEASE_MODE_ABORT) {
         threadsafeFunction.isCancelled = true;
       }

       if (threadsafeFunction.threadCount === 0) {
         if (typeof threadsafeFunction.threadFinalizeCallback === 'function') {
           const args = [];
           args.push(threadsafeFunction.env);
           args.push(threadsafeFunction.finalizeData);
           args.push(threadsafeFunctionIdx);
           Reflect.apply(threadsafeFunction.threadFinalizeCallback, undefined, args);
         }
         delete this.references[threadsafeFunctionIdx];
       }

        return NAPI_OK;
      }),
      napi_get_cb_info: this.wrap((envPtr, cbinfoIdx, argcPtr, argvPtr, thisArgPtr, dataPtr) => {
        const info = this.load(cbinfoIdx);

        const argc = this.readU32(argcPtr);

        this.writeU32(argcPtr, info.args.length);
        for (let i = 0; i < argc; i += 1) {
          this.writeU32(argvPtr + (i * 4), this.store(info.args[i]));
        }

        this.writeU32(thisArgPtr, this.store(info.this));

        this.writeU32(dataPtr, info.data);

        return NAPI_OK;
      }),
      napi_get_new_target: this.wrap((envPtr, cbinfoIdx, resultPtr) => {
        const info = this.load(cbinfoIdx);
        this.writeU32(resultPtr, info.newTarget === undefined ? 0 : this.store(info.newTarget));
        return NAPI_OK;
      }),
      napi_new_instance: this.wrap((envPtr, consIdx, argc, argvPtr, resultPtr) => {
        argc >>>= 0;
        const cons = this.load(consIdx);
        if (typeof cons !== 'function') {
          return this.returnError(NAPI_FUNCTION_EXPECTED);
        }
        const args = [];
        for (let i = 0; i < argc; i += 1) {
          args.push(this.load(this.readU32(argvPtr + (i * 4))));
        }
        const result = Reflect.construct(cons, args);
        this.writeU32(resultPtr, this.store(result));
        return NAPI_OK;
      }),
      napi_define_class: this.wrap((envPtr, utf8NamePtr, utf8NameLength, constructorIdx, data, propertyCount, propertiesPtr, resultPtr) => {
        if (envPtr === 0 ||
            utf8NamePtr === 0 ||
            constructorIdx === 0 ||
            resultPtr === 0 ||
            (propertyCount !== 0 && propertiesPtr === 0)
           ) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const func = this.createFunction(
          envPtr, constructorIdx, data, utf8NameLength != 0
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
        this.writeU32(resultPtr, this.store(func));
        return NAPI_OK;
      }),

      napi_wrap: this.wrap((envPtr, jsObjectIdx, nativeObjectPtr, finalizeCb, finalizeHint, resultPtr) => {
        const jsObject = this.load(jsObjectIdx);
        if (this.wrapData.has(jsObject)) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        this.finalizationRegistry
          .register(jsObject, [finalizeCb, envPtr, nativeObjectPtr, finalizeHint]);
        this.wrapData.set(jsObject, nativeObjectPtr);
        if (resultPtr !== 0) {
          this.writeU32(resultPtr, this.createReference(jsObject, 0));
        }
        return NAPI_OK;
      }),
      napi_unwrap: this.wrap((envPtr, jsObjectIdx, resultPtr) => {
        const jsObject = this.load(jsObjectIdx);
        if (!this.wrapData.has(jsObject)) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        this.writeU32(resultPtr, this.wrapData.get(jsObject));
        return NAPI_OK;
      }),
      napi_remove_wrap: this.wrap((envPtr, jsObjectIdx, resultPtr) => {
        const jsObject = this.load(jsObjectIdx);
        if (!this.wrapData.has(jsObject)) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const nativeObjectPtr = this.wrapData.get(jsObject);
        this.wrapData.delete(jsObject);
        this.finalizationRegistry.unregister(jsObject);
        this.writeU32(resultPtr, nativeObjectPtr);
        return NAPI_OK;
      }),
      napi_type_tag_object: this.wrap((envPtr, jsObjectIdx, typeTagPtr) => {
        const jsObject = this.load(jsObjectIdx);
        if (!util.isObject(jsObject)) {
          return this.returnError(NAPI_OBJECT_EXPECTED);
        }
        if (this.typeTags.has(jsObject)) {
          return this.returnError(NAPI_INVALID_ARG);
        }
        const typeTag = {
          upper: this.readU64(typeTagPtr),
          lower: this.readU64(typeTagPtr + 8),
        };
        this.typeTags.set(jsObject, typeTag);
        return NAPI_OK;
      }),
      napi_check_object_type_tag: this.wrap((envPtr, jsObjectIdx, typeTagPtr, resultPtr) => {
        const jsObject = this.load(jsObjectIdx);
        if (!util.isObject(jsObject)) {
          return this.returnError(NAPI_OBJECT_EXPECTED);
        }
        const typeTag = {
          upper: this.readU64(typeTagPtr),
          lower: this.readU64(typeTagPtr + 8),
        };
        const thisTag = this.typeTags.get(jsObject);
        if (thisTag) {
          this.writeU8(
            resultPtr,
            typeTag.upper === thisTag.upper && typeTag.lower === thisTag.lower,
          );
        } else {
          this.writeU8(resultPtr, 0);
        }
        return NAPI_OK;
      }),
      napi_add_finalizer: this.wrap((envPtr, jsObjectIdx, nativeObjectPtr, finalizeCb, finalizeHint, resultPtr) => {
        const jsObject = this.load(jsObjectIdx);
        this.finalizationRegistry
          .register(jsObject, [finalizeCb, envPtr, nativeObjectPtr, finalizeHint]);
        if (resultPtr !== 0) {
          this.writeU32(resultPtr, this.createReference(jsObject, 1));
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
        this.writeU32(deferredPtr, this.createReference(deferred, 1));
        this.writeU32(promisePtr, this.store(promise));
        return NAPI_OK;
      }),
      napi_resolve_deferred: this.wrap((envPtr, deferredIdx, resolutionIdx) => {
        const deferred = this.references[deferredIdx].value;
        delete this.references[deferredIdx];
        const resolution = this.load(resolutionIdx);
        deferred.resolve(resolution);
        return NAPI_OK;
      }),
      napi_reject_deferred: this.wrap((envPtr, deferredIdx, rejectionIdx) => {
        const deferred = this.references[deferredIdx].value;
        delete this.references[deferredIdx];
        const rejection = this.load(rejectionIdx);
        deferred.reject(rejection);
        return NAPI_OK;
      }),
      napi_is_promise: this.wrap((envPtr, valueIdx, resultPtr) => {
        this.writeU8(resultPtr, util.types.isPromise(this.load(valueIdx)));
      }),
      napi_run_script: this.wrap((envPtr, scriptIdx, resultPtr) => {
        const script = this.load(scriptIdx);
        const result = vm.runInThisContext(script);
        this.writeU32(resultPtr, this.store(result));
        return NAPI_OK;
      }),
      napi_set_instance_data: this.wrap((envPtr, data, finalizeCb, finalizeHint) => {
        let instanceObject = { data }
        this.finalizationRegistry
          .register(instanceObject, [finalizeCb, envPtr, data, finalizeHint]);
        this.instanceData = instanceObject
      }),
      napi_get_instance_data: this.wrap((envPtr, dataPtr) => {
        this.writeU32(dataPtr, this.instanceData.data);
      }),
      napi_get_version: this.wrap((envPtr, resultPtr) => {
        this.writeU32(resultPtr, 8);
      }),
      napi_adjust_external_memory: this.wrap((envPtr, changeInBytes, resultPtr) => {
        this.writeI64(resultPtr, 1n);
      }),
    };
  }

  refreshMemory() {
    if (this.view.buffer.byteLength === 0) {
      this.view = new DataView(this.memory.buffer);
    }
  }

  openHandleScope(escapable) {
    const escapeSlot = escapable ? this.store(undefined) : undefined
    const scope = {
      escapable,
      start: this.handles.length,
      escaped: false,
      escapeSlot,
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

  readU32(ptr) {
    ptr >>>= 0;
    return this.view.getUint32(ptr, true);
  }

  readU64(ptr) {
    ptr >>>= 0;
    return this.view.getBigUint64(ptr, true);
  }

  writeU8(ptr, u8) {
    ptr >>>= 0;
    this.view.setUint8(ptr, u8);
  }

  writeU32(ptr, u32) {
    ptr >>>= 0;
    this.view.setUint32(ptr, u32, true);
  }

  writeI32(ptr, i32) {
    ptr >>>= 0;
    this.view.setInt32(ptr, i32, true);
  }

  writeI64(ptr, i64) {
    ptr >>>= 0;
    // clamp instead of truncating
    const RANGEERROR = 2n ** 63n
    if (i64 >= RANGEERROR) {
      i64 = RANGEERROR - 1n
    }
    if (i64 < -RANGEERROR) {
      i64 = -RANGEERROR
    }
    this.view.setBigInt64(ptr, i64, true);
  }

  writeU64(ptr, u64) {
    ptr >>>= 0;
    this.view.setBigUint64(ptr, u64, true);
  }

  writeF64(ptr, f64) {
    ptr >>>= 0;
    this.view.setFloat64(ptr, f64, true);
  }

  readCStringFrom(ptr) {
    ptr >>>= 0;
    if (ptr === 0) {
      return "<NULL DEREFERENCE!>"
    }
    const u8 = new Uint8Array(this.memory.buffer);
    const end = u8.indexOf(0, ptr);
    return this.readString(ptr, end - ptr);
  }

  readUTF16StringFrom(ptr) {
    ptr >>>= 0;
    if (ptr === 0) {
      return "<NULL DEREFERENCE!>"
    }
    if (ptr & 1 !== 0) {
      throw "alignment error"
    }
    const u16 = new Uint16Array(this.memory.buffer);
    const end = u16.indexOf(0, ptr / 2);
    return this.readString(ptr, end * 2 - ptr);
  }

  readString(index, length, encoding = 'utf8') {
    index >>>= 0;
    length >>>= 0;
    if (length === NAPI_AUTO_LENGTH) {
      return encoding === 'utf16le' ? this.readUTF16StringFrom(index): this.readCStringFrom(index);
    } else if (length >= 2 ** 31) {
      throw NAPI_INVALID_ARG;
    }
    if (encoding === 'utf16le') {
      length *= 2;
    }
    let ret = Buffer.from(this.memory.buffer, index, length).toString(encoding);
    return ret;
  }

  createReference(value, refCount) {
    const ref = { value: refCount > 0 ? value : new WeakRef(value), ref: refCount };
    this.references[this.nextRef] = ref;
    this.nextRef += 1;
    return this.nextRef - 1;
  }

  allocateErrorMessages() {
    const tablePtr = this.malloc(4 * error_messages.length);
    for (let i = 0; i < error_messages.length; i++) {
      let stringPtr = 0
      if (error_messages[i] !== undefined) {
        const utf8 = (new TextEncoder()).encode(error_messages[i]);
        stringPtr = this.malloc(utf8.length + 1);
        const buffer = Buffer.from(this.memory.buffer)
        buffer.set(utf8, stringPtr)
        buffer[stringPtr + utf8.length] = 0
      }
      this.writeU32(tablePtr + 4 * i, stringPtr);
    }
    return tablePtr;
  }

  init(instance) {
    this.memory = instance.exports.memory;
    this.malloc = instance.exports.malloc;
    this.free = instance.exports.free;
    this.view = new DataView(this.memory.buffer);
    this.indirectFunctionTable = instance.exports.__indirect_function_table;
    this.errorMessageTable = this.allocateErrorMessages();
    this.extendedErrorInfoPtr = this.malloc(16);
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
        throw e; // nosonar eslint-disable-line no-unsafe-finally
      }
    }
  }
}
