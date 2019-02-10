
extension Icon {
    public var emoji: String {
        switch self {
        case .clearDay:          return "🌞"
        case .clearNight:        return "🌜"
        case .rain:              return "☔️"
        case .snow:              return "❄️"
        case .sleet:             return "🌨"
        case .wind:              return "🌬"
        case .fog:               return "🌁"
        case .cloudy:            return "☁️"
        case .partlyCloudyDay:   return "🌞☁️"
        case .partlyCloudyNight: return "🌜☁️"
        case .undefined:         return "❓"
        }
    }
}
