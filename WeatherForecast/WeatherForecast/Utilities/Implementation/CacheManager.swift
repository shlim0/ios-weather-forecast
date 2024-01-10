import UIKit

final class CacheManager: Cacheable {
    static let shared = CacheManager()
    private static let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func loadImage(with imageID: String) -> UIImage? {
        let id = NSString(string: imageID)
        
        if let image = CacheManager.cache.object(forKey: id) { return image }

        return nil
    }

    func store(with imageID: String, image: UIImage) {
        let id = NSString(string: imageID)
        CacheManager.cache.setObject(image, forKey: id)
    }
}
