import 'package:fibotech/app/modules/weathers/cubit/weather_cubit.dart';
import 'package:fibotech/app/modules/weathers/widgets/empty_widget.dart';
import 'package:fibotech/app/modules/weathers/widgets/loading_weathers.dart';
import 'package:fibotech/app/modules/weathers/widgets/success_widget.dart';
import 'package:fibotech/data/enums.dart';
import 'package:fibotech/widgets/page_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeathersPage extends StatelessWidget {
  const WeathersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherCubit(),
      child: const WeathersListPage(),
    );
  }
}

class WeathersListPage extends StatefulWidget {
  const WeathersListPage({Key? key}) : super(key: key);

  @override
  State<WeathersListPage> createState() => _WeathersListPageState();
}

class _WeathersListPageState extends State<WeathersListPage> {

  @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((_) async {
      final weatherCubit = context.read<WeatherCubit>();
      await weatherCubit.getWeatherFromDB();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white10,
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          switch (state.statuPage) {
            case WeatherPageStatus.loading:
              return const LoadingWeathers();
            case WeatherPageStatus.notSuccess:
              return ErrorWidgetPage(
                reload: (){
                  final weatherCubit = context.read<WeatherCubit>();
                  weatherCubit.reload();
                },
              );
            case WeatherPageStatus.success:
              return SuccessPageWeather( lWeather: state.lWeather, );
            case WeatherPageStatus.empty:
              return const EmptyWeatherWidget();
          }
        },
      ),
    );
  }
}
