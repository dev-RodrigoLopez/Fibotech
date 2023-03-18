import 'package:fibotech/app/modules/detail/cubit/view/detail_weather.dart';
import 'package:fibotech/app/modules/home/widgets/card_popular_widget.dart';
import 'package:fibotech/core/values/const_page_names.dart';
import 'package:fibotech/data/model/weather_rest_model.dart';
import 'package:flutter/material.dart';

class ListPopularLocations extends StatelessWidget {
  const ListPopularLocations({
    super.key,
    required this.lPopular,
  });

  final List<WeatherModel> lPopular;

  @override
  Widget build(BuildContext context) {

    // final lpopular = context.read<HomeCubit>().state.lPopularLocations;
    final size = MediaQuery.of( context ).size;

    return Column(
      children: [
        SizedBox(
          width: size.width,
          child: const Text( 
            'Popular Locations',
            style: TextStyle( 
              color: Colors.white70,
              fontSize: 15,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        SizedBox(
          height: size.width * 0.05,
        ),
        SizedBox(
          height: size.height * 0.315,
          width: size.width,
          // color: Colors.red,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                // height: size.height * 0.15,
                width: size.width * 0.65,
                // color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: CardPopularWidget( weatherModel: lPopular[0], ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          PageNames.detail,
                          arguments: lPopular[0], 
                        );
                      },
                    ),
                    GestureDetector(
                      child: CardPopularWidget( weatherModel: lPopular[1], ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          PageNames.detail,
                          arguments: lPopular[1], 
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              SizedBox(
                // height: size.height * 0.15,
                width: size.width * 0.6,
                // color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: CardPopularWidget( weatherModel: lPopular[2], ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          PageNames.detail,
                          arguments: lPopular[2], 
                        );
                      },
                    ),
                    GestureDetector(
                      child: CardPopularWidget( weatherModel: lPopular[3], ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          PageNames.detail,
                          arguments: lPopular[3], 
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}