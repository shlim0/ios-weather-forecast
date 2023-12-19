import CoreLocation

struct Locator {
    private let locationManager = LocationManager()
    
    func requestData(coordinate: CLLocationCoordinate2D?,completion: @escaping (CLLocationCoordinate2D, CLPlacemark) -> Void) {

        locationManager.request(coordinate: coordinate) { result in
            switch result {
            case .success((let coordinate, let placemark)):
                completion(coordinate, placemark)
            case .failure(let error):
                print(error)
            }
        }
    }
}
