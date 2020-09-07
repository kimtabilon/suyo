import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suyo/models/user.dart';
import 'package:suyo/screens/home/home.dart';
import 'package:suyo/screens/seller/dashboard.dart';

class Redirect extends StatelessWidget {

  final User user;

  Redirect({this.user});

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);

    if(user != null) {
      switch(user.role) {
        case 'seller':
          return SellerDashboard(user: user,);
        default:
          return Home(user: user,);
      }
      print(user.role);
    }

    return Home(user: user,);
  }
}
