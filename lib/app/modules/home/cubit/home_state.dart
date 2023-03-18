part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.homePageStatus = HomePageStatus.loading,
    this.weatherModel,
    this.lPopularLocations = const [],
  });

  final HomePageStatus homePageStatus;
  final WeatherModel? weatherModel;
  final List<WeatherModel>? lPopularLocations;

  HomeState copyWith({
    HomePageStatus? homePageStatus,
    WeatherModel? weatherModel,
    List<WeatherModel>? lPopularLocations,
  }) =>
      HomeState(
        homePageStatus: homePageStatus ?? this.homePageStatus,
        weatherModel:weatherModel ?? this.weatherModel,
        lPopularLocations:lPopularLocations ?? this.lPopularLocations,
      );

  @override
  List<Object> get props => [
    homePageStatus,    
  ];
}
