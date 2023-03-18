import 'package:fibotech/core/singleton/user_preferences_singletons.dart';
import 'package:flutter/material.dart';

class GradosWidget extends StatelessWidget {
  const GradosWidget({
    super.key,
    required this.temp,
    required this.sizeFontTemp,
    required this.sizeFontGrade,
    required this.isEsp,
  });

  final int temp;
  final double sizeFontTemp;
  final double sizeFontGrade;
  final bool isEsp;

  @override
  Widget build(BuildContext context) {
    final unitsPrefs = UserPreferences.idiom;
    final size = MediaQuery.of( context ).size;
    return  Row(
      children: [
        Text(
          '$temp',
          style: TextStyle( 
            color: Colors.white,
            fontSize: sizeFontTemp,
            fontWeight: FontWeight.w500
          ),
        ),
        Column(
          children:[
            Text(
             (unitsPrefs == 'ES')?' ºC':' ºF',
              style:  TextStyle( 
                color: Colors.white,
                fontSize: sizeFontGrade,
                // fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(
              height: size.width * 0.01,
            )
          ],
        )
      ],
    );
  }
}