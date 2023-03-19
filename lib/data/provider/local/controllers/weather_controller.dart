
import 'package:fibotech/data/model/weather_model_ob.dart';
import 'package:fibotech/data/provider/local/controllers/dao/generic_controller.dart';
import 'package:fibotech/objectbox.g.dart';

class WeatherController extends GenericController<WeatherModelOb> {
  //get all geo locations by user

  int existInDB( String city){

    final query = getbox().query(
      WeatherModelOb_.city.equals(city)
    );

    final build = query.build();
    final result = build.find();

    return ( result.isNotEmpty ) ? result[0].id : 0;
  }

}
