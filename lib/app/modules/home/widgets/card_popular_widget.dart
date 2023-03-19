import 'package:fibotech/core/utils/utils.dart';
import 'package:fibotech/data/model/weather_rest_model.dart';
import 'package:fibotech/widgets/grados_widget.dart';
import 'package:flutter/material.dart';

class CardPopularWidget extends StatelessWidget {
  const CardPopularWidget({
    required this.weatherModel,
    super.key
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of( context ).size;
    return Container(
      height: size.height * 0.15,
      // width: size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white12,
      ),
      child: Padding(
        padding:  EdgeInsets.all(size.width * 0.030,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children:  [
                    GradosWidget(
                      temp: Utils.roundOutGrades( weatherModel.current.temp * 1.0 ),
                      sizeFontTemp: 18,
                      sizeFontGrade: 13,
                      isEsp: true,
                    ),
                    SizedBox(
                      width: size.width * 0.030,
                    ),
                    SizedBox(
                      width: size.width * 0.18,
                      child: Text(
                        weatherModel.current.weather[0].description,
                        style: TextStyle( 
                          color: Colors.white60,
                          fontSize: ( weatherModel.current.weather[0].description.length > 10 ) ? size.width * 0.035 : size.width * 0.04,
                          // fontSize: 10,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.width * 0.030,
                ),
                Text(
                  Utils.validateCityAndStateCardPopular(
                    city: weatherModel.current.city,
                    state: weatherModel.current.state
                  ),
                  style: TextStyle( 
                    color: Colors.white,
                    fontSize:  size.width * 0.036,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/weather.gif', 
              image:  'https://openweathermap.org/img/wn/${weatherModel.current.weather[0].icon}@2x.png' ,
              width: size.height * 0.10,
              height: size.height * 0.10, 
              fit: BoxFit.fill,
            ),
            // FadeInImage(
            //   image: NetworkImage('https://openweathermap.org/img/wn/${weatherModel.current.weather[0].icon}@2x.png'),
            //   placeholder: const AssetImage('assets/images/weather.gif'),
            //   width: size.height * 0.10,
            //   height: size.height * 0.10,
            // ),
          ],
        ),
      ),
    );
  }
}