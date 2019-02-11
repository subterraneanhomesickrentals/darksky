# Dark Sky
Dark Sky API client written in Swift

🚧 This project is currently in development. 🚧

## Installation

### Carthage
```
github "subterraneanhomesickrentals/darksky"
```

### CocoaPods
Not supported.

## Usage

### 🌩

```swift
🌩.secretKey = "<#Your Dark Sky API Secret Key#>"

🌩.weather(latitude: 28.608276, longitude: -80.604097) { result in
    switch result {
    case .success(let weather): print(weather.currently?.temperature)
    case .failure(let error):   print(error)
    }
}
```

### Alamofire

To use DarkSky with Alamofire, extend `DarkSky.Request` to conform to Alamofire's `URLConvertible` protocol, then simply use `AF.request()` as usual:

```swift
import DarkSky
import Alamofire

extension DarkSky.Request: URLConvertible {  }

func fetchWeather() {

    let request = Request(secretKey: "", latitude: 28.608276, longitude: -80.604097)

    AF.request(request).validate().responseDecodable(decoder: Weather.jsonDecoder) { (response: DataResponse<Weather>) in
        switch response.result {
        case .success(let weather): print(weather.currently?.temperature)
        case .failure(let error):   print(error)
        }
    }
}
```
