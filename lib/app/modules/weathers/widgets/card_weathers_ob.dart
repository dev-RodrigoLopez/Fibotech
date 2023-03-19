import 'package:fibotech/core/singleton/user_preferences_singletons.dart';
import 'package:fibotech/core/utils/utils.dart';
import 'package:fibotech/data/model/weather_model_ob.dart';
import 'package:flutter/material.dart';

class CardOBWeather extends StatelessWidget {
  const CardOBWeather({
    super.key,
    required this.weatherModel,
  });

  final WeatherModelOb weatherModel;

  @override
  Widget build(BuildContext context) {
    final unitsPrefs = UserPreferences.idiom;

    final size = MediaQuery.of( context ).size;
    // final date = DateTime.fromMillisecondsSinceEpoch(weatherModel.fechaActualizacion * 1000);
    // final lastDate = DateFormat('yyyy-MM-dd HH:mm').format(date);
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
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/weather.gif', 
              image: 'https://openweathermap.org/img/wn/${weatherModel.weatherModelRest!.current.weather[0].icon }@2x.png', 
              fit: BoxFit.fill,
            ),
            // FadeInImage(
            //   image: NetworkImage('https://openweathermap.org/img/wn/${weatherModel.weatherModelRest!.current.weather[0].icon }@2x.png'),
            //   placeholder: const AssetImage('assets/images/weather.gif')
            // ),
            // Image.asset('assets/images/clima.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      Utils.roundOutGrades( weatherModel.weatherModelRest!.current.temp ).toString(),
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
                        city: weatherModel.city,
                        state: weatherModel.state
                      ),
                      style: TextStyle( 
                        color: Colors.white,
                        fontSize:  size.width * 0.045,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ]
                ),
                // SizedBox(
                //   height: size.width * 0.01,
                // ),
                // Text(
                //   'Ultima actualizacion: $lastDate',
                //   style: TextStyle( 
                //     color: Colors.white,
                //     fontSize: size.width * 0.027,
                //     fontWeight: FontWeight.w500
                //   ),
                // )
              ],
            )
          ],
        ),
      )
    );
  }
}