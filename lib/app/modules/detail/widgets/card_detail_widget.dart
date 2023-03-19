import 'package:fibotech/app/modules/detail/widgets/item_detail_widget.dart';
import 'package:fibotech/data/model/weather_rest_model.dart';
import 'package:flutter/material.dart';

class CardDetailWidget extends StatelessWidget {
  const CardDetailWidget({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of( context ).size;
    return  Container(
      height: size.height * 0.25,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemDetailWidget(
                icon: Icons.water_drop_outlined,
                title: weatherModel.current.humidity.toString(),
                subtitle: 'Humidity',
              ),
              ItemDetailWidget(
                icon: Icons.water,
                title: weatherModel.current.windSpeed.toString(),
                subtitle: 'Wind Spend',
              ),
              ItemDetailWidget(
                icon: Icons.precision_manufacturing_sharp,
                title: weatherModel.current.pressure.toString(),
                subtitle: 'Pressure',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemDetailWidget(
                icon: Icons.remove_red_eye_outlined,
                title: weatherModel.current.visibility.toString(),
                subtitle: 'Visibility',
              ),
              ItemDetailWidget(
                icon: Icons.sunny,
                title: weatherModel.current.uvi.toString(),
                subtitle: 'UV',
              ),
              ItemDetailWidget(
                icon: Icons.air_outlined,
                title: weatherModel.current.windDeg.toString(),
                subtitle: 'Wind Deg',
              ),
            ],
          )
        ],
      ),
    );
  }
}