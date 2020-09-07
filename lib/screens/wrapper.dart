import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suyo/models/user.dart';
import 'package:suyo/screens/checker.dart';
import 'package:suyo/services/auth.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: Checker(),
    );
  }
}

