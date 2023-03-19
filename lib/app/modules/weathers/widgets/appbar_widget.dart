import 'package:fibotech/app/modules/home/cubit/home_cubit.dart';
import 'package:fibotech/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Column(
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
          const SearchWidget(),
      ],
    );
  }
}