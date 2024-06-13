/// <!-- FishyJoes.export(Results) -->
public enum Results {
    /// <!-- FishyJoes.export(Results.Error) -->
    public struct Error: Swift.Error {
        public let message: String

        public init(message: String) {
            self.message = message
        }
    }

    /// <!-- FishyJoes.export(aSuccess) -->
    public static var aSuccess: Result<Int, Error> { .success(42) }
    /// <!-- FishyJoes.export(aFailure) -->
    public static var aFailure: Result<Int, Error> { .failure(Error(message: "reboot needed")) }

    /// <!-- FishyJoes.export(processResult) -->
    public static func processResult(_ result: Result<String, Error>) -> String {
        switch result {
        case .success(let success):
            return success.uppercased()
        case .failure(let failure):
            return "fail: \(failure.message)"
        }
    }
}
