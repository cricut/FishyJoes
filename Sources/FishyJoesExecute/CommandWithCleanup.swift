import swsh

class CommandWithCleanup: Command {
    let command: Command
    let cleanup: Command

    init(command: Command, cleanup: Command) {
        self.command = command
        self.cleanup = cleanup
    }

    func coreAsync(fdMap: FDMap) -> CommandResult {
        command.coreAsync(fdMap: fdMap)
    }

    deinit {
        try? cleanup.run()
    }
}
