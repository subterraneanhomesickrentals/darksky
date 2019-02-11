
public enum DarkSky {
    
    /// Your Dark Sky secret key. (Your secret key must be kept secret; in particular, do not embed it in client source code.)
    public static var secretKey: String?
    
    public enum Result {
        case success(Weather)
        case failure(Error)
    }
    
    private static var session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
    
    public static func weather(secretKey: String = secretKey ?? "", latitude: Double, longitude: Double, exclude: Set<Request.ExcludableResponseData>? = nil, extend: Bool? = nil, language: Language? = nil, units: Units? = nil, completionHandler: @escaping (_ result: Result) -> Void) {
        
        let request = Request(secretKey: secretKey, latitude: latitude, longitude: longitude, exclude: exclude, extend: extend, language: language, units: units)
        
        let url: URL
        do {
            url = try request.asURL()
        } catch {
            completionHandler(.failure(error))
            return
        }
        
        let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            do {
                let response = try processTaskCompletion(data: data, response: response, error: error)
                completionHandler(.success(response))
            } catch {
                completionHandler(.failure(error))
            }
        }
        
        task.resume()
    }
    
    static func processTaskCompletion(data: Data?, response: URLResponse?, error: Error?) throws -> Weather {
        
        guard error == nil                                else { throw DarkSkyError.requestFailed(error!) }
        guard let response = response as? HTTPURLResponse else { throw DarkSkyError.unexpected }
        guard case 200..<300 = response.statusCode        else { throw DarkSkyError.statusCode(response) }
        guard let data = data                             else { throw DarkSkyError.noData }
        
        do {
            return try Weather.jsonDecoder.decode(Weather.self, from: data)
        } catch {
            throw DarkSkyError.jsonDecoding(error)
        }
    }
}
