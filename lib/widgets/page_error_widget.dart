import 'package:flutter/material.dart';

class ErrorWidgetPage extends StatelessWidget {
  const ErrorWidgetPage({
    required this.reload,
    super.key
  });

  final Function reload;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon( 
            Icons.error_outline,
            color: Colors.white,
            size: size.width * 0.5,
          ),
          Text(
            'Error en la aplicacion',
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.07,
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.height * 0.1,
          ),
          InkWell(
            child: GestureDetector(
              onTap: () async{
                await reload();
                
              },
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.7 ,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: (
                    Text( 
                      'Reload' ,
                      style: TextStyle(
                        fontSize: size.width * .06,
                        color: Colors.white
                      ),
                    )
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}