import 'package:fibotech/app/modules/weathers/cubit/weather_cubit.dart';
import 'package:fibotech/app/modules/weathers/widgets/card_weathers_ob.dart';
import 'package:fibotech/core/values/const_page_names.dart';
import 'package:fibotech/data/model/weather_model_ob.dart';
import 'package:fibotech/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWeathers extends StatelessWidget {
  const LoadingWeathers({
    Key? key,
  }) : super(key: key);


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
              onPressed: () {},
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
              itemCount: 5,
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
          ),
        ],
      ),
    );
  }
}