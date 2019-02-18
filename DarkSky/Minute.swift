
import Foundation

extension Weather {
    
    /// A data point object contains various properties, each representing the average (unless otherwise specified) of a particular weather phenomenon occurring during a period of time: an instant in the case of currently, a minute for minutely, an hour for hourly, and a day for daily.
    public struct Minute: Codable {
        
        /// The amount of snowfall accumulation expected to occur, in inches. (If no snowfall is expected, this property will not be defined.)
        public let precipitationAccumulation: Double?
        
        /// The intensity (in inches of liquid water per hour) of precipitation occurring at the given time. This value is conditional on probability (that is, assuming any precipitation occurs at all).
        public let precipitationIntensity: Double?
        
        /// The standard deviation of the distribution of precipIntensity. (We only return this property when the full distribution, and not merely the expected mean, can be estimated with accuracy.)
        public let precipitationIntensityError: Double?
        
        /// The probability of precipitation occurring, between 0 and 1, inclusive.
        public let precipitationProbability: Double?
        
        /// The type of precipitation occurring at the given time. If defined, this property will have one of the following values: "rain", "snow", or "sleet" (which refers to each of freezing rain, ice pellets, and “wintery mix”). (If precipIntensity is zero, then this property will not be defined. Additionally, due to the lack of data in our sources, historical precipType information is usually estimated, rather than observed.)
        public let precipitationType: PrecipitationType?
        
        /// The UNIX time at which this data point begins. minutely data point are always aligned to the top of the minute, hourly data point objects to the top of the hour, and daily data point objects to midnight of the day, all according to the local time zone.
        public let time: Date
        
        public enum CodingKeys: String, CodingKey {
            case precipitationAccumulation   = "precipAccumulation"
            case precipitationIntensity      = "precipIntensity"
            case precipitationIntensityError = "precipIntensityError"
            case precipitationProbability    = "precipProbability"
            case precipitationType           = "precipType"
            case time
        }
    }
}
