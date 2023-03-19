import 'package:flutter/material.dart';

class ItemDetailWidget extends StatelessWidget {
  const ItemDetailWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of( context ).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon( 
          icon,
          size: size.width * 0.07,
          color: Colors.white70,
        ),
        SizedBox(
          height: size.width * .01,
        ),
        Text(
          subtitle,
          style: TextStyle( 
            color: Colors.white70,
            fontSize:  size.width * 0.037,
          ),
        ),
        SizedBox(
          height: size.width * .01,
        ),
        Text(
          title,
          style: TextStyle( 
            color: Colors.white70,
            fontSize:  size.width * 0.034,
          ),
        )
      ],
    );
  }
}