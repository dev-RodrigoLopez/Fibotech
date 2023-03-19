import 'package:fibotech/app/modules/home/widgets/card_weather_city.dart';
import 'package:fibotech/app/modules/home/widgets/list_popular_locations.dart';
import 'package:fibotech/app/modules/home/widgets/menu_widget.dart';
import 'package:fibotech/app/modules/weathers/widgets/appbar_widget.dart';
import 'package:fibotech/core/values/const_page_names.dart';
import 'package:fibotech/data/model/weather_rest_model.dart';
import 'package:flutter/material.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    super.key,
    required this.weatherModel,
    required this.lpopular,
  });

  final WeatherModel weatherModel;
  final List<WeatherModel> lpopular;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const AppBarWidget(),
          SizedBox(
            height: size.width * 0.05,
          ),
          GestureDetector(
            onTap: () async{
              await Navigator.pushNamed(
                context,
                PageNames.detail,
                arguments: weatherModel
              );
              
            },
            child: CardWeatherCity( weatherModel: weatherModel )
          ),
          SizedBox(
            height: size.width * 0.05,
          ),
          ListPopularLocations(
            lPopular: lpopular,
          ),
          SizedBox(
            height: size.width * 0.1,
          ),
          const MenuWidget()
        ],
      ),
    );
  }
}