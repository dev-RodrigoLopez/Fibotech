import 'package:fibotech/app/modules/home/widgets/card_weather_city.dart';
import 'package:fibotech/app/modules/search/cubit/search_cubit.dart';
import 'package:fibotech/app/modules/weathers/widgets/empty_widget.dart';
import 'package:fibotech/core/values/const_page_names.dart';
import 'package:fibotech/data/enums.dart';
import 'package:fibotech/widgets/page_error_widget.dart';
import 'package:fibotech/widgets/search_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(),
      child: const SearchPageLogic(),
    );
  }
}

class SearchPageLogic extends StatelessWidget {
  const SearchPageLogic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
       backgroundColor: Colors.white10,
       body: SingleChildScrollView(
         child: Padding(
          padding: const EdgeInsets.all( 20 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.width * 0.07,
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
              const SearchFilterNotification(),
              SizedBox(
                width: size.width,
                height: size.height * 0.75,
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    switch( state.statuPage ){
                      case SearchPageStatus.loading:
                        return  SizedBox(
                          height: size.height * 0.75,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return  Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.white12,
                                  highlightColor: Colors.white,
                                  child: Container(
                                    height: size.height * 0.14,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white12,
                                        borderRadius: BorderRadius.circular( 15 ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      case SearchPageStatus.empty:
                        return const EmptyWeatherWidget( title:  'No se encontro Ciudad',);
                      case SearchPageStatus.notSuccess:
                        return ErrorWidgetPage(
                          reload: (){},
                        );
                      case SearchPageStatus.pure:
                      case SearchPageStatus.success:
                        return ListView.builder(
                        itemCount: state.lCityModel.length,
                        itemBuilder: ((context, index) {
                          
                          return Padding(
                            padding: const EdgeInsets.symmetric( vertical: 10 ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.12 ,
                              decoration: BoxDecoration(
                                // color: Colors.black87,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: GestureDetector(
                                onTap: () async{
                                  await Navigator.pushNamed(
                                    context,
                                    PageNames.detail,
                                    arguments:  state.lCityModel[index].weatherModelRest
                                  );
                                  
                                },
                                child: CardWeatherCity( weatherModel:  state.lCityModel[index].weatherModelRest! )
                              ),
                            ),
                          );
                
                        })
                      );
                    }
                  },
                ),
              )
            ],
           ),
         ),
       ),
    );
  }
}