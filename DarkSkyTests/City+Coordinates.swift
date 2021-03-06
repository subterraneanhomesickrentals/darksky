
extension City {
    var coordinates: Coordinates {
        switch self {
        case .newYork:       return Coordinates(latitude: 40.6943, longitude: -73.9249)
        case .losAngeles:    return Coordinates(latitude: 34.1140, longitude: -118.4068)
        case .chicago:       return Coordinates(latitude: 41.8373, longitude: -87.6861)
        case .miami:         return Coordinates(latitude: 25.7840, longitude: -80.2102)
        case .dallas:        return Coordinates(latitude: 32.7938, longitude: -96.7659)
        case .philadelphia:  return Coordinates(latitude: 40.0076, longitude: -75.134)
        case .houston:       return Coordinates(latitude: 29.7871, longitude: -95.3936)
        case .washington:    return Coordinates(latitude: 38.9047, longitude: -77.0163)
        case .atlanta:       return Coordinates(latitude: 33.7627, longitude: -84.4231)
        case .boston:        return Coordinates(latitude: 42.3189, longitude: -71.0838)
        case .phoenix:       return Coordinates(latitude: 33.5722, longitude: -112.0891)
        case .sanFrancisco:  return Coordinates(latitude: 37.7561, longitude: -122.4429)
        case .seattle:       return Coordinates(latitude: 47.6217, longitude: -122.3238)
        case .detroit:       return Coordinates(latitude: 42.3834, longitude: -83.1024)
        case .sanDiego:      return Coordinates(latitude: 32.8312, longitude: -117.1225)
        case .minneapolis:   return Coordinates(latitude: 44.9635, longitude: -93.2679)
        case .tampa:         return Coordinates(latitude: 27.9937, longitude: -82.4454)
        case .denver:        return Coordinates(latitude: 39.7621, longitude: -104.8759)
        case .brooklyn:      return Coordinates(latitude: 40.6501, longitude: -73.9496)
        case .queens:        return Coordinates(latitude: 40.7498, longitude: -73.7976)
        case .baltimore:     return Coordinates(latitude: 39.3051, longitude: -76.6144)
        case .saintLouis:    return Coordinates(latitude: 38.6358, longitude: -90.2451)
        case .riverside:     return Coordinates(latitude: 33.9382, longitude: -117.3949)
        case .lasVegas:      return Coordinates(latitude: 36.2288, longitude: -115.2603)
        case .portland:      return Coordinates(latitude: 45.5372, longitude: -122.65)
        case .sanAntonio:    return Coordinates(latitude: 29.4722, longitude: -98.5247)
        case .sacramento:    return Coordinates(latitude: 38.5666, longitude: -121.4683)
        case .sanJose:       return Coordinates(latitude: 37.3020, longitude: -121.8488)
        case .orlando:       return Coordinates(latitude: 28.4801, longitude: -81.3448)
        case .cleveland:     return Coordinates(latitude: 41.4766, longitude: -81.6805)
        case .pittsburgh:    return Coordinates(latitude: 40.4396, longitude: -79.9763)
        case .manhattan:     return Coordinates(latitude: 40.7834, longitude: -73.9662)
        case .cincinnati:    return Coordinates(latitude: 39.1412, longitude: -84.506)
        case .austin:        return Coordinates(latitude: 30.3038, longitude: -97.7545)
        case .kansasCity:    return Coordinates(latitude: 39.1239, longitude: -94.5541)
        case .indianapolis:  return Coordinates(latitude: 39.7771, longitude: -86.1458)
        case .columbus:      return Coordinates(latitude: 39.9859, longitude: -82.9852)
        case .virginiaBeach: return Coordinates(latitude: 36.7335, longitude: -76.0435)
        case .bronx:         return Coordinates(latitude: 40.8501, longitude: -73.8662)
        case .charlotte:     return Coordinates(latitude: 35.2080, longitude: -80.8308)
        case .milwaukee:     return Coordinates(latitude: 43.0640, longitude: -87.9669)
        case .providence:    return Coordinates(latitude: 41.8229, longitude: -71.4186)
        case .jacksonville:  return Coordinates(latitude: 30.3322, longitude: -81.6749)
        case .memphis:       return Coordinates(latitude: 35.1047, longitude: -89.9773)
        case .nashville:     return Coordinates(latitude: 36.1714, longitude: -86.7844)
        case .saltLakeCity:  return Coordinates(latitude: 40.7774, longitude: -111.9301)
        case .richmond:      return Coordinates(latitude: 37.5294, longitude: -77.4755)
        case .newOrleans:    return Coordinates(latitude: 30.0687, longitude: -89.9288)
        case .raleigh:       return Coordinates(latitude: 35.8323, longitude: -78.6441)
        case .louisville:    return Coordinates(latitude: 38.1662, longitude: -85.6488)
        case .oklahomaCity:  return Coordinates(latitude: 35.4677, longitude: -97.5138)
        }
    }
}
