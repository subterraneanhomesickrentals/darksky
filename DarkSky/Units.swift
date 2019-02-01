
/// Units of measurement.
public enum Units: String {
    
    /// Automatically select units based on geographic location.
    case auto = "auto"
    
    /// Same as `si`, except that `windSpeed` and `windGust` are in kilometers per hour.
    case ca   = "ca"
    
    /// Same as `si`, except that `nearestStormDistance` and `visibility` are in miles, and `windSpeed` and `windGust` in miles per hour.
    case uk2  = "uk2"
    
    /// Imperial units (the default).
    case us   = "us"
    
    /// SI units.
    case si   = "si"
}
