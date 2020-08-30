import 'package:flutter/material.dart';
import 'package:suyo/screens/components/route.dart';
import 'package:suyo/screens/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suyo App',
      //home: Wrapper(),
      //home: FirstPage(),
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}