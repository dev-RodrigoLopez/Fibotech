import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fibotech/data/enums.dart';
import 'package:fibotech/data/model/weather_model_ob.dart';
import 'package:fibotech/data/provider/local/controllers/weather_controller.dart';
import 'package:fibotech/data/provider/weathers/weather_rest_provider.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(const WeatherState());

  Future<void> reload() async{
    emit(
      state.copyWith(
        statuPage: WeatherPageStatus.loading,
      ),
    );
    await getWeatherFromDB();
  }

  Future<void> getWeatherFromDB() async{

    final lweather = WeatherController().getAll();
    if( lweather.isEmpty ){
      emit(
        state.copyWith(
          statuPage: WeatherPageStatus.empty,
        ),
      );
      return;
    }

    final responseWeatherDB = await WeatherRestProvider().getWeatherFromOB(
      lWeatherOB: lweather
    );
    responseWeatherDB.fold(
      (error){
        emit(
          state.copyWith(
            statuPage: WeatherPageStatus.notSuccess,
          ),
        );
        return;
      }, 
      (lweather) async {
        emit(
          state.copyWith(
            lWeather: lweather,
            statuPage: WeatherPageStatus.success,
          ),
        );
        return;
      }
    );
  }

  Future<bool> deleteCityWeather( int idOb ) async { 
    return WeatherController().remove(idOb);
  }

}
