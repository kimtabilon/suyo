import 'package:flutter/material.dart';
import 'package:suyo/shared/constants.dart';

class NavLeadingIcon extends StatelessWidget {
  final icon;

  NavLeadingIcon({this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 17.0, color: themeColorGreen);
  }
}
