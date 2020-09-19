import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suyo/models/user_model.dart';
import 'package:suyo/services/user_service.dart';
import 'package:suyo/ui/views/redirect.dart';

class Checker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel authUser = Provider.of<UserModel>(context);

    if(authUser!=null) {
      return StreamProvider<UserModel>.value(
        value: UserService(uid: authUser.uid).user,
        child: Redirect(),
      );
    }

    return Redirect();
  }
}
