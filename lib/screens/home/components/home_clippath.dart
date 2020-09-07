import 'package:flutter/material.dart';
import 'package:suyo/screens/home/components/arc_clipper.dart';

class HomeClippath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ArcClipper(),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xff61cb86),
                  Color(0xff19a795)
                ]
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 5.0,),
            Text(
              'SUYO',
              style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Delivery App',
              style: TextStyle(color: Colors.black, fontSize: 11.0),
            ),
            SizedBox(height: 10.0,),
            Flexible(child: SizedBox(height:70.0,child: Image.asset('assets/app/logo-sm.png')),),
            SizedBox(height: 10.0,),
            Text(
              'WELCOME TO SUYO APP',
              style: TextStyle(color: Colors.white, fontSize: 9.0),
            ),
            SizedBox(height: 50.0,),
          ],
        ),
      ),
    );
  }
}
