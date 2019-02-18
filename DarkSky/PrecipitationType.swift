
extension Weather {
    
    /// The type of precipitation occurring at the given time. If defined, this property will have one of the following values: "rain", "snow", or "sleet" (which refers to each of freezing rain, ice pellets, and “wintery mix”). (If precipIntensity is zero, then this property will not be defined. Additionally, due to the lack of data in our sources, historical precipType information is usually estimated, rather than observed.)
    public enum PrecipitationType: String, Codable {
        
        /// Rain.
        case rain
        
        /// Snow.
        case snow
        
        /// Refers to each of freezing rain, ice pellets, and “wintery mix”.
        case sleet
        
        /// This indicates that the API has specified a new type which was not previously documented.
        case undefined
    }
}

// Since we cannot anticipate future additional values, we must customize our `Decodable` conformance to gracefully handle those future values, rather than throw an error (which would be the default behavior via automatic conformance).
extension Weather.PrecipitationType {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        self = Weather.PrecipitationType(rawValue: value) ?? .undefined
    }
}
