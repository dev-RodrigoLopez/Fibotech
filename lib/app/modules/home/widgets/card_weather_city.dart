import 'package:fibotech/core/singleton/user_preferences_singletons.dart';
import 'package:fibotech/core/utils/utils.dart';
import 'package:fibotech/data/model/weather_rest_model.dart';
import 'package:flutter/material.dart';

class CardWeatherCity extends StatelessWidget {
  const CardWeatherCity({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    final unitsPrefs = UserPreferences.idiom;

    final size = MediaQuery.of( context ).size;
    return Container(
      // width: size.width * 0.12,
      height: size.height * 0.14,
        decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 0 ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInImage(
              image: NetworkImage('https://openweathermap.org/img/wn/${weatherModel.current.weather[0].icon}@2x.png'),
              placeholder: const AssetImage('assets/images/weather.gif')
            ),
            // Image.asset('assets/images/clima.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      Utils.roundOutGrades( weatherModel.current.temp ).toString(),
                      style: const TextStyle( 
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Column(
                      children:[
                        Text(
                          (unitsPrefs == 'ES')?' ºC':' ºF',
                          style: const TextStyle( 
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: size.width * 0.05,
                        )
                      ],
                    )
                  ],
                ),
                 SizedBox(
                  height: size.width * 0.01,
                ),
                Row(
                  children:  [
                    const Icon( 
                      Icons.fmd_good_sharp,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      Utils.validateCityAndState(
                        city: weatherModel.current.city,
                        state: weatherModel.current.state
                      ),
                      style: const TextStyle( 
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ]
                )
              ],
            )
          ],
        ),
      )
    );
  }
}