
/// The alerts array contains objects representing the severe weather warnings issued for the requested location by a governmental authority.
public struct Alert: Codable {
    
    /// A detailed description of the alert.
    public let description: String
    
    /// The UNIX time at which the alert will expire.
    public let expires: Int
    
    /// An array of strings representing the names of the regions covered by this weather alert.
    public let regions: [String]
    
    /// The severity of the weather alert. Will take one of the following values: "advisory" (an individual should be aware of potentially severe weather), "watch" (an individual should prepare for potentially severe weather), or "warning" (an individual should take immediate action to protect themselves and others from potentially severe weather).
    public let severity: String
    
    /// The UNIX time at which the alert was issued.
    public let time: Int
    
    /// A brief description of the alert.
    public let title: String
    
    /// An HTTP(S) URI that one may refer to for detailed information about the alert.
    public let uri: String
}
