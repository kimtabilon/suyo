import 'package:flutter/material.dart';
import 'package:suyo/screens/authenticate/sign_in.dart';
import 'package:suyo/screens/home/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title:Text('Error')),
        body: Center(
          child: Text('Error'),
        )
      );
    });
  }
}