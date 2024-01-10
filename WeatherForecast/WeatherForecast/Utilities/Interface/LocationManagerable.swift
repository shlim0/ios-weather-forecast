import CoreLocation

typealias LocationCompletion = (Result<(CLLocationCoordinate2D, CLPlacemark), LocationError>) -> Void

protocol LocationManagerable {
    func request(coordinate: CLLocationCoordinate2D?, completion: @escaping LocationCompletion)
}

extension LocationManagerable {
    func request(coordinate: CLLocationCoordinate2D?, completion: @escaping LocationCompletion) { }
}
