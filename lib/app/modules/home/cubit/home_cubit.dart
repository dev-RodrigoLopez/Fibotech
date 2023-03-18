import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fibotech/core/singleton/user_preferences_singletons.dart';
import 'package:fibotech/data/enums.dart';
import 'package:fibotech/data/model/model_popular_locations.dart';
import 'package:fibotech/data/model/weather_rest_model.dart';
import 'package:fibotech/data/provider/home/home_rest_provider.dart';
import 'package:geolocator/geolocator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit( ) : super(const HomeState());

  Future<void> getWeatherByMyLocation() async{
    final location = await Geolocator.getCurrentPosition();

    final responsePersonal = await HomeRestProvider().getMyWeatherByLocation(
      location: location
    );
    await responsePersonal.fold(
      (error){
        emit(
          state.copyWith(
            homePageStatus: HomePageStatus.notSuccess,
          ),
        );
      }, 
      (weather) async {
        dynamic getPopular = await getPopularLocationsWeather();

        if( getPopular != 0 ){
          emit(
            state.copyWith(
              weatherModel: weather,
              lPopularLocations: getPopular,
              homePageStatus: HomePageStatus.success,
            ),
          );
        } else { 
          emit(
            state.copyWith(
              homePageStatus: HomePageStatus.notSuccess,
            ),
          );
        }

      }
    );
  }

  Future<dynamic> getPopularLocationsWeather() async {

    dynamic response = 0;

    final List<PopularModel> lPopular = [
      PopularModel(
        lat: 40.6961325, 
        lon: -74.5402235, 
        city: 'New York', 
        state: 'EE.UU', 
        country: 'EE.UU',
      ),
      PopularModel(
        lat: 25.6485276, 
        lon: -100.58332, 
        city: 'Monterrey', 
        state: 'Nuevo Leon', 
        country: 'Mexico'
      ),
      PopularModel(
        lat: 19.390519, 
        lon: 99.4238401, 
        city: 'CD. Mexico', 
        state: 'Mexico', 
        country: 'Mexico'
      ),
      PopularModel(
        lat: 21.1212853, 
        lon: 86.9893277, 
        city: 'Cancun', 
        state: 'Quintana Roo', 
        country: 'Mexico'
      ),
    ];

    final responsePersonal = await HomeRestProvider().getPopularWeather(
      lPopularWeather: lPopular
    );
    responsePersonal.fold(
      (error){
        response = 0;
      }, 
      (lweather) async {
        response = lweather;
      }
    );
    return response;
  }

  Future<void> changeLanguage() async{

    final idiom = UserPreferences.idiom;
    if( idiom == 'ES' ){
      UserPreferences.idiom = 'EN';
    } else{
      UserPreferences.idiom = 'ES';
    }
    emit(
      state.copyWith(
        homePageStatus: HomePageStatus.loading,
      ),
    );
    await getWeatherByMyLocation();


  }

}
