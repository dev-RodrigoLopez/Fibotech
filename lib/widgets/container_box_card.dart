import 'package:flutter/material.dart';

class ContainerBoxCard extends StatelessWidget {
  const ContainerBoxCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),    
      height: double.infinity,
      width: double.infinity,
           
      decoration: BoxDecoration(        
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).bottomAppBarColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 32,
            offset: const Offset(0, 2),
          ),
        ],
      ),      
     padding: const EdgeInsets.symmetric(horizontal:20,vertical: 20),     
     child: child,
    );
    
  }
}
