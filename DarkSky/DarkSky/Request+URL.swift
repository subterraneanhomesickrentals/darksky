
extension Request {
    
    /// The fully formed request URL, including the HTTP query string.
    public var url: URL? {
        var components = URLComponents(string: "https://api.darksky.net/forecast/\(secretKey)/\(latitude),\(longitude)")
        components?.queryItems = queryItems
        return components?.url
    }
    
    var queryItems: [URLQueryItem]? {
        
        var items: [URLQueryItem] = []
        
        if let exclude = exclude, exclude.count > 0 {
            let value = exclude.map { $0.rawValue }.joined(separator: ",")
            items.append(URLQueryItem(name: "exclude", value: value))
        }
        
        if let extend = extend, extend {
            items.append(URLQueryItem(name: "extend", value: "hourly"))
        }
        
        if let language = language {
            items.append(URLQueryItem(name: "lang", value: language.rawValue))
        }
        
        if let units = units {
            items.append(URLQueryItem(name: "units", value: units.rawValue))
        }
        
        return (items.count > 0) ? items : nil
    }
}
