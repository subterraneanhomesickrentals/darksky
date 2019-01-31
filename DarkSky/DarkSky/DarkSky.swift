
public enum DarkSky {
    
    public static var key: String?
    
    public enum Result {
        case success(Response)
        case failure(Error?)
    }
    
    public static func weather(key: String = key ?? "", latitude: Double, longitude: Double, exclude: Set<Request.ExcludableResponseData>? = nil, extend: Bool? = nil, language: Language? = nil, units: Units? = nil, completionHandler: @escaping (_ result: Result) -> Void) {
        let request = Request(key: key, latitude: latitude, longitude: longitude, exclude: exclude, extend: extend, language: language, units: units)
        let task = URLSession.shared.dataTask(with: request.url!) { (data: Data?, response: URLResponse?, error: Error?) in
            do {
                let response = try processTaskCompletion(data: data, response: response, error: error)
                completionHandler(.success(response))
            } catch {
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }
    
    static func processTaskCompletion(data: Data?, response: URLResponse?, error: Error?) throws -> Response {
        guard error == nil else {
            throw error!
        }
        guard let response = response as? HTTPURLResponse else {
            throw NSError()
        }
        guard case 200..<300 = response.statusCode else {
            throw NSError()
        }
        guard let data = data else {
            throw NSError()
        }
        do {
            return try JSONDecoder().decode(Response.self, from: data)
        } catch {
            throw error
        }
    }
}
