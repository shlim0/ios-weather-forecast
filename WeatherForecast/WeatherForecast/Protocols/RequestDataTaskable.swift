import Foundation

protocol RequestDataTaskable: AnyObject {
    func resume()
}

extension URLSessionDataTask: RequestDataTaskable { }
