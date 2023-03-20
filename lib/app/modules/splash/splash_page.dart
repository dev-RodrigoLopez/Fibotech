import 'package:flutter/material.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white12,
      body: SizedBox(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * .35,
            ),
            Image.asset(
              'assets/images/icon.png',
              height: size.width * 0.3,
              width: size.width * 0.3,
            ),
            SizedBox(
              height: size.height * .1,
            ),
            SizedBox(
              // color: Colors.blue,
              width: double.infinity,
              height: size.height * .3,
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.1),
                  const Center(
                    child: Text('From',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                  const Center(
                    child: Text('R | L',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ),
                  const Center(
                    child: Text('Development, Desing and Support',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}