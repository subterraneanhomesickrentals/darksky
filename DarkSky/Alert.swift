
/// The alerts array contains objects representing the severe weather warnings issued for the requested location by a governmental authority.
public struct Alert: Codable {
    
    /// A detailed description of the alert.
    public let description: String
    
    /// The UNIX time at which the alert will expire.
    public let expirationTime: Date
    
    /// An array of strings representing the names of the regions covered by this weather alert.
    public let regions: [String]
    
    /// The severity of the weather alert.
    public let severity: Severity
    
    /// The UNIX time at which the alert was issued.
    public let time: Date
    
    /// A brief description of the alert.
    public let title: String
    
    /// An HTTP(S) URI that one may refer to for detailed information about the alert.
    public let uri: URL
    
    /// The severity of the weather alert.
    public enum Severity: String, Codable {
        
        /// An individual should be aware of potentially severe weather.
        case advisory
        
        /// An individual should prepare for potentially severe weather.
        case watch
        
        /// An individual should take immediate action to protect themselves and others from potentially severe weather.
        case warning
    }
    
    public enum CodingKeys: String, CodingKey {
        case description
        case expirationTime = "expires"
        case regions
        case severity
        case time
        case title
        case uri
    }
}
