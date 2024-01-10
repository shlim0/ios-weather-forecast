import UIKit

extension UIImageView {
    static func load(from imageType: String, completion: @escaping (UIImage) -> Void) {
        let networkManager: NetworkManagerable = NetworkManager()
        
        if let image = CacheManager.shared.loadImage(with: imageType) {
            completion(image)
        } else {
            networkManager.fetchImage(request: ImageAPI(imageType: imageType)) { (result: Result<UIImage, NetworkError>) in
                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        completion(image)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
