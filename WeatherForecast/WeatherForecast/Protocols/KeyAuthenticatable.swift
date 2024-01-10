import Foundation

protocol KeyAuthenticatable {
}

extension KeyAuthenticatable {
    private func checkAPIKey() -> Result<String, APIError> {
        guard let filePath = Bundle.main.path(forResource: "APIKeyList", ofType: "plist") else {
            return .failure(.noExistedAPIPlist)
        }
        
        if let plist = NSDictionary(contentsOfFile: filePath),
           let value = plist.object(forKey: "OPENWEATHERMAP_KEY") as? String {
            return .success(value)
        } else {
            return .failure(.noExistedAPIKey)
        }
    }
    
    var APIKey: String {
        switch checkAPIKey() {
        case .success(let APIKey):
            return APIKey
        case .failure(let error):
            print(error)
            return error.localizedDescription
        }
    }
}
