
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fibotech/core/singleton/user_preferences_singletons.dart';
import 'package:fibotech/core/utils/env.dart';
import 'package:fibotech/data/model/model_popular_locations.dart';
import 'package:fibotech/data/model/weather_rest_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomeRestProvider {

  Future<Either<Exception, WeatherModel>> getMyWeatherByLocation({
    required Position location,
  }) async {
    try {

      final unitsPrefs = UserPreferences.idiom;
      String units = '';
      if( unitsPrefs == 'EN' ){
        units = 'imperial';
      }else{
        units = 'metric';
      }

      //Conversion para obtener la fecha
      // final convert = DateTime.fromMillisecondsSinceEpoch(1679162400 * 1000);
      // print( convert );

      final responseData = await Dio().get<dynamic>(
        'https://api.openweathermap.org/data/3.0/onecall?lat=${location.latitude}&lon=${location.longitude}&units=$units&exclude=hourly,&appid=${EnvVariables.apiKeyWeather}',
      );

      //  final respData = json.decode( responseData.data );
      final response = WeatherModel.fromMap( responseData.data );

      List<Placemark> placemarks = await placemarkFromCoordinates(location.latitude, location.longitude);

      final place = placemarks.reversed.last.locality;
      final state = placemarks.reversed.last.administrativeArea;
      final country = placemarks.reversed.last.country;
      final postalCode = placemarks.reversed.last.postalCode;

      int postal = int.parse( postalCode ?? '0' );

      final currentCopy = response.current.copyWith(
        city: place,
        state: state,
        country:country,
        postalCode: postal,
      );

      final data = response.copyWith(
        current:currentCopy,
      );
      return Right(data);
    } catch (e) {
      log( e.toString());
      return Left(e as Exception);
    }
  }

   Future<Either<Exception, List<WeatherModel>>> getPopularWeather({
    required List<PopularModel> lPopularWeather,
  }) async {
    try {
      List<WeatherModel> lpopularWeather = [];
      final unitsPrefs = UserPreferences.idiom;
      String units = '';
      if( unitsPrefs == 'EN' ){
        units = 'imperial';
      }else{
        units = 'metric';
      }

      for( final popularWeather in lPopularWeather ){

        final responseData = await Dio().get<dynamic>(
          'https://api.openweathermap.org/data/3.0/onecall?lat=${popularWeather.lat}&lon=${popularWeather.lon}&units=$units&exclude=hourly,&appid=${EnvVariables.apiKeyWeather}',
        );
        final response = WeatherModel.fromMap( responseData.data );
        final currentCopy = response.current.copyWith(
          city: popularWeather.city,
          state: popularWeather.state,
          country:popularWeather.country,
        );
        final data = response.copyWith(
          current: currentCopy,
        );
        lpopularWeather.add(data);

      }
      return Right(lpopularWeather);
    } catch (e) {
      log( e.toString());  
      return Left(e as Exception);
    }
  }



}
