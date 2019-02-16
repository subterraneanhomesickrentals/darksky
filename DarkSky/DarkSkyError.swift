
import Foundation

/// These are various errors which may occur when fetching or parsing weather data from the Dark Sky API.
public enum DarkSkyError: Error {
    
    /// The request to fetch the weather was not initiated because no secret key was provided. Please provide a Dark Sky API Secret Key via `DarkSky.secretKey`, or via the `secretKey` parameter of the `DarkSky.weather()` method.
    case noSecretKeyProvided
    
    /// The string used to form the `URL` of the request was not valid.
    case invalidURL
    
    /// The URL request to fetch the weather failed.
    case requestFailed(Error)
    
    /// An unexpected error occured when processing the HTTP response from the server.
    case unexpected
    
    /// The request completed, but the HTTP status code indicates an error.
    case statusCode(HTTPURLResponse)
    
    /// The API responded, but did not provide any data.
    case noData
    
    /// The request completed successfully, but an error occurred when decoding the data as JSON.
    case jsonDecoding(Error)
}
