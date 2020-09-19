import 'package:flutter/material.dart';
import 'package:suyo/models/user_model.dart';
import 'package:suyo/ui/views/home/widgets/home_drawer_widgets/home_drawer_account_default_widget.dart';
import 'package:suyo/ui/views/home/widgets/home_drawer_widgets/home_drawer_account_widget.dart';
import 'package:suyo/ui/views/home/widgets/home_drawer_widgets/home_drawer_client_nav_widget.dart';
import 'package:suyo/ui/views/home/widgets/home_drawer_widgets/home_drawer_default_nav_widget.dart';

class SellerDrawerWidget extends StatelessWidget {

  final UserModel user;

  SellerDrawerWidget({this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        (user!=null) ? HomeDrawerAccountWidget(user: user,) : HomeDrawerAccountDefaultWidget(),

        (user==null) ? HomeDrawerDefaultNavWidget() : SizedBox(height: 10.0,),

        (user!=null) ? HomeDrawerClientNavWidget(user: user,) : SizedBox(height: 10.0,)

      ],
    );
  }
}
