import 'package:flutter/material.dart';
import 'package:suyo/ui/components/constants_ui_component.dart';

class HomeDrawerNavLeadingIconWidget extends StatelessWidget {
  final icon;

  HomeDrawerNavLeadingIconWidget({this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 17.0, color: themeColorGreen);
  }
}
