import Foundation

enum NetworkError: Error {
    case urlError(_ url: Requestable?)
    case unknownError(_ error: Error)
    case serverError(_ response: URLResponse?)
    case dataUnwrappingError(_ data: Data?)
    case decodingError(_ error: Error)
}
