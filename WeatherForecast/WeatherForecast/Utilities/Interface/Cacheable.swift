import UIKit

protocol Cacheable: AnyObject {
    func loadImage(with imageID: String) -> UIImage?
    func store(with imageID: String, image: UIImage)
}
