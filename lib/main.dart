import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suyo/ui/views/wrapper.dart';

void main() async {
  //setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suyo App',
      home: Wrapper()
    );
  }
}

