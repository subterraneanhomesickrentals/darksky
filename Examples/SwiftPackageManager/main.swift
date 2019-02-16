
import Foundation
import DarkSky

🌩.secretKey = ""

🌩.weather(latitude: 28.608276, longitude: -80.604097) { result in
    switch result {
    case .success(let weather):
        print(weather.currently?.temperature ?? 0)
    case .failure(let error):
        print("❌ Error: \(error)")
    }
    exit(EXIT_SUCCESS)
}

RunLoop.main.run()
