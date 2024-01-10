extension Model.FiveDaysWeather {
    // MARK: - List
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
        let tempKf: Double?
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case pressure
            case seaLevel = "sea_level"
            case grndLevel = "grnd_level"
            case humidity
            case tempKf = "temp_kf"
        }
    }
    
    // MARK: - Weather
    struct Weather: Decodable {
        let id: Int?
        let main: String?
        let description: String?
        let icon: String?
    }
    
    // MARK: - Clouds
    struct Clouds: Decodable {
        let all: Int?
    }
    
    // MARK: - Wind
    struct Wind: Decodable {
        let speed: Double?
        let deg: Int?
        let gust: Double?
    }
    
    // MARK: - Rain
    struct Rain: Decodable {
        let threeHour: Double?
        
        enum CodingKeys: String, CodingKey {
            case threeHour = "3h"
        }
    }
    
    // MARK: - Snow
    struct Snow: Decodable {
        let threeHour: Double?
        
        enum CodingKeys: String, CodingKey {
            case threeHour = "3h"
        }
    }
    
    // MARK: - Sys
    struct Sys: Decodable {
        let pod: String?
    }
    
    // MARK: - City
    struct City: Decodable {
        let id: Int?
        let name: String?
        let coord: Coord?
        let country: String?
        let population: Int?
        let timezone: Int?
        let sunrise: Int?
        let sunset: Int?
    }
    
    // MARK: - Coord
    struct Coord: Decodable {
        let lat: Double?
        let lon: Double?
    }
}
