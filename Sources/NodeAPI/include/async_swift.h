#ifndef async_swift_h
#define async_swift_h

//
// A modified version of the _CJavaScriptEventLoop.h from JavaScriptKit.
// See: https://github.com/swiftwasm/JavaScriptKit/blob/096584bb6959f16d97daf3ebf52039f98c36fdbf/Sources/_CJavaScriptEventLoop/include/_CJavaScriptEventLoop.h
//
// MIT License
//
// Copyright (c) 2020 Yuta Saito
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

#include <stdalign.h>
#include <stdint.h>

#define SWIFT_CC(CC) SWIFT_CC_##CC
#define SWIFT_CC_swift __attribute__((swiftcall))

#define SWIFT_EXPORT_FROM(LIBRARY) __attribute__((__visibility__("default")))

/// A schedulable unit
/// Note that this type layout is a part of public ABI, so we expect this field layout won't break in the future versions.
/// Current implementation refers the `swift-5.5-RELEASE` implementation.
/// https://github.com/apple/swift/blob/swift-5.5-RELEASE/include/swift/ABI/Task.h#L43-L129
/// This definition is used to retrieve priority value of a job. After custom-executor API will be introduced officially,
/// the job priority API will be provided in the Swift world.
typedef __attribute__((aligned(2 * alignof(void *)))) struct {
    void *_Nonnull Metadata;
    int32_t RefCounts;
    void *_Nullable SchedulerPrivate[2];
    uint32_t Flags;
} Job;

/// A hook to take over global enqueuing.
typedef SWIFT_CC(swift) void (*swift_task_enqueueGlobal_original)(
    Job *_Nonnull job);

SWIFT_EXPORT_FROM(swift_Concurrency)
extern void *_Nullable swift_task_enqueueGlobal_hook;

/// A hook to take over global enqueuing with delay.
typedef SWIFT_CC(swift) void (*swift_task_enqueueGlobalWithDelay_original)(
    unsigned long long delay, Job *_Nonnull job);
SWIFT_EXPORT_FROM(swift_Concurrency)
extern void *_Nullable swift_task_enqueueGlobalWithDelay_hook;

typedef SWIFT_CC(swift) void (*swift_task_enqueueGlobalWithDeadline_original)(
    long long sec,
    long long nsec,
    long long tsec,
    long long tnsec,
    int clock, Job *_Nonnull job);
SWIFT_EXPORT_FROM(swift_Concurrency)
extern void *_Nullable swift_task_enqueueGlobalWithDeadline_hook;

/// A hook to take over main executor enqueueing.
typedef SWIFT_CC(swift) void (*swift_task_enqueueMainExecutor_original)(
    Job *_Nonnull job);
SWIFT_EXPORT_FROM(swift_Concurrency)
extern void *_Nullable swift_task_enqueueMainExecutor_hook;

#endif
