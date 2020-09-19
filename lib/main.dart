import 'package:flutter/material.dart';
import 'package:suyo/app/route.dart';
//import 'package:suyo/locator.dart';

void main() async {
  //setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suyo App',
      initialRoute: '/wrapper',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

