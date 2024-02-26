/// <!-- FishyJoes.export(Actors) -->
public enum Actors {
    /// <!-- FishyJoes.export(Actors.TemperatureLogger) -->
    public actor TemperatureLogger {
        /// <!-- FishyJoes.export(label) -->
        public nonisolated let label: String

        // TODO: support async variables
        // /// <!-- FishyJoes.export(measurements) -->
        public internal(set) var measurements: [Int]
        // TODO: support async variables
        // /// <!-- FishyJoes.export(max) -->
        public private(set) var max: Int

        /// <!-- FishyJoes.export(create) -->
        public init(label: String, measurement: Int) {
            self.label = label
            self.measurements = [measurement]
            self.max = measurement
        }

        /// <!-- FishyJoes.export(update) -->
        public func update(with measurement: Int) {
            measurements.append(measurement)
            if measurement > max {
                max = measurement
            }
        }

        /// <!-- FishyJoes.export(backwardsLabel) -->
        public nonisolated var backwardsLabel: String {
            String(label.reversed())
        }

        /// <!-- FishyJoes.export(min) -->
        public nonisolated func min() async -> Int {
            await measurements.min()!
        }
    }
}
