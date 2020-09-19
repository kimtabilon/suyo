import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suyo/models/user_model.dart';
import 'package:suyo/ui/views/home/home_index_view.dart';
import 'package:suyo/ui/views/seller/seller_dashboard_view.dart';

class Redirect extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);

    if(user != null) {
      switch(user.role) {
        case 'seller':
          return SellerDashboardView(user: user,);
        default:
          return HomeIndexView(user: user,);
      }
    }

    return HomeIndexView(user: user,);
  }
}
