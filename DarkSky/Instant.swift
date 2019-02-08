
/// A data point object contains various properties, each representing the average (unless otherwise specified) of a particular weather phenomenon occurring during a period of time: an instant in the case of currently, a minute for minutely, an hour for hourly, and a day for daily.
public struct Instant: Codable {
    
    /// The apparent (or “feels like”) temperature in degrees Fahrenheit.
    public let apparentTemperature: Double?
    
    /// The percentage of sky occluded by clouds, between 0 and 1, inclusive.
    public let cloudCover: Double?
    
    /// The dew point in degrees Fahrenheit.
    public let dewPoint: Double?
    
    /// The relative humidity, between 0 and 1, inclusive.
    public let humidity: Double?
    
    /// A machine-readable text summary of this data point, suitable for selecting an icon for display. If defined, this property will have one of the following values: clear-day, clear-night, rain, snow, sleet, wind, fog, cloudy, partly-cloudy-day, or partly-cloudy-night. (Developers should ensure that a sensible default is defined, as additional values, such as hail, thunderstorm, or tornado, may be defined in the future.)
    public let icon: Icon?
    
    /// The approximate direction of the nearest storm in degrees, with true north at 0° and progressing clockwise. (If nearestStormDistance is zero, then this value will not be defined.)
    public let nearestStormBearing: Int?
    
    /// The approximate distance to the nearest storm in miles. (A storm distance of 0 doesn’t necessarily refer to a storm at the requested location, but rather a storm in the vicinity of that location.)
    public let nearestStormDistance: Double?
    
    /// The columnar density of total atmospheric ozone at the given time in Dobson units.
    public let ozone: Double?
    
    /// The intensity (in inches of liquid water per hour) of precipitation occurring at the given time. This value is conditional on probability (that is, assuming any precipitation occurs at all).
    public let precipitationIntensity: Double?
    
    /// The standard deviation of the distribution of precipIntensity. (We only return this property when the full distribution, and not merely the expected mean, can be estimated with accuracy.)
    public let precipitationIntensityError: Double?
    
    /// The probability of precipitation occurring, between 0 and 1, inclusive.
    public let precipitationProbability: Double?
    
    /// The type of precipitation occurring at the given time. If defined, this property will have one of the following values: "rain", "snow", or "sleet" (which refers to each of freezing rain, ice pellets, and “wintery mix”). (If precipIntensity is zero, then this property will not be defined. Additionally, due to the lack of data in our sources, historical precipType information is usually estimated, rather than observed.)
    public let precipitationType: String?
    
    /// The sea-level air pressure in millibars.
    public let pressure: Double?
    
    /// A human-readable text summary of this data point. (This property has millions of possible values, so don’t use it for automated purposes: use the icon property, instead!)
    public let summary: String?
    
    /// The air temperature in degrees Fahrenheit.
    public let temperature: Double?
    
    /// The UNIX time at which this data point begins. minutely data point are always aligned to the top of the minute, hourly data point objects to the top of the hour, and daily data point objects to midnight of the day, all according to the local time zone.
    public let time: Date
    
    /// The UV index.
    public let uvIndex: Int?
    
    /// The average visibility in miles, capped at 10 miles.
    public let visibility: Double?
    
    /// The direction that the wind is coming from in degrees, with true north at 0° and progressing clockwise. (If windSpeed is zero, then this value will not be defined.)
    public let windBearing: Int?
    
    /// The wind gust speed in miles per hour.
    public let windGust: Double?
    
    /// The wind speed in miles per hour.
    public let windSpeed: Double?
    
    public enum CodingKeys: String, CodingKey {
        case apparentTemperature
        case cloudCover
        case dewPoint
        case humidity
        case icon
        case nearestStormBearing
        case nearestStormDistance
        case ozone
        case precipitationIntensity      = "precipIntensity"
        case precipitationIntensityError = "precipIntensityError"
        case precipitationProbability    = "precipProbability"
        case precipitationType           = "precipType"
        case pressure
        case summary
        case temperature
        case time
        case uvIndex
        case visibility
        case windBearing
        case windGust
        case windSpeed
    }
}
