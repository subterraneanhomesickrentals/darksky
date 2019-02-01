
/// The API request.
public struct Request {
    
    /// Your Dark Sky secret key. (Your secret key must be kept secret; in particular, do not embed it in client source code.)
    public let secretKey: String
    
    /// The latitude of a location (in decimal degrees). Positive is north, negative is south.
    public let latitude: Double
    
    /// The longitude of a location (in decimal degrees). Positive is east, negative is west.
    public let longitude: Double
    
    /// Exclude some number of data blocks from the API response. This is useful for reducing latency and saving cache space.
    public let exclude: Set<ExcludableResponseData>?
    
    /// When present, return hour-by-hour data for the next 168 hours, instead of the next 48. When using this option, we strongly recommend enabling HTTP compression.
    public let extend: Bool?
    
    /// Return summary properties in the desired language. Note that units in the summary will be set according to the units parameter, so be sure to set both parameters appropriately. If set to `nil`, no language will be specified in the request, and the API will return the summary properties using its default language (English).
    public let language: Language?
    
    /// Return weather conditions in the requested units.
    public let units: Units?
    
    /// The types of data that can be excluded from the API response.
    public enum ExcludableResponseData: String {
        case currently
        case minutely
        case hourly
        case daily
        case alerts
        case flags
    }
    
    public init(secretKey: String, latitude: Double, longitude: Double, exclude: Set<ExcludableResponseData>? = nil, extend: Bool? = nil, language: Language? = nil, units: Units? = nil) {
        self.secretKey = secretKey
        self.latitude = latitude
        self.longitude = longitude
        self.exclude = exclude
        self.extend = extend
        self.language = language
        self.units = units
    }
}
