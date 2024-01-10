extension Model.CurrentWeather {
    // MARK: - Coord
    struct Coord: Decodable {
        let lon: Double?
        let lat: Double?
    }
    
    // MARK: - Weather
    struct Weather: Decodable {
        let id: Int?
        let main: String?
        let description: String?
        let icon: String?
    }
    
    // MARK: - Main
    struct Main: Decodable {
        let temp: Double?
        let feelsLike: Double?
        let pressure: Int?
        let humidity: Int?
        let tempMin: Double?
        let tempMax: Double?
        let seaLevel: Int?
        let grndLevel: Int?
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case pressure
            case humidity
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case seaLevel = "sea_level"
            case grndLevel = "grnd_level"
        }
    }
    
    // MARK: - Wind
    struct Wind: Decodable {
        let speed: Double?
        let gust: Double?
        let deg: Int?
    }
    
    // MARK: - Clouds
    struct Clouds: Decodable {
        let all: Int?
    }
    
    struct Rain: Decodable {
        let oneHour: Double?
        let threeHour: Double?
        
        enum CodingKeys: String, CodingKey {
            case oneHour = "1h"
            case threeHour = "3h"
        }
    }
    
    struct Snow: Decodable {
        let oneHour: Double?
        let threeHour: Double?
        
        enum CodingKeys: String, CodingKey {
            case oneHour = "1h"
            case threeHour = "3h"
        }
    }
    
    // MARK: - Sys
    struct Sys: Decodable {
        let type: Int?
        let id: Int?
        let country: String?
        let sunrise: Int?
        let sunset: Int?
    }
    
    struct List: Decodable {
        let dt: Int?
        let main: Main?
        let weather: [Weather]?
        let clouds: Clouds?
        let wind: Wind?
        let visibility: Int?
        let pop: Double?
        let sys: Sys?
        let dtTxt: String?
        let rain: Rain?
        
        enum CodingKeys: String, CodingKey {
            case dt
            case main
            case weather
            case clouds
            case wind
            case visibility
            case pop
            case sys
            case dtTxt = "dt_txt"
            case rain
        }
    }
}
