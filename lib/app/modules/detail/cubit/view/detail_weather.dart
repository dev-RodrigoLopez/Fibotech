import 'package:fibotech/app/modules/detail/cubit/view/widgets/card_detail_widget.dart';
import 'package:fibotech/app/modules/detail/cubit/view/widgets/daily_widget.dart';
import 'package:fibotech/app/modules/detail/cubit/view/widgets/icon_weather_widget.dart';
import 'package:fibotech/core/utils/utils.dart';
import 'package:fibotech/data/model/weather_rest_model.dart';
import 'package:flutter/material.dart';

class DetailWeather extends StatefulWidget {
  const DetailWeather({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  State<DetailWeather> createState() => _DetailWeatherState();
}

class _DetailWeatherState extends State<DetailWeather> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: size.width * 0.05,
            ),
            SizedBox(
              height: size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.12,
                    height: size.width * 0.12,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white54)),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white70,
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.12,
                    height: size.width * 0.12,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54),
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon( 
                          Icons.bookmark_border,
                          color: Colors.white70,
                        ),
                        onPressed: (){},
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.width * 0.05,
            ),
            SizedBox(
              width: size.width,
              child: Row(
                children: [
                   Text(
                    '${ widget.weatherModel.current.city}, ',
                    style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.weatherModel.current.state,
                    style: const TextStyle(color: Colors.white60, fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            IconWeatherWidget(
              icon: widget.weatherModel.current.weather[0].icon,
              temp: Utils.roundOutGrades( widget.weatherModel.current.temp ),
            ),
            CardDetailWidget( weatherModel: widget.weatherModel, ),
            SizedBox(
              height: size.width * 0.12,
            ),
            SizedBox(
              height: size.height * 0.13,
              width: size.width,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.weatherModel.daily.length,
                itemBuilder: ((context, index) {

                  return DailyWidget(
                    urlImg:  widget.weatherModel.daily[index].weather[0].icon,
                    temp:  widget.weatherModel.daily[index].temp.day * 1.0,
                    isSelected: ( index == 1 ) ? true : false,
                  );
                })
              ),
            )
          ],
        ),
      ),
    );
  }
}