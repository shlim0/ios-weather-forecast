import UIKit

protocol Networkable: AnyObject {
    var networkManager: NetworkManagerable { get }

    func fetchWeatherData<T: Decodable>(request: Requestable, completion: @escaping (T) -> Void)
    func fetchImage(request: Requestable, completion: @escaping (UIImage) -> Void)
}

extension Networkable {
    func fetchWeatherData<T: Decodable>(request: Requestable, completion: @escaping (T) -> Void) {
        
        networkManager.fetch(request: request) { (result: Result<T, NetworkError>) in
            switch result {
            case .success(let weatherResponse):
                completion(weatherResponse)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchImage(request: Requestable, completion: @escaping (UIImage) -> Void) {
        networkManager.fetchImage(request: request) { result in
            switch result {
            case .success(let image):
                completion(image)
            case .failure(let error):
                print(error)
            }
        }
    }
}
