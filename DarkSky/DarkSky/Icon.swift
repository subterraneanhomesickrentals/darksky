
/// Can be used to pictorially summarize the weather conditions of a data point.
public enum Icon: String, Codable {
    
    case clearDay          = "clear-day"
    case clearNight        = "clear-night"
    case rain              = "rain"
    case snow              = "snow"
    case sleet             = "sleet"
    case wind              = "wind"
    case fog               = "fog"
    case cloudy            = "cloudy"
    case partlyCloudyDay   = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
    
    /// This indicates that the API has specified a new icon type which was not previously documented. See the Dark Sky API Documentation: "Developers should ensure that a sensible default is defined, as additional values, such as hail, thunderstorm, or tornado, may be defined in the future."
    case undefined
}

// Since we cannot anticipate future additional icon values, we must customize our `Decodable` conformance to gracefully handle those future values, rather than throw an error (which would be the default behavior via automatic conformance).
extension Icon {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        self = Icon(rawValue: value) ?? .undefined
    }
}
