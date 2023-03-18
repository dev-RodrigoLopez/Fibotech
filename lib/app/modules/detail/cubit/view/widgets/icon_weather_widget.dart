import 'package:flutter/material.dart';

class IconWeatherWidget extends StatelessWidget {
  const IconWeatherWidget({
    super.key,
    required this.icon,
    required this.temp,
  });

  final String icon;
  final int temp;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.3,
      child: Stack(
        children: [
          Positioned(
            // top: size.width * 0.05,
            left: size.width * 0.2,
            child: SizedBox(
              width: size.width * .4,
              height: size.width * .4,
              child:   FadeInImage(
                image: NetworkImage(
                  'https://openweathermap.org/img/wn/$icon@2x.png',
                  scale: 0.5
                ),
                placeholder: const AssetImage('assets/images/weather.gif'),
                width: size.height * 0.4,
                height: size.height * 0.4,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: size.width * 0.25,
            child: SizedBox(
              width: size.width * .4,
              height: size.width * .3,
              child: Center(
                child: Text(
                  '$tempº',
                  style: TextStyle( 
                    color: Colors.white,
                    fontSize: size.width * 0.2,
                    fontWeight: FontWeight.w500
                  ),
                )
              ),
            ),
          )
        ],
      ),      
    );
  }
}