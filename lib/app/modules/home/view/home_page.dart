import 'package:fibotech/app/modules/home/cubit/home_cubit.dart';
import 'package:fibotech/app/modules/home/widgets/home_body.dart';
import 'package:fibotech/data/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final homeCubit = context.read<HomeCubit>();
      await homeCubit.getWeatherByMyLocation();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white10,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          
          switch( state.homePageStatus ){
            case HomePageStatus.pure:
            case HomePageStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case HomePageStatus.success:
              return HomeBodyWidget( 
                weatherModel: state.weatherModel!, 
                lpopular: state.lPopularLocations!,
              );
             
            case HomePageStatus.notSuccess:
              return const Center(
                child: Text('ERROR AL SUBIR'),
              );
          }
        },
      ),
    );
  }
}