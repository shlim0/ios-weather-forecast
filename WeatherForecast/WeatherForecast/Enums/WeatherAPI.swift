import CoreLocation

enum WeatherAPI {
    case current(_ coordinate: CLLocationCoordinate2D)
    case fiveDays(_ coordinate: CLLocationCoordinate2D)
}

extension WeatherAPI: Requestable {
    
    var path: URL? {
        let result: URL? = fetchPath()
        return result
    }
    
    private func fetchPath() -> URL? {
        switch self {
        case .current(let coordinate):
            var components = fetchComponent(coordinate)
            components?.path = "/data/2.5/weather"
            return components?.url
        case .fiveDays(let coordinate):
            var components = fetchComponent(coordinate)
            components?.path = "/data/2.5/forecast"
            return components?.url
        }
    }
}

extension WeatherAPI: KeyAuthenticatable {
    
    private func fetchComponent(_ coordinate: CLLocationCoordinate2D) -> URLComponents? {
        var components = URLComponents(string: "https://api.openweathermap.org")
        
        components?.queryItems = [
            URLQueryItem(name: "lat", value: "\(coordinate.latitude)"),
            URLQueryItem(name: "lon", value: "\(coordinate.longitude)"),
            URLQueryItem(name: "appid", value: "\(APIKey)"),
            URLQueryItem(name: "units", value: "metric")
        ]
        
        return components
    }
}
