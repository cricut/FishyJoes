import JNI
import FishyJoesCommonRuntime

public struct Env {
    public var env: UnsafeMutablePointer<JNIEnv?>
    // public var vm: UnsafeMutablePointer<JavaVM?>

    @inline(__always)
    private var fns: JNIEnv.Pointee {
        env.pointee!.pointee
    }

    public func globalRef(_ object: jobject?) throws -> jobject {
        let local = try javaNonNull(object)
        let global = try javaNonNull(fns.NewGlobalRef(env, local))
        DeleteLocalRef(local)
        return global
    }
}


// MARK: JNI function wrappers
extension Env {
    public typealias CStr = UnsafePointer<CChar>?

    public func GetVersion() -> jint {
        fns.GetVersion(env)
    }

    public func DefineClass(_ name: CStr, _ loader: jobject?, _ buf: UnsafePointer<jbyte>, _ len: jsize) -> jclass? {
        fns.DefineClass(env, name, loader, buf, len)
    }
    public func FindClass(_ name: CStr) -> jclass? {
        fns.FindClass(env, name)
    }

    public func FromReflectedMethod(_ method: jobject?) -> jmethodID? {
        fns.FromReflectedMethod(env, method)
    }
    public func FromReflectedField(_ field: jobject?) -> jfieldID? {
        fns.FromReflectedField(env, field)
    }

    public func ToReflectedMethod(_ cls: jclass?, _ methodID: jmethodID?, _ isStatic: jboolean) -> jobject? {
        fns.ToReflectedMethod(env, cls, methodID, isStatic)
    }

    public func GetSuperclass(_ sub: jclass?) -> jclass? {
        fns.GetSuperclass(env, sub)
    }
    public func IsAssignableFrom(_ sub: jclass?, _ sup: jclass?) -> Bool {
        fns.IsAssignableFrom(env, sub, sup) != JNI_FALSE
    }

    public func ToReflectedField(_ cls: jclass?, _ fieldID: jfieldID?, _ isStatic: jboolean) -> jobject? {
        fns.ToReflectedField(env, cls, fieldID, isStatic)
    }

    public func Throw(_ obj: jthrowable?) -> jint {
        fns.Throw(env, obj)
    }
    public func ThrowNew(_ clazz: jclass?, _ msg: CStr) -> Bool {
        fns.ThrowNew(env, clazz, msg) == JNI_OK
    }
    public func ExceptionOccurred() -> jthrowable? {
        fns.ExceptionOccurred(env)
    }
    public func ExceptionDescribe() {
        fns.ExceptionDescribe(env)
    }
    public func ExceptionClear() {
        fns.ExceptionClear(env)
    }
    public func FatalError(_ msg: CStr) {
        fns.FatalError(env, msg)
    }

    public func PushLocalFrame(_ capacity: jint) -> jint {
        fns.PushLocalFrame(env, capacity)
    }
    public func PopLocalFrame(_ result: jobject?) -> jobject? {
        fns.PopLocalFrame(env, result)
    }

    public func NewGlobalRef(_ lobj: jobject?) -> jobject? {
        fns.NewGlobalRef(env, lobj)
    }
    public func DeleteGlobalRef(_ gref: jobject?) {
        fns.DeleteGlobalRef(env, gref)
    }
    public func DeleteLocalRef(_ obj: jobject?) {
        fns.DeleteLocalRef(env, obj)
    }
    public func IsSameObject(_ obj1: jobject?, _ obj2: jobject?) -> Bool {
        fns.IsSameObject(env, obj1, obj2) != JNI_FALSE
    }
    public func NewLocalRef(_ ref: jobject?) -> jobject? {
        fns.NewLocalRef(env, ref)
    }
    public func EnsureLocalCapacity(_ capacity: jint) -> jint {
        fns.EnsureLocalCapacity(env, capacity)
    }

    public func AllocObject(_ clazz: jclass?) -> jobject? {
        fns.AllocObject(env, clazz)
    }
    public func NewObject(_ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jobject? {
        fns.NewObjectA(env, clazz, methodID, args)
    }

    public func GetObjectClass(_ obj: jobject?) -> jclass? {
        fns.GetObjectClass(env, obj)
    }
    public func IsInstanceOf(_ obj: jobject?, _ clazz: jclass?) -> Bool {
        fns.IsInstanceOf(env, obj, clazz) != JNI_FALSE
    }

    public func GetMethodID(_ clazz: jclass?, _ name: CStr, _ sig: CStr) -> jmethodID? {
        fns.GetMethodID(env, clazz, name, sig)
    }

    public func CallObjectMethod(_ obj: jobject?, _ methodID: jmethodID?, _ args: jvalue ...) -> jobject? {
        fns.CallObjectMethodA(env, obj, methodID, args)
    }
    public func CallBooleanMethod(_ obj: jobject?, _ methodID: jmethodID?, _ args: jvalue ...) -> Bool {
        fns.CallBooleanMethodA(env, obj, methodID, args) != JNI_FALSE
    }
    public func CallByteMethod(_ obj: jobject?, _ methodID: jmethodID?, _ args: jvalue ...) -> jbyte {
        fns.CallByteMethodA(env, obj, methodID, args)
    }
    public func CallCharMethod(_ obj: jobject?, _ methodID: jmethodID?, _ args: jvalue ...) -> jchar {
        fns.CallCharMethodA(env, obj, methodID, args)
    }
    public func CallShortMethod(_ obj: jobject?, _ methodID: jmethodID?, _ args: jvalue ...) -> jshort {
        fns.CallShortMethodA(env, obj, methodID, args)
    }
    public func CallIntMethod(_ obj: jobject?, _ methodID: jmethodID?, _ args: jvalue ...) -> jint {
        fns.CallIntMethodA(env, obj, methodID, args)
    }
    public func CallLongMethod(_ obj: jobject?, _ methodID: jmethodID?, _ args: jvalue ...) -> jlong {
        fns.CallLongMethodA(env, obj, methodID, args)
    }
    public func CallFloatMethod(_ obj: jobject?, _ methodID: jmethodID?, _ args: jvalue ...) -> jfloat {
        fns.CallFloatMethodA(env, obj, methodID, args)
    }
    public func CallDoubleMethod(_ obj: jobject?, _ methodID: jmethodID?, _ args: jvalue ...) -> jdouble {
        fns.CallDoubleMethodA(env, obj, methodID, args)
    }
    public func CallVoidMethod(_ obj: jobject?, _ methodID: jmethodID?, _ args: jvalue ...) {
        fns.CallVoidMethodA(env, obj, methodID, args)
    }
    public func CallNonvirtualObjectMethod(_ obj: jobject?, _ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jobject? {
        fns.CallNonvirtualObjectMethodA(env, obj, clazz, methodID, args)
    }
    public func CallNonvirtualBooleanMethod(_ obj: jobject?, _ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> Bool {
        fns.CallNonvirtualBooleanMethodA(env, obj, clazz, methodID, args) != JNI_FALSE
    }
    public func CallNonvirtualByteMethod(_ obj: jobject?, _ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jbyte {
        fns.CallNonvirtualByteMethodA(env, obj, clazz, methodID, args)
    }
    public func CallNonvirtualCharMethod(_ obj: jobject?, _ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jchar {
        fns.CallNonvirtualCharMethodA(env, obj, clazz, methodID, args)
    }
    public func CallNonvirtualShortMethod(_ obj: jobject?, _ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jshort {
        fns.CallNonvirtualShortMethodA(env, obj, clazz, methodID, args)
    }
    public func CallNonvirtualIntMethod(_ obj: jobject?, _ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jint {
        fns.CallNonvirtualIntMethodA(env, obj, clazz, methodID, args)
    }
    public func CallNonvirtualLongMethod(_ obj: jobject?, _ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jlong {
        fns.CallNonvirtualLongMethodA(env, obj, clazz, methodID, args)
    }
    public func CallNonvirtualFloatMethod(_ obj: jobject?, _ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jfloat {
        fns.CallNonvirtualFloatMethodA(env, obj, clazz, methodID, args)
    }
    public func CallNonvirtualDoubleMethod(_ obj: jobject?, _ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jdouble {
        fns.CallNonvirtualDoubleMethodA(env, obj, clazz, methodID, args)
    }
    public func CallNonvirtualVoidMethod(_ obj: jobject?, _ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) {
        fns.CallNonvirtualVoidMethodA(env, obj, clazz, methodID, args)
    }

    public func GetFieldID(_ clazz: jclass?, _ name: CStr, _ sig: CStr) -> jfieldID? {
        fns.GetFieldID(env, clazz, name, sig)
    }

    public func GetObjectField(_ obj: jobject?, _ fieldID: jfieldID?) -> jobject? {
        fns.GetObjectField(env, obj, fieldID)
    }
    public func GetBooleanField(_ obj: jobject?, _ fieldID: jfieldID?) -> Bool {
        fns.GetBooleanField(env, obj, fieldID) != JNI_FALSE
    }
    public func GetByteField(_ obj: jobject?, _ fieldID: jfieldID?) -> jbyte {
        fns.GetByteField(env, obj, fieldID)
    }
    public func GetCharField(_ obj: jobject?, _ fieldID: jfieldID?) -> jchar {
        fns.GetCharField(env, obj, fieldID)
    }
    public func GetShortField(_ obj: jobject?, _ fieldID: jfieldID?) -> jshort {
        fns.GetShortField(env, obj, fieldID)
    }
    public func GetIntField(_ obj: jobject?, _ fieldID: jfieldID?) -> jint {
        fns.GetIntField(env, obj, fieldID)
    }
    public func GetLongField(_ obj: jobject?, _ fieldID: jfieldID?) -> jlong {
        fns.GetLongField(env, obj, fieldID)
    }
    public func GetFloatField(_ obj: jobject?, _ fieldID: jfieldID?) -> jfloat {
        fns.GetFloatField(env, obj, fieldID)
    }
    public func GetDoubleField(_ obj: jobject?, _ fieldID: jfieldID?) -> jdouble {
        fns.GetDoubleField(env, obj, fieldID)
    }

    public func SetObjectField(_ obj: jobject?, _ fieldID: jfieldID?, _ val: jobject?) {
        fns.SetObjectField(env, obj, fieldID, val)
    }
    public func SetBooleanField(_ obj: jobject?, _ fieldID: jfieldID?, _ val: jboolean) {
        fns.SetBooleanField(env, obj, fieldID, val)
    }
    public func SetByteField(_ obj: jobject?, _ fieldID: jfieldID?, _ val: jbyte) {
        fns.SetByteField(env, obj, fieldID, val)
    }
    public func SetCharField(_ obj: jobject?, _ fieldID: jfieldID?, _ val: jchar) {
        fns.SetCharField(env, obj, fieldID, val)
    }
    public func SetShortField(_ obj: jobject?, _ fieldID: jfieldID?, _ val: jshort) {
        fns.SetShortField(env, obj, fieldID, val)
    }
    public func SetIntField(_ obj: jobject?, _ fieldID: jfieldID?, _ val: jint) {
        fns.SetIntField(env, obj, fieldID, val)
    }
    public func SetLongField(_ obj: jobject?, _ fieldID: jfieldID?, _ val: jlong) {
        fns.SetLongField(env, obj, fieldID, val)
    }
    public func SetFloatField(_ obj: jobject?, _ fieldID: jfieldID?, _ val: jfloat) {
        fns.SetFloatField(env, obj, fieldID, val)
    }
    public func SetDoubleField(_ obj: jobject?, _ fieldID: jfieldID?, _ val: jdouble) {
        fns.SetDoubleField(env, obj, fieldID, val)
    }

    public func GetStaticMethodID(_ clazz: jclass?, _ name: CStr, _ sig: CStr) -> jmethodID? {
        fns.GetStaticMethodID(env, clazz, name, sig)
    }

    public func CallStaticObjectMethod(_ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jobject? {
        fns.CallStaticObjectMethodA(env, clazz, methodID, args)
    }
    public func CallStaticBooleanMethod(_ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> Bool {
        fns.CallStaticBooleanMethodA(env, clazz, methodID, args) != JNI_FALSE
    }
    public func CallStaticByteMethod(_ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jbyte {
        fns.CallStaticByteMethodA(env, clazz, methodID, args)
    }
    public func CallStaticCharMethod(_ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jchar {
        fns.CallStaticCharMethodA(env, clazz, methodID, args)
    }
    public func CallStaticShortMethod(_ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jshort {
        fns.CallStaticShortMethodA(env, clazz, methodID, args)
    }
    public func CallStaticIntMethod(_ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jint {
        fns.CallStaticIntMethodA(env, clazz, methodID, args)
    }
    public func CallStaticLongMethod(_ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jlong {
        fns.CallStaticLongMethodA(env, clazz, methodID, args)
    }
    public func CallStaticFloatMethod(_ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jfloat {
        fns.CallStaticFloatMethodA(env, clazz, methodID, args)
    }
    public func CallStaticDoubleMethod(_ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) -> jdouble {
        fns.CallStaticDoubleMethodA(env, clazz, methodID, args)
    }
    public func CallStaticVoidMethod(_ clazz: jclass?, _ methodID: jmethodID?, _ args: jvalue ...) {
        fns.CallStaticVoidMethodA(env, clazz, methodID, args)
    }

    public func GetStaticFieldID(_ clazz: jclass?, _ name: CStr, _ sig: CStr) -> jfieldID? {
        fns.GetStaticFieldID(env, clazz, name, sig)
    }
    public func GetStaticObjectField(_ clazz: jclass?, _ fieldID: jfieldID?) -> jobject? {
        fns.GetStaticObjectField(env, clazz, fieldID)
    }
    public func GetStaticBooleanField(_ clazz: jclass?, _ fieldID: jfieldID?) -> Bool {
        fns.GetStaticBooleanField(env, clazz, fieldID) != JNI_FALSE
    }
    public func GetStaticByteField(_ clazz: jclass?, _ fieldID: jfieldID?) -> jbyte {
        fns.GetStaticByteField(env, clazz, fieldID)
    }
    public func GetStaticCharField(_ clazz: jclass?, _ fieldID: jfieldID?) -> jchar {
        fns.GetStaticCharField(env, clazz, fieldID)
    }
    public func GetStaticShortField(_ clazz: jclass?, _ fieldID: jfieldID?) -> jshort {
        fns.GetStaticShortField(env, clazz, fieldID)
    }
    public func GetStaticIntField(_ clazz: jclass?, _ fieldID: jfieldID?) -> jint {
        fns.GetStaticIntField(env, clazz, fieldID)
    }
    public func GetStaticLongField(_ clazz: jclass?, _ fieldID: jfieldID?) -> jlong {
        fns.GetStaticLongField(env, clazz, fieldID)
    }
    public func GetStaticFloatField(_ clazz: jclass?, _ fieldID: jfieldID?) -> jfloat {
        fns.GetStaticFloatField(env, clazz, fieldID)
    }
    public func GetStaticDoubleField(_ clazz: jclass?, _ fieldID: jfieldID?) -> jdouble {
        fns.GetStaticDoubleField(env, clazz, fieldID)
    }

    public func SetStaticObjectField(_ clazz: jclass?, _ fieldID: jfieldID?, _ value: jobject?) {
        fns.SetStaticObjectField(env, clazz, fieldID, value)
    }
    public func SetStaticBooleanField(_ clazz: jclass?, _ fieldID: jfieldID?, _ value: jboolean) {
        fns.SetStaticBooleanField(env, clazz, fieldID, value)
    }
    public func SetStaticByteField(_ clazz: jclass?, _ fieldID: jfieldID?, _ value: jbyte) {
        fns.SetStaticByteField(env, clazz, fieldID, value)
    }
    public func SetStaticCharField(_ clazz: jclass?, _ fieldID: jfieldID?, _ value: jchar) {
        fns.SetStaticCharField(env, clazz, fieldID, value)
    }
    public func SetStaticShortField(_ clazz: jclass?, _ fieldID: jfieldID?, _ value: jshort) {
        fns.SetStaticShortField(env, clazz, fieldID, value)
    }
    public func SetStaticIntField(_ clazz: jclass?, _ fieldID: jfieldID?, _ value: jint) {
        fns.SetStaticIntField(env, clazz, fieldID, value)
    }
    public func SetStaticLongField(_ clazz: jclass?, _ fieldID: jfieldID?, _ value: jlong) {
        fns.SetStaticLongField(env, clazz, fieldID, value)
    }
    public func SetStaticFloatField(_ clazz: jclass?, _ fieldID: jfieldID?, _ value: jfloat) {
        fns.SetStaticFloatField(env, clazz, fieldID, value)
    }
    public func SetStaticDoubleField(_ clazz: jclass?, _ fieldID: jfieldID?, _ value: jdouble) {
        fns.SetStaticDoubleField(env, clazz, fieldID, value)
    }

    public func NewString(_ unicode: UnsafePointer<jchar>, _ len: jsize) -> jstring? {
        fns.NewString(env, unicode, len)
    }
    public func GetStringLength(_ str: jstring?) -> jsize {
        fns.GetStringLength(env, str)
    }
    public func GetStringChars(_ str: jstring?) -> (UnsafePointer<jchar>?, isCopy: Bool) {
        var isCopy = jboolean(JNI_FALSE)
        let result = fns.GetStringChars(env, str, &isCopy)
        return (result, isCopy != jboolean(JNI_FALSE))
    }
    public func ReleaseStringChars(_ str: jstring?, _ chars: UnsafePointer<jchar>) {
        fns.ReleaseStringChars(env, str, chars)
    }

    public func NewStringUTF(_ utf: CStr) -> jstring? {
        fns.NewStringUTF(env, utf)
    }
    public func GetStringUTFLength(_ str: jstring?) -> jsize {
        fns.GetStringUTFLength(env, str)
    }
    public func GetStringUTFChars(_ str: jstring?) -> (CStr, isCopy: Bool) {
        var isCopy = jboolean(JNI_FALSE)
        let result = fns.GetStringUTFChars(env, str, &isCopy)
        return (result, isCopy != jboolean(JNI_FALSE))
    }
    public func ReleaseStringUTFChars(_ str: jstring?, _  chars: CStr) {
        fns.ReleaseStringUTFChars(env, str, chars)
    }

    public func GetArrayLength(_ array: jarray?) -> jsize {
        fns.GetArrayLength(env, array)
    }

    public func NewObjectArray(_ len: jsize, _ clazz: jclass?, _ initial: jobject?) -> jobjectArray? {
        fns.NewObjectArray(env, len, clazz, initial)
    }
    public func GetObjectArrayElement(_ array: jobjectArray?, _ index: jsize) -> jobject? {
        fns.GetObjectArrayElement(env, array, index)
    }
    public func SetObjectArrayElement(_ array: jobjectArray?, _ index: jsize, _ val: jobject?) {
        fns.SetObjectArrayElement(env, array, index, val)
    }

    public func NewBooleanArray(_ len: jsize) -> jbooleanArray? {
        fns.NewBooleanArray(env, len)
    }
    public func NewByteArray(_ len: jsize) -> jbyteArray? {
        fns.NewByteArray(env, len)
    }
    public func NewCharArray(_ len: jsize) -> jcharArray? {
        fns.NewCharArray(env, len)
    }
    public func NewShortArray(_ len: jsize) -> jshortArray? {
        fns.NewShortArray(env, len)
    }
    public func NewIntArray(_ len: jsize) -> jintArray? {
        fns.NewIntArray(env, len)
    }
    public func NewLongArray(_ len: jsize) -> jlongArray? {
        fns.NewLongArray(env, len)
    }
    public func NewFloatArray(_ len: jsize) -> jfloatArray? {
        fns.NewFloatArray(env, len)
    }
    public func NewDoubleArray(_ len: jsize) -> jdoubleArray? {
        fns.NewDoubleArray(env, len)
    }

    public func GetBooleanArrayElements(_ array: jbooleanArray?) -> (UnsafeMutablePointer<jboolean>?, isCopy: Bool) {
        var isCopy = jboolean(JNI_FALSE)
        let result = fns.GetBooleanArrayElements(env, array, &isCopy)
        return (result, isCopy != jboolean(JNI_FALSE))
    }
    public func GetByteArrayElements(_ array: jbyteArray?) -> (UnsafeMutablePointer<jbyte>?, isCopy: Bool) {
        var isCopy = jboolean(JNI_FALSE)
        let result = fns.GetByteArrayElements(env, array, &isCopy)
        return (result, isCopy != jboolean(JNI_FALSE))
    }
    public func GetCharArrayElements(_ array: jcharArray?) -> (UnsafeMutablePointer<jchar>?, isCopy: Bool) {
        var isCopy = jboolean(JNI_FALSE)
        let result = fns.GetCharArrayElements(env, array, &isCopy)
        return (result, isCopy != jboolean(JNI_FALSE))
    }
    public func GetShortArrayElements(_ array: jshortArray?) -> (UnsafeMutablePointer<jshort>?, isCopy: Bool) {
        var isCopy = jboolean(JNI_FALSE)
        let result = fns.GetShortArrayElements(env, array, &isCopy)
        return (result, isCopy != jboolean(JNI_FALSE))
    }
    public func GetIntArrayElements(_ array: jintArray?) -> (UnsafeMutablePointer<jint>?, isCopy: Bool) {
        var isCopy = jboolean(JNI_FALSE)
        let result = fns.GetIntArrayElements(env, array, &isCopy)
        return (result, isCopy != jboolean(JNI_FALSE))
    }
    public func GetLongArrayElements(_ array: jlongArray?) -> (UnsafeMutablePointer<jlong>?, isCopy: Bool) {
        var isCopy = jboolean(JNI_FALSE)
        let result = fns.GetLongArrayElements(env, array, &isCopy)
        return (result, isCopy != jboolean(JNI_FALSE))
    }
    public func GetFloatArrayElements(_ array: jfloatArray?) -> (UnsafeMutablePointer<jfloat>?, isCopy: Bool) {
        var isCopy = jboolean(JNI_FALSE)
        let result = fns.GetFloatArrayElements(env, array, &isCopy)
        return (result, isCopy != jboolean(JNI_FALSE))
    }
    public func GetDoubleArrayElements(_ array: jdoubleArray?) -> (UnsafeMutablePointer<jdouble>?, isCopy: Bool) {
        var isCopy = jboolean(JNI_FALSE)
        let result = fns.GetDoubleArrayElements(env, array, &isCopy)
        return (result, isCopy != jboolean(JNI_FALSE))
    }

    public func ReleaseBooleanArrayElements(_ array: jbooleanArray, _ elems: UnsafeMutablePointer<jboolean>?, _ mode: jint) {
        fns.ReleaseBooleanArrayElements(env, array, elems, mode)
    }
    public func ReleaseByteArrayElements(_ array: jbyteArray, _ elems: UnsafeMutablePointer<jbyte>?, _ mode: jint) {
        fns.ReleaseByteArrayElements(env, array, elems, mode)
    }
    public func ReleaseCharArrayElements(_ array: jcharArray, _ elems: UnsafeMutablePointer<jchar>?, _ mode: jint) {
        fns.ReleaseCharArrayElements(env, array, elems, mode)
    }
    public func ReleaseShortArrayElements(_ array: jshortArray, _ elems: UnsafeMutablePointer<jshort>?, _ mode: jint) {
        fns.ReleaseShortArrayElements(env, array, elems, mode)
    }
    public func ReleaseIntArrayElements(_ array: jintArray, _ elems: UnsafeMutablePointer<jint>?, _ mode: jint) {
        fns.ReleaseIntArrayElements(env, array, elems, mode)
    }
    public func ReleaseLongArrayElements(_ array: jlongArray, _ elems: UnsafeMutablePointer<jlong>?, _ mode: jint) {
        fns.ReleaseLongArrayElements(env, array, elems, mode)
    }
    public func ReleaseFloatArrayElements(_ array: jfloatArray, _ elems: UnsafeMutablePointer<jfloat>?, _ mode: jint) {
        fns.ReleaseFloatArrayElements(env, array, elems, mode)
    }
    public func ReleaseDoubleArrayElements(_ array: jdoubleArray, _ elems: UnsafeMutablePointer<jdouble>?, _ mode: jint) {
        fns.ReleaseDoubleArrayElements(env, array, elems, mode)
    }

    public func GetBooleanArrayRegion(_ array: jbooleanArray, _ start: jsize, _ len: jsize, _ buf: UnsafeMutablePointer<jboolean>?) {
        fns.GetBooleanArrayRegion(env, array, start, len, buf)
    }
    public func GetByteArrayRegion(_ array: jbyteArray, _ start: jsize, _ len: jsize, _ buf: UnsafeMutablePointer<jbyte>?) {
        fns.GetByteArrayRegion(env, array, start, len, buf)
    }
    public func GetCharArrayRegion(_ array: jcharArray, _ start: jsize, _ len: jsize, _ buf: UnsafeMutablePointer<jchar>?) {
        fns.GetCharArrayRegion(env, array, start, len, buf)
    }
    public func GetShortArrayRegion(_ array: jshortArray, _ start: jsize, _ len: jsize, _ buf: UnsafeMutablePointer<jshort>?) {
        fns.GetShortArrayRegion(env, array, start, len, buf)
    }
    public func GetIntArrayRegion(_ array: jintArray, _ start: jsize, _ len: jsize, _ buf: UnsafeMutablePointer<jint>?) {
        fns.GetIntArrayRegion(env, array, start, len, buf)
    }
    public func GetLongArrayRegion(_ array: jlongArray, _ start: jsize, _ len: jsize, _ buf: UnsafeMutablePointer<jlong>?) {
        fns.GetLongArrayRegion(env, array, start, len, buf)
    }
    public func GetFloatArrayRegion(_ array: jfloatArray, _ start: jsize, _ len: jsize, _ buf: UnsafeMutablePointer<jfloat>?) {
        fns.GetFloatArrayRegion(env, array, start, len, buf)
    }
    public func GetDoubleArrayRegion(_ array: jdoubleArray, _ start: jsize, _ len: jsize, _ buf: UnsafeMutablePointer<jdouble>?) {
        fns.GetDoubleArrayRegion(env, array, start, len, buf)
    }

    public func SetBooleanArrayRegion(_ array: jbooleanArray, _ start: jsize, _ len: jsize, _ buf: UnsafePointer<jboolean>?) {
        fns.SetBooleanArrayRegion(env, array, start, len, buf)
    }
    public func SetByteArrayRegion(_ array: jbyteArray, _ start: jsize, _ len: jsize, _ buf: UnsafePointer<jbyte>?) {
        fns.SetByteArrayRegion(env, array, start, len, buf)
    }
    public func SetCharArrayRegion(_ array: jcharArray, _ start: jsize, _ len: jsize, _ buf: UnsafePointer<jchar>?) {
        fns.SetCharArrayRegion(env, array, start, len, buf)
    }
    public func SetShortArrayRegion(_ array: jshortArray, _ start: jsize, _ len: jsize, _ buf: UnsafePointer<jshort>?) {
        fns.SetShortArrayRegion(env, array, start, len, buf)
    }
    public func SetIntArrayRegion(_ array: jintArray, _ start: jsize, _ len: jsize, _ buf: UnsafePointer<jint>?) {
        fns.SetIntArrayRegion(env, array, start, len, buf)
    }
    public func SetLongArrayRegion(_ array: jlongArray, _ start: jsize, _ len: jsize, _ buf: UnsafePointer<jlong>?) {
        fns.SetLongArrayRegion(env, array, start, len, buf)
    }
    public func SetFloatArrayRegion(_ array: jfloatArray, _ start: jsize, _ len: jsize, _ buf: UnsafePointer<jfloat>?) {
        fns.SetFloatArrayRegion(env, array, start, len, buf)
    }
    public func SetDoubleArrayRegion(_ array: jdoubleArray, _ start: jsize, _ len: jsize, _ buf: UnsafePointer<jdouble>?) {
        fns.SetDoubleArrayRegion(env, array, start, len, buf)
    }

    public func RegisterNatives(_ clazz: jclass?, _ methods: JNINativeMethod ...) -> jint {
        fns.RegisterNatives(env, clazz, methods, jint(methods.count))
    }
    public func UnregisterNatives(_ clazz: jclass?) -> jint {
        fns.UnregisterNatives(env, clazz)
    }

    public func MonitorEnter(_ obj: jobject?) -> jint {
        fns.MonitorEnter(env, obj)
    }
    public func MonitorExit(_ obj: jobject?) -> jint {
        fns.MonitorExit(env, obj)
    }

    public func GetJavaVM(_ vm: UnsafeMutablePointer<UnsafeMutablePointer<JavaVM?>?>) -> jint {
        fns.GetJavaVM(env, vm)
    }

    public func GetStringRegion(_ str: jstring?, _ start: jsize, _ len: jsize, _ buf: UnsafeMutablePointer<jchar>) {
        fns.GetStringRegion(env, str, start, len, buf)
    }
    public func GetStringUTFRegion(_ str: jstring?, _ start: jsize, _ len: jsize, buf: UnsafeMutablePointer<CChar>) {
        fns.GetStringUTFRegion(env, str, start, len, buf)
    }

    // void * GetPrimitiveArrayCritical(jarray array, jboolean *isCopy);
    // void ReleasePrimitiveArrayCritical(jarray array, void *carray, jint mode);

    // const jchar * GetStringCritical(jstring? string, jboolean *isCopy);
    // void ReleaseStringCritical(jstring? string, const jchar *cstring);

    public func NewWeakGlobalRef(_ obj: jobject?) -> jweak? {
        fns.NewWeakGlobalRef(env, obj)
    }
    public func DeleteWeakGlobalRef(_ ref: jweak?) {
        fns.DeleteWeakGlobalRef(env, ref)
    }

    public func ExceptionCheck() -> Bool {
        fns.ExceptionCheck(env) != JNI_FALSE
    }

    public func NewDirectByteBuffer(_ address: UnsafeMutableRawPointer?, _ capacity: jlong) -> jobject? {
        fns.NewDirectByteBuffer(env, address, capacity)
    }
    public func GetDirectBufferAddress(_ buf: jobject?) -> UnsafeMutableRawPointer? {
        fns.GetDirectBufferAddress(env, buf)
    }
    public func GetDirectBufferCapacity(_ buf: jobject?) -> jlong {
        fns.GetDirectBufferCapacity(env, buf)
    }

    /* New JNI 1.6 Features */

    public func GetObjectRefType(_ obj: jobject?) -> jobjectRefType? {
        fns.GetObjectRefType(env, obj)
    }

    /* Module Features */

    public func GetModule(_ clazz: jclass?) -> jobject? {
        fns.GetModule(env, clazz)
    }

















    // public func ExceptionOccurred() -> jobject?? {
    //     fns.ExceptionOccurred(env)
    // }
    // public func ExceptionDescribe() {
    //     fns.ExceptionDescribe(env)
    // }
    // public func FindClass(_ name: CStr) -> jobject?? {
    //     fns.FindClass(env, name)
    // }
    // public func ThrowNew(_ clazz: jclass?, _ msg: CStr) -> Bool {
    //     fns.ThrowNew(env, clazz, msg) == JNI_OK
    // }
    // public func GetMethodID(_ clazz: jclass?, _ name: CStr?, _ sig: CStr) -> jmethodID?? {
    //     fns.GetMethodID(env, clazz, name, sig)
    // }
    // public func GetStaticFieldID(_ clazz: jclass?, _ name: CStr, _ sig: CStr) -> jfieldID?? {
    //     fns.GetStaticFieldID(env, clazz, name, sig)
    // }
    // public func GetStringLength(

    // // MARK: Call<type>Method
    // //@inlinable @inline(__always)
    // public func CallBooleanMethod(_ obj: jobject??, _ methodID: jmethodID??, _ args: jvalue ...) -> Bool {
    //     fns.CallBooleanMethodA(env, obj, methodID, args) != jboolean(JNI_FALSE)
    // }
    // public func CallDoubleMethod(_ obj: jobject??, _ methodID: jmethodID??, _ args: jvalue ...) -> jdouble {
    //     fns.CallDoubleMethodA(env, obj, methodID, args)
    // }
    // public func CallLongMethod(_ obj: jobject??, _ methodID: jmethodID??, _ args: jvalue ...) -> jlong {
    //     fns.CallLongMethodA(env, obj, methodID, args)
    // }
    // public func CallIntMethod(_ obj: jobject??, _ methodID: jmethodID??, _ args: jvalue ...) -> jint {
    //     fns.CallIntMethodA(env, obj, methodID, args)
    // }

    // // MARK: New<type>
    // public func NewObject(_ clazz: jclass?, _ methodID: jmethodID??, _ args: jvalue ...) -> jobject?? {
    //     fns.NewObjectA(env, clazz, methodID, args)
    // }

    // // MARK: GetStatic<type>Field
    // public func GetStaticObjectField(_ clazz: jclass?, _ fieldID: jfieldID?) -> jobject?? {
    //     fns.GetStaticObjectField(env, clazz, fieldID)
    // }
}
