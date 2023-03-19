import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fibotech/data/model/weather_model_ob.dart';
import 'package:fibotech/data/provider/local/controllers/weather_controller.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitial());

  Future<void> saveWeatherinDB({required WeatherModelOb weatherModelOb})async{

   
    if(  isSavedInDB( weatherModelOb.city ) == 0 ){
      WeatherController().addItem(weatherModelOb);
    }

  }  

  int isSavedInDB( String city ){
    return WeatherController().existInDB(city);
  }

  Future<bool> deleteCityWeather( int idOb ) async { 
    return WeatherController().remove(idOb);
  }

}
