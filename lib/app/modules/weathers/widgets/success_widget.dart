import 'package:fibotech/app/modules/weathers/cubit/weather_cubit.dart';
import 'package:fibotech/app/modules/weathers/widgets/card_weathers_ob.dart';
import 'package:fibotech/core/values/const_page_names.dart';
import 'package:fibotech/data/model/weather_model_ob.dart';
import 'package:fibotech/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessPageWeather extends StatelessWidget {
  const SuccessPageWeather({
    Key? key,
    required this.lWeather,
  }) : super(key: key);

  final List<WeatherModelOb> lWeather;

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
            height: size.height * 0.75,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: lWeather.length,
              itemBuilder: (context, index) {
                final item = lWeather[index].id.toString();
                return Dismissible(
                  key:  Key(item),
                  background: Container( color: Colors.red ),
                  onDismissed: (direction) async {
                    final weatherCubit = context.read<WeatherCubit>();
                    await weatherCubit.deleteCityWeather( lWeather[index].id );
                    // Scaffold.of(context). showSnackBar(SnackBar(content: Text('${state.lWeather[index].city} dismissed')));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric( vertical: 5 ),
                    child: GestureDetector(
                      child: CardOBWeather( weatherModel: lWeather[index], ),
                      onTap: () async{
                        await Navigator.pushNamed(
                          context,
                          PageNames.detail,
                          arguments: lWeather[index].weatherModelRest
                        );
                     }
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}