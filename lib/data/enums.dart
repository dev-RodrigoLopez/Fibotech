enum SessionStatus {
  success,
  gpsbadstate,
  none,
}

enum GpsPermissionStatus {
  denied,
  waiting,
  successFull,
  deniedForever,
  pure,
  notactivated
}

enum HomePageStatus { loading, success, notSuccess, pure }
enum WeatherPageStatus { loading, success, notSuccess, empty }
enum SearchPageStatus { loading, success, notSuccess, empty, pure }