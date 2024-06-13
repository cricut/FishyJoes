package com.cricut.testapi

object Utilities {
    fun attachXcodeToCurrentProcess() {
        val script = """
                tell application "Xcode"
                try
                    set workspaceDocument to workspace document 1
                    on error
                            set workspaceDocument to create temporary debugging workspace
                    end try
                    repeat 120 times
                    if loaded of workspaceDocument is true then
                            exit repeat
                            end if
                    delay 0.5
                    end repeat
                            if loaded of workspaceDocument is false then
                            error "Xcode workspace did not finish loading within timeout."
                    end if
                    attach workspaceDocument to process identifier ${ProcessHandle.current().pid()} with suspended
                end tell
            """.trimIndent()
        Runtime.getRuntime().exec(arrayOf("osascript", "-e", script), null, null).waitFor()
        Thread.sleep(5000)
    }
}
