import 'package:fibotech/app/modules/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFilterNotification extends StatefulWidget {
  const SearchFilterNotification({
    super.key,
  });


  @override
  State<SearchFilterNotification> createState() => _SearchFilterNotificationState();
}

class _SearchFilterNotificationState extends State<SearchFilterNotification> {

  String cityName = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 20),
      width: size.width,
      height: size.width * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: size.width * 0.6,
            child: TextField(
              onChanged: (value){
                setState(() {
                  cityName = value;
                });
              },
              style: const TextStyle(
                color: Colors.white
              ),
              decoration: const InputDecoration(
                filled: true,
                hintText: 'Search',
                hintStyle:
                    TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          const SizedBox(
            child: Text(
              '|',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white
              ),
            ),
          ),
          IconButton(
            onPressed: () async{
              final searchCubit = context.read<SearchCubit>();
              await searchCubit.searchCity( cityName );
            }, 
            icon: const Icon( 
              Icons.search ,
              color: Colors.white,
            )
          ),

        ],
      ),
    );
  }
}
