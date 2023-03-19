import 'package:flutter/material.dart';


class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
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
      )
    );
  }
}