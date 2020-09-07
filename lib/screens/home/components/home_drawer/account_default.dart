import 'package:flutter/material.dart';

class HomeDrawerAccountDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Color(0xffeeeeee),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 20.0,),
          Container(height: 100.0, child: Image.asset('assets/app/logo-sm.png')),
          SizedBox(height: 10.0,),
          Text('WELCOME TO SUYO APP'),
          SizedBox(height: 20.0,),
        ],
      ),
    );
  }
}
