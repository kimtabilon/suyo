import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suyo/models/user.dart';
import 'package:suyo/screens/redirect.dart';
import 'package:suyo/services/user.dart';

class Checker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);

    if(user!=null) {
      return StreamProvider<User>.value(
        value: UserService(uid: user.uid).user,
        child: Redirect(user: user,),
      );
    }

    return Redirect(user: user,);
  }
}
