
/// The flags object contains various metadata information related to the request.
public struct Flags: Codable {
    
    /// The presence of this property indicates that the Dark Sky data source supports the given location, but a temporary error (such as a radar station being down for maintenance) has made the data unavailable.
    public let darkSkyUnavailableMessage: String?
    
    /// The distance to the nearest weather station that contributed data to this response. Note, however, that many other stations may have also been used; this value is primarily for debugging purposes. This property's value is in miles (if US units are selected) or kilometers (if SI units are selected).
    /// - Attention: Although the official Dark Sky API Documentation lists this property as "required", in practice it can be nil, and therefore it is an `Optional`.
    public let nearestStation: Double?
    
    /// This property contains an array of IDs for each data source utilized in servicing this request.
    public let sources: [String]
    
    /// Indicates the units which were used for the data in this request.
    public let units: Units
    
    enum CodingKeys: String, CodingKey {
        case darkSkyUnavailableMessage = "darksky-unavailable"
        case nearestStation            = "nearest-station"
        case sources
        case units
    }
}
