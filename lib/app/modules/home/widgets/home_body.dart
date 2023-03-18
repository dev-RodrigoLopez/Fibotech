import 'package:fibotech/app/modules/home/cubit/home_cubit.dart';
import 'package:fibotech/app/modules/home/widgets/card_weather_city.dart';
import 'package:fibotech/app/modules/home/widgets/list_popular_locations.dart';
import 'package:fibotech/app/modules/home/widgets/menu_widget.dart';
import 'package:fibotech/core/values/const_page_names.dart';
import 'package:fibotech/data/model/weather_rest_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    super.key,
    required this.weatherModel,
    required this.lpopular,
  });

  final WeatherModel weatherModel;
  final List<WeatherModel> lpopular;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
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
                  child: const Center(
                    child: Icon(
                      Icons.menu,
                      color: Colors.white70,
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.12,
                  height: size.width * 0.12,
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.white54),
                  ),
                  child: IconButton(
                    onPressed: ()async{
                      final homeCubit = context.read<HomeCubit>();
                      await homeCubit.changeLanguage();
                    },
                    icon: const Icon( 
                      Icons.language ,
                      color: Colors.white70,
                    )
                  ),
                  // child: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.asset('assets/images/fibotech.png')),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.width * 0.07,
          ),
          SizedBox(
            width: size.width,
            child: const Text(
              'Hi Fibotech!',
              style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: size.width * 0.05,
          ),
          Container(
              width: size.width,
              height: size.width * 0.12,
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.white30)),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Search City',
                    style: TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ],
              )),
          SizedBox(
            height: size.width * 0.05,
          ),
          GestureDetector(
            onTap: () async{
              await Navigator.pushNamed(
                context,
                PageNames.detail,
                arguments: weatherModel
              );
              
            },
            child: CardWeatherCity( weatherModel: weatherModel )
          ),
          SizedBox(
            height: size.width * 0.05,
          ),
          ListPopularLocations(
            lPopular: lpopular,
          ),
          SizedBox(
            height: size.width * 0.1,
          ),
          const MenuWidget()
        ],
      ),
    );
  }
}