
import Foundation

extension Request {
    
    /// Returns a `URLRequest` if the parameters of `self` can be used to initialize a valid `URL` instance, otherwise throws.
    ///
    /// - Returns: The `URLRequest` initialized using the parameters of `self`.
    /// - Throws: A `DarkSkyError.invalidURL` instance if initialization of a valid `URL` fails. A `DarkSkyError.noSecretKeyProvided` instance if an empty string is provided for `secretKey`.
    public func asURLRequest() throws -> URLRequest {
        let url = try asURL()
        return URLRequest(url: url)
    }
    
    /// Returns a `URL` if the parameters of `self` can be used to initialize a valid `URL` instance, otherwise throws.
    ///
    /// - Returns: The `URL` initialized using the parameters of `self`.
    /// - Throws: A `DarkSkyError.invalidURL` instance if initialization of a valid `URL` fails. A `DarkSkyError.noSecretKeyProvided` instance if an empty string is provided for `secretKey`.
    public func asURL() throws -> URL {
        guard secretKey != "" else { throw DarkSkyError.noSecretKeyProvided }
        guard var components = URLComponents(string: "https://api.darksky.net/forecast/\(secretKey)/\(latitude),\(longitude)") else { throw DarkSkyError.invalidURL }
        components.queryItems = queryItems
        guard let url = components.url else { throw DarkSkyError.invalidURL }
        return url
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
