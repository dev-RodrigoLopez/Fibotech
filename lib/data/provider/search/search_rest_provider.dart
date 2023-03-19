import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fibotech/core/utils/env.dart';
import 'package:fibotech/data/model/city_model.dart';
import 'package:fibotech/data/provider/home/home_rest_provider.dart';
import 'package:fibotech/data/provider/weathers/weather_rest_provider.dart';
import 'package:geolocator/geolocator.dart';

class SearchRestProvider {

  Future<Either<Exception, List<CityModel>>> getLatLogByCity({
    required String city,
  }) async {
    try {

      final responseData = await Dio().get<dynamic>(
        'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=3&appid=${EnvVariables.apiKeyWeather}'
      );

      //  final respData = json.decode( responseData.data );
      List<CityModel> lCityModel = [];
      if( responseData.data != null ){
        // for( final data in responseData.data ){
          for( var index = 0; index < responseData.data.length; index++ ){
          final cityModel = CityModel.fromMap( responseData.data[index] );

          Position position = Position(
            longitude: cityModel.lon, 
            latitude: cityModel.lat, 
            timestamp: null, 
            accuracy: 0.0, 
            altitude: 0.0, 
            heading: 0.0, 
            speed: 0.0, 
            speedAccuracy: 0.0
          );

          final weatherModel = await HomeRestProvider().getMyWeatherByLocation(
            location: position
          );
          weatherModel.fold(
            (l) => null, 
            (weather){
              cityModel.weatherModelRest = weather;
            }
          );

          lCityModel.add(cityModel);
        }

      }

      return Right(lCityModel);
    } catch (e) {
      log( e.toString());
      return Left(e as Exception);
    }
  }

}