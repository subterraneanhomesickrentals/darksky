
import XCTest
@testable import DarkSky

class DarkSkyTests: XCTestCase {
    
    static let secretKey = ""
    
    override func setUp() {
        super.setUp()
        DarkSky.secretKey = DarkSkyTests.secretKey
    }
    
    func testFetchingWeather() {
        
        var fetchResult: DarkSky.Result?
        
        let expectationa = expectation(description: "testFetchingWeather")
        
        DarkSky.weather(latitude: 28.608276, longitude: -80.604097) { result in
            fetchResult = result
            expectationa.fulfill()
        }
        
        waitForExpectations(timeout: 60)
        
        switch fetchResult! {
        case .failure(let error):
            XCTFail("Request failed with error: \(error)")
        case .success(_):
            break
        }
    }
}
