import 'package:fibotech/app/modules/weathers/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of( context ).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const AppBarWidget(),
          SizedBox(
            height: size.width * 0.05,
          ),
          Shimmer.fromColors(
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
          SizedBox(
            height: size.width * 0.05,
          ),
          Shimmer.fromColors(
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
          SizedBox(
            height: size.width * 0.05,
          ),
          Shimmer.fromColors(
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
        ]
      ),
    );
  }
}