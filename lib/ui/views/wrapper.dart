import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suyo/models/user_model.dart';
import 'package:suyo/services/auth_service.dart';
import 'package:suyo/ui/views/checker.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: Checker(),
    );
  }
}

