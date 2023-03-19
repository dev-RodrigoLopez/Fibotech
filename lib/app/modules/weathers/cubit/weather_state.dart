part of 'weather_cubit.dart';

class WeatherState extends Equatable {
  const WeatherState({
    this.lWeather = const [],
    this.statuPage = WeatherPageStatus.loading,
  });

  final List<WeatherModelOb> lWeather;
  final WeatherPageStatus statuPage;

  WeatherState copyWith({
    List<WeatherModelOb>? lWeather,
    WeatherPageStatus? statuPage,
  }) => WeatherState(
    lWeather: lWeather ?? this.lWeather,
    statuPage: statuPage ?? this.statuPage,
  );

  @override
  List<Object> get props => [
    lWeather,
    statuPage,
  ];
}

