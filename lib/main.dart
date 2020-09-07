import 'package:flutter/material.dart';
import 'package:suyo/shared/route.dart';

void main() async {
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

