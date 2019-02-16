
import Foundation

/// The API response.
public struct Weather: Codable {
    
    /// The requested latitude.
    public let latitude: Double
    
    /// The requested longitude.
    public let longitude: Double
    
    /// The IANA timezone name for the requested location. This is used for text summaries and for determining when hourly and daily data block objects begin.
    public let timeZone: String
    
    /// DEPRECATED. The current timezone offset in hours. (Use of this property will almost certainly result in Daylight Saving Time bugs. Please use timezone, instead.)
    public let timeZoneOffset: Double?
    
    /// A data point containing the current weather conditions at the requested location.
    public let currently: Instant?
    
    /// A data block containing the weather conditions minute-by-minute for the next hour.
    public let minutely: DataBlock<Minute>?
    
    /// A data block containing the weather conditions hour-by-hour for the next two days.
    public let hourly: DataBlock<Hour>?
    
    /// A data block containing the weather conditions day-by-day for the next week.
    public let daily: DataBlock<Day>?
    
    /// An alerts array, which, if present, contains any severe weather alerts pertinent to the requested location.
    public let alerts: [Alert]?
    
    /// A flags object containing miscellaneous metadata about the request.
    public let flags: Flags?
    
    public enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case timeZone       = "timezone"
        case timeZoneOffset = "offset"
        case currently
        case minutely
        case hourly
        case daily
        case alerts
        case flags
    }
    
    public private(set) static var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()
}
