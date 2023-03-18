import 'package:flutter/material.dart';


class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.height * .06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white10
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: (){},
            icon: const Icon( 
              Icons.location_city,
              color: Colors.white, 
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon( 
              Icons.home ,
              color: Colors.white, 
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon( 
              Icons.settings ,
              color: Colors.white, 
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon( 
              Icons.menu ,
              color: Colors.white, 
            ),
          ),
        ]
      ),
    );
  }
}