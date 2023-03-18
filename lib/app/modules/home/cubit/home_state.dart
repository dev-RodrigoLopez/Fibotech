part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.sessionStatus = SessionStatus.success,
    this.homePageStatus = HomePageStatus.loading,
    this.viewGpsAlert = false,
    this.checkAppApptransparency  = false, 
    this.weatherModel,
    this.lPopularLocations = const [],
  });

  final SessionStatus sessionStatus;
  final HomePageStatus homePageStatus;
  final bool viewGpsAlert;
  final bool checkAppApptransparency;
  final WeatherModel? weatherModel;
  final List<WeatherModel>? lPopularLocations;

  HomeState copyWith({
    SessionStatus? sessionStatus,
    HomePageStatus? homePageStatus,
    bool? viewGpsAlert,
    bool? checkAppApptransparency,
    WeatherModel? weatherModel,
    List<WeatherModel>? lPopularLocations,
  }) =>
      HomeState(
        sessionStatus: sessionStatus ?? this.sessionStatus,
        homePageStatus: homePageStatus ?? this.homePageStatus,
        viewGpsAlert: viewGpsAlert ?? this.viewGpsAlert,
        checkAppApptransparency:checkAppApptransparency ?? this.checkAppApptransparency,
        weatherModel:weatherModel ?? this.weatherModel,
        lPopularLocations:lPopularLocations ?? this.lPopularLocations,
      );

  @override
  List<Object> get props => [
    sessionStatus,    
    homePageStatus,    
    viewGpsAlert,
  ];
}
