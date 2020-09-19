import 'package:flutter/material.dart';

class HomeHelpView extends StatefulWidget {
  @override
  _HomeHelpViewState createState() => _HomeHelpViewState();
}

class _HomeHelpViewState extends State<HomeHelpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help'),),
      body: Center(child: Text('Help Page')),
    );
  }
}
