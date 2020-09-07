import 'package:flutter/material.dart';
import 'package:suyo/models/user.dart';

class SellerDashboard extends StatelessWidget {

  final User user;

  SellerDashboard({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seller Dashboard'),),
      body: Center(child: Text('Wecome to Seller Account')),
    );
  }
}
