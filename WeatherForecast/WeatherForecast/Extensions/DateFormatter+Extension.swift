import Foundation

extension DateFormatter {
    
    private convenience init(date: Date) {
        self.init()
        
        self.locale = Locale(identifier:"ko_KR")
        self.dateFormat = "MM/dd(E) HH시"
    }
    
    static func toString(by date: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(date))
        let dateFormatter = DateFormatter(date: date)
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
}
