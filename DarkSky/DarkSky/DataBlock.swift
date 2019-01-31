
/// A data block object represents the various weather phenomena occurring over a period of time.
public struct DataBlock: Codable {
    
    /// An array of data points, ordered by time, which together describe the weather conditions at the requested location over time.
    public let data: [DataPoint]
    
    /// A human-readable summary of this data block.
    public let summary: String?
    
    /// A machine-readable text summary of this data block. (May take on the same values as the iconproperty of data points.)
    public let icon: String?
}
