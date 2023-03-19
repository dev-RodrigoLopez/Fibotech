import 'package:fibotech/data/model/weather_rest_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class WeatherModelOb {
  WeatherModelOb({
    this.id = 0,
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.state,
    required this.country,
    required this.temp,
    required this.fechaActualizacion,
    required this.iconWeather,
    required this.descriptionWeather,
    this.weatherModelRest,
  });

  @Id()
  int id;
  final double latitude;
  final double longitude;
  final String city; // required format yyyy-MM-dd HH:mm:ss
  final String state; // required format yyyy-MM-dd HH:mm:ss
  final String country;
  final double temp;
  final int    fechaActualizacion;
  final String iconWeather;
  final String descriptionWeather;
  WeatherModel? weatherModelRest;

  WeatherModelOb copyWith({
    double? latitude,
    double? longitude,
    String? city,
    String? state,
    String? country,
    double? temp,
    int   ? fechaActualizacion,
    String? iconWeather,
    String? descriptionWeather,
    WeatherModel? weatherModelRest,
  }) =>
      WeatherModelOb(
        latitude : latitude ?? this.latitude,
        longitude : longitude ?? this.longitude,
        city : city ?? this.city,
        state : state ?? this.state,
        country : country ?? this.country,
        temp : temp ?? this.temp,
        fechaActualizacion : fechaActualizacion ?? this.fechaActualizacion,
        iconWeather : iconWeather ?? this.iconWeather,
        descriptionWeather : descriptionWeather ?? this.descriptionWeather,
        weatherModelRest : weatherModelRest ?? this.weatherModelRest,
      );

  static String getTableSqlite() {
    return ' CREATE TABLE WeatherModelOb ('
        ' id INTEGER PRIMARY KEY,'
        ' latitude REAL,'
        ' longitude REAL,'
        ' altitude REAL,'
        ' idUsuario INTEGER,'
        ' idProyecto INTEGER,'
        ' fecha TEXT,'
        ' determinanteGsp INTEGER,'
        ' statusSync INTEGER,'
        ' fechaSync TEXT'
        ' )';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'latitude' : latitude,
      'longitude' : longitude,
      'city' : city,
      'state' : state,
      'country' : country,
      'temp' : temp,
      'fechaActualizacion' : fechaActualizacion,
      'iconWeather' : iconWeather,
      'descriptionWeather' : descriptionWeather,
    };
  }
}
