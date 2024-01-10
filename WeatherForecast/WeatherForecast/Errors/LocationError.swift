enum LocationError: Error {
    case didFailFetchLocationError
    case noLocationError
    case noPlacemarkError
    case noLocationAuthorizationError
    case unknownLocationAuthorizationError
}
