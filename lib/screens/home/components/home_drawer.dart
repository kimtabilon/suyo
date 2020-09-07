import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suyo/models/user.dart';
import 'package:suyo/screens/home/components/home_drawer/account.dart';
import 'package:suyo/screens/home/components/home_drawer/account_default.dart';
import 'package:suyo/screens/home/components/home_drawer/client_nav.dart';
import 'package:suyo/screens/home/components/home_drawer/default_nav.dart';

class HomeDrawer extends StatelessWidget {

  final User user;

  HomeDrawer({this.user});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        (user!=null) ? HomeDrawerAccount(user: user,) : HomeDrawerAccountDefault(),

        (user==null) ? DefaultNav() : SizedBox(height: 10.0,),

        (user!=null) ? ClientNav() : SizedBox(height: 10.0,)

      ],
    );
  }
}
