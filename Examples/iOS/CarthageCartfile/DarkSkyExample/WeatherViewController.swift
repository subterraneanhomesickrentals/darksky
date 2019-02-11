
import UIKit
import DarkSky

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label?.text = "Loading..."
        
        DarkSky.secretKey = ""
        
        DarkSky.weather(latitude: 28.608276, longitude: -80.604097) { result in
            switch result {
            case .success(let weather):
                self.label?.text = String(format: "%.0f", weather.currently?.temperature ?? 0) + " \(weather.currently?.icon?.emoji ?? "🤷‍♂️")"
            case .failure(let error):
                self.label?.text = error.localizedDescription
            }
        }
    }
}
