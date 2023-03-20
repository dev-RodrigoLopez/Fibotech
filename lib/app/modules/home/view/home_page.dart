import 'package:fibotech/app/modules/home/cubit/home_cubit.dart';
import 'package:fibotech/app/modules/home/widgets/home_body.dart';
import 'package:fibotech/app/modules/home/widgets/home_loading_widget.dart';
import 'package:fibotech/data/enums.dart';
import 'package:fibotech/widgets/page_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomePageLogic(),
    );
  }
}

class HomePageLogic extends StatefulWidget {
  const HomePageLogic({Key? key}) : super(key: key);

  @override
  State<HomePageLogic> createState() => _HomePageLogicState();
}


class _HomePageLogicState extends State<HomePageLogic> {

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
              return const HomeLoadingWidget();
            case HomePageStatus.success:
              return HomeBodyWidget( 
                weatherModel: state.weatherModel!, 
                lpopular: state.lPopularLocations!,
              );
             
            case HomePageStatus.notSuccess:
            return ErrorWidgetPage(
              reload: () {
                final homeCubit = context.read<HomeCubit>();
                homeCubit.reload();
              },
            );
          }
        },
      ),
    );
  }
}
