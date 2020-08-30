import 'package:flutter/material.dart';

class AppBarTitle extends StatefulWidget {
  @override
  _AppBarTitleState createState() => _AppBarTitleState();
}

class _AppBarTitleState extends State<AppBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SUYO',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        Text(
          'Delivery App',
          style: TextStyle(color: Colors.black54, fontSize: 11.0),
        ),
      ],
    );
  }
}
