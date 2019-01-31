
/// The API response.
public struct Response: Codable {
    
    /// The requested latitude.
    public let latitude: Double
    
    /// The requested longitude.
    public let longitude: Double
    
    /// The IANA timezone name for the requested location. This is used for text summaries and for determining when hourly and daily data block objects begin.
    public let timezone: String
    
    /// DEPRECATED. The current timezone offset in hours. (Use of this property will almost certainly result in Daylight Saving Time bugs. Please use timezone, instead.)
    public let offset: Int?
}
