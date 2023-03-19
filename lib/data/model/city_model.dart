import 'dart:convert';

import 'package:fibotech/data/model/weather_rest_model.dart';

class CityModel {
    CityModel({
        required this.name,
        required this.lat,
        required this.lon,
        required this.country,
        required this.state,
        this.weatherModelRest,
    });

    final String name;
    final double lat;
    final double lon;
    final String country;
    final String state;
          WeatherModel? weatherModelRest;

    CityModel copyWith({
      String? name,
      double? lat,
      double? lon,
      String? country,
      String? state,
      WeatherModel? weatherModelRest,
    }) => CityModel(
      name : name ?? this.name,
      lat : lat ?? this.lat,
      lon : lon ?? this.lon,
      country : country ?? this.country,
      state : state ?? this.state,
      weatherModelRest : weatherModelRest ?? this.weatherModelRest,
    );

    factory CityModel.fromJson(String str) => CityModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CityModel.fromMap(Map<String, dynamic> json) => CityModel(
        name: json['name'] ?? '',
        lat: json['lat']?.toDouble(),
        lon: json['lon']?.toDouble(),
        country: json['country'] ?? '',
        state: json['state'] ?? '',
    );

    Map<String, dynamic> toMap() => {
        'name': name,
        'lat': lat,
        'lon': lon,
        'country': country,
        'state': state,
    };
}

