//
// A modified version of the JobQueue.swift from JavaScriptKit.
// See: https://github.com/swiftwasm/JavaScriptKit/commit/096584bb6959f16d97daf3ebf52039f98c36fdbf
// Becuase of our modifications we have a shared copyright at this point.
//

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
#if os(WASI) || true

import NodeAPI

// This file contains the job queue implementation which re-order jobs based on their priority.
// The current implementation is much simple to be easily debugged, but should be re-implemented
// using priority queue ideally.

struct QueueState: Sendable {
    fileprivate var headJob: UnownedJob?
    fileprivate var isSpinning = false
}

extension JavaScriptEventLoop {
    func insertJobQueue(job newJob: UnownedJob) {
        withUnsafeMutablePointer(to: &queueState.headJob) { headJobPtr in
            var position: UnsafeMutablePointer<UnownedJob?> = headJobPtr
            while let cur = position.pointee {
                if cur.rawPriority < newJob.rawPriority {
                    newJob.nextInQueue().pointee = cur
                    position.pointee = newJob
                    return
                }
                position = cur.nextInQueue()
            }
            newJob.nextInQueue().pointee = nil
            position.pointee = newJob
        }

        // TODO: use CAS when supporting multi-threaded environment
        if !queueState.isSpinning {
            self.queueState.isSpinning = true
            JavaScriptEventLoop.shared.queueMicrotask {
                self.runAllJobs()
            }
        }
    }

    func runAllJobs() {
        assert(queueState.isSpinning)

        while let job = self.claimNextFromQueue() {
            job._runSynchronously(on: self.asUnownedSerialExecutor())
        }

        queueState.isSpinning = false
    }

    func claimNextFromQueue() -> UnownedJob? {
        if let job = self.queueState.headJob {
            self.queueState.headJob = job.nextInQueue().pointee
            return job
        }
        return nil
    }
}

fileprivate extension UnownedJob {
    private func asImpl() -> UnsafeMutablePointer<NodeAPI.Job> {
        unsafeBitCast(self, to: UnsafeMutablePointer<NodeAPI.Job>.self)
    }

    var flags: JobFlags {
        JobFlags(bits: asImpl().pointee.Flags)
    }

    var rawPriority: UInt32 { flags.priority }

    func nextInQueue() -> UnsafeMutablePointer<UnownedJob?> {
        return withUnsafeMutablePointer(to: &asImpl().pointee.SchedulerPrivate.0) { rawNextJobPtr in
            let nextJobPtr = UnsafeMutableRawPointer(rawNextJobPtr).bindMemory(to: UnownedJob?.self, capacity: 1)
            return nextJobPtr
        }
    }
}

private struct JobFlags {
  var bits: UInt32 = 0

  var priority: UInt32 {
    (bits & 0xFF00) >> 8
  }
}

#endif
