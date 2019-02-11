
import UIKit
import DarkSky
import Alamofire

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label?.text = "Loading..."
        
        let request = Request(secretKey: "", latitude: 28.608276, longitude: -80.604097)
        
        AF.request(request).validate().responseDecodable(decoder: Weather.jsonDecoder) { (response: DataResponse<Weather>) in
            switch response.result {
            case .success(let weather):
                self.label?.text = String(format: "%.0f", weather.currently?.temperature ?? 0) + " \(weather.currently?.icon?.emoji ?? "🤷‍♂️")"
            case .failure(let error):
                self.label?.text = "\(error)"
            }
        }
    }
}

extension DarkSky.Request: URLConvertible {  }
extension DarkSky.Request: URLRequestConvertible {  }
