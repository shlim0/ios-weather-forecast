import Foundation

struct ImageAPI: Requestable {
    
    private let imageType: String
    
    init(imageType: String) {
        self.imageType = imageType
    }
    
    var path: URL? {
        let result: URL? = URL(string: "https://openweathermap.org/img/wn/\(imageType)@2x.png")
        return result
    }
}
