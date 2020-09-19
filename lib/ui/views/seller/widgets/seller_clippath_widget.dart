import 'package:flutter/material.dart';
import 'package:suyo/ui/components/arc_clipper_ui_component.dart';

class SellerClippath extends StatelessWidget {
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
              'SUYO MERCHANT',
              style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0,),
            Flexible(child: SizedBox(height:70.0,child: Image.asset('assets/app/logo-sm.png')),),
            SizedBox(height: 50.0,),
          ],
        ),
      ),
    );
  }
}
