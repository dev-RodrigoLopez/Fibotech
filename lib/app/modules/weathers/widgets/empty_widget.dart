import 'package:fibotech/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class EmptyWeatherWidget extends StatelessWidget {
  const EmptyWeatherWidget({
    required this.title,
    super.key
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all( 20 ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.width * 0.09,
          ),
          Container(
            width: size.width * 0.12,
            height: size.width * 0.12,
            decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white54)),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white70,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            height: size.width * 0.05,
          ),
          const SearchWidget(),
          SizedBox(
            height: size.width * 0.6,
          ),
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.05
              ),
            )
          ),
        ],
      ),
    );
  }
}