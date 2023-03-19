
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fibotech/core/singleton/user_preferences_singletons.dart';
import 'package:fibotech/core/utils/env.dart';
import 'package:fibotech/data/model/weather_model_ob.dart';
import 'package:fibotech/data/model/weather_rest_model.dart';

class WeatherRestProvider {

   Future<Either<Exception, List<WeatherModelOb>>> getWeatherFromOB({
    required List<WeatherModelOb> lWeatherOB,
  }) async {
    try {
      List<WeatherModelOb> lWeatherObNew = [];
      final unitsPrefs = UserPreferences.idiom;
      String units = '';
      if( unitsPrefs == 'EN' ){
        units = 'imperial';
      }else{
        units = 'metric';
      }

      for( var index = 0; index < lWeatherOB.length; index++ ){

        final responseData = await Dio().get<dynamic>(
          'https://api.openweathermap.org/data/3.0/onecall?lat=${lWeatherOB[index].latitude}&lon=${lWeatherOB[index].longitude}&units=$units&exclude=hourly,&appid=${EnvVariables.apiKeyWeather}',
        );
        final response = WeatherModel.fromMap( responseData.data );
        final currentCopy = response.current.copyWith(
          city: lWeatherOB[index].city,
          state: lWeatherOB[index].state,
          country:lWeatherOB[index].country,
        );
        final data = response.copyWith(
          current: currentCopy,
        );

        lWeatherOB[index].weatherModelRest = data;
        lWeatherObNew.add(lWeatherOB[index]);

      }
      return Right(lWeatherObNew);
    } catch (e) {
      log( e.toString());  
      return Left(e as Exception);
    }
  }



}

