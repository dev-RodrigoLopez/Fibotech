import 'package:fibotech/core/utils/utils.dart';
import 'package:flutter/material.dart';

class DailyWidget extends StatelessWidget {
  const DailyWidget({
    super.key,
    required this.urlImg,
    required this.temp,
    this.isSelected = false,
  });

  final String urlImg;
  final double temp;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      // height: size.height * 0.1,
      width: size.width * 0.15,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[700] : null,
        borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInImage(
            image: NetworkImage(
              'https://openweathermap.org/img/wn/$urlImg@2x.png',
              scale: 1
            ),
            placeholder: const AssetImage('assets/images/weather.gif'),
            width: size.height * 0.05,
            height: size.height * 0.05,
          ),
          Center(
            child: Text(
              Utils.roundOutGrades( temp ).toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.055
              ),
            ),
          )
        ],
      ),
    );
  }
}