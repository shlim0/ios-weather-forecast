import Foundation

protocol RequestSessionable: AnyObject {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> RequestDataTaskable
}

extension URLSession: RequestSessionable {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> RequestDataTaskable {
        return dataTask(with: url, completionHandler: completionHandler) as URLSessionDataTask
    }
}
