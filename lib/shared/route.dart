import 'package:flutter/material.dart';
import 'package:suyo/models/category.dart';
import 'package:suyo/screens/authenticate/sign_in.dart';
import 'package:suyo/screens/home/help.dart';
import 'package:suyo/screens/home/home.dart';
import 'package:suyo/screens/home/stores.dart';
import 'package:suyo/screens/seller/dashboard.dart';
import 'package:suyo/screens/wrapper.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/wrapper':
        return MaterialPageRoute(builder: (_) => Wrapper());
      case '/login':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/stores':
        final Category category = settings.arguments;
        return MaterialPageRoute(builder: (_) => Stores(category: category));

      case '/sellerDashboard':
        return MaterialPageRoute(builder: (_) => SellerDashboard());

      case '/help':
        return MaterialPageRoute(builder: (_) => Help());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title:Text('Access Denied')),
        body: Center(
          child: Text('Something went wrong.'),
        )
      );
    });
  }
}