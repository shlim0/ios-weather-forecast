import UIKit

protocol NetworkManagerable: AnyObject {
    func fetch<T: Decodable>(request: Requestable?, completion: @escaping (Result<T, NetworkError>) -> Void)
    func fetchImage(request: Requestable?, completion: @escaping (Result<UIImage, NetworkError>) -> Void)
}

extension NetworkManagerable {
    func fetch<T: Decodable>(request: Requestable?, completion: @escaping (Result<T, NetworkError>) -> Void) { }
    func fetchImage(request: Requestable?, completion: @escaping (Result<UIImage, NetworkError>) -> Void) {}
}
