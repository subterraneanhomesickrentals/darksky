
import XCTest
@testable import DarkSky

class DarkSkyTests: XCTestCase {
    
    static let secretKey = ""
    
    override func setUp() {
        super.setUp()
        🌩.secretKey = DarkSkyTests.secretKey
    }
    
    func testFetchingWeather() {
        
        var fetchResult: 🌩.Result?
        
        let e = expectation(description: "testFetchingWeather")
        
        🌩.weather(latitude: 28.608276, longitude: -80.604097) { result in
            fetchResult = result
            e.fulfill()
        }
        
        waitForExpectations(timeout: 60)
        
        switch fetchResult! {
        case .failure(let error):
            XCTFail("Request failed with error: \(error)")
        case .success(_):
            break
        }
    }
    
    func testExcludableCurrently() {
        do {
            let weather = try performWeatherRequest(exclude: [.currently])
            XCTAssertNil(weather.currently)
            XCTAssertNotNil(weather.minutely)
            XCTAssertNotNil(weather.hourly)
            XCTAssertNotNil(weather.daily)
            XCTAssertNotNil(weather.flags)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    func testExcludableMinutely() {
        do {
            let weather = try performWeatherRequest(exclude: [.minutely])
            XCTAssertNotNil(weather.currently)
            XCTAssertNil(weather.minutely)
            XCTAssertNotNil(weather.hourly)
            XCTAssertNotNil(weather.daily)
            XCTAssertNotNil(weather.flags)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    func testExcludableHourly() {
        do {
            let weather = try performWeatherRequest(exclude: [.hourly])
            XCTAssertNotNil(weather.currently)
            XCTAssertNotNil(weather.minutely)
            XCTAssertNil(weather.hourly)
            XCTAssertNotNil(weather.daily)
            XCTAssertNotNil(weather.flags)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    func testExcludableDaily() {
        do {
            let weather = try performWeatherRequest(exclude: [.daily])
            XCTAssertNotNil(weather.currently)
            XCTAssertNotNil(weather.minutely)
            XCTAssertNotNil(weather.hourly)
            XCTAssertNil(weather.daily)
            XCTAssertNotNil(weather.flags)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    func testExcludableAlerts() {
        do {
            let weather = try performWeatherRequest(exclude: [.alerts])
            XCTAssertNotNil(weather.currently)
            XCTAssertNotNil(weather.minutely)
            XCTAssertNotNil(weather.hourly)
            XCTAssertNotNil(weather.daily)
            XCTAssertNil(weather.alerts)
            XCTAssertNotNil(weather.flags)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    func testExcludableFlags() {
        do {
            let weather = try performWeatherRequest(exclude: [.flags])
            XCTAssertNotNil(weather.currently)
            XCTAssertNotNil(weather.minutely)
            XCTAssertNotNil(weather.hourly)
            XCTAssertNotNil(weather.daily)
            XCTAssertNil(weather.flags)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    func testExcludableEverything() {
        do {
            let weather = try performWeatherRequest(exclude: [.currently, .minutely, .hourly, .daily, .alerts, .flags])
            XCTAssertNil(weather.currently)
            XCTAssertNil(weather.minutely)
            XCTAssertNil(weather.hourly)
            XCTAssertNil(weather.daily)
            XCTAssertNil(weather.alerts)
            XCTAssertNil(weather.flags)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    func testExcludableNothing() {
        do {
            let weather = try performWeatherRequest(exclude: [])
            XCTAssertNotNil(weather.currently)
            XCTAssertNotNil(weather.minutely)
            XCTAssertNotNil(weather.hourly)
            XCTAssertNotNil(weather.daily)
            XCTAssertNotNil(weather.flags)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    enum FetchError: Error {
        case timeout
        case requestFailed(Error)
    }
    
    func performWeatherRequest(latitude: Double = 28.608276, longitude: Double = -80.604097, exclude: Set<Request.ExcludableResponseData>? = nil) throws -> Weather {
        
        var fetchResult: 🌩.Result?
        
        let e = expectation(description: "Weather Request")
        
        🌩.weather(latitude: latitude, longitude: longitude, exclude: exclude) { result in
            fetchResult = result
            e.fulfill()
        }
        
        waitForExpectations(timeout: 60.0)
        
        guard let result = fetchResult else {
            throw FetchError.timeout
        }
        
        switch result {
        case .failure(let error):
            throw FetchError.requestFailed(error)
        case .success(let weather):
            return weather
        }
    }
    
    func testAllCities() {
        City.allCases.forEach {
            do {
                let weather = try performWeatherRequest(latitude: $0.coordinates.latitude, longitude: $0.coordinates.longitude)
                XCTAssertNotNil(weather.currently)
                XCTAssertNotNil(weather.minutely)
                XCTAssertNotNil(weather.hourly)
                XCTAssertNotNil(weather.daily)
                XCTAssertNotNil(weather.flags)
            } catch {
                XCTFail("City: \($0) failed with error: \(error)")
            }
        }
    }
}
