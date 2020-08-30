import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {

  List<Map<String, dynamic>> _navs = [
    { 'title':'Login', 'icon': Icons.login_outlined, 'route':'/login' },
    { 'title':'About Us', 'icon': Icons.info_outline, 'route':'/about-us' },
    { 'title':'Help', 'icon': Icons.help_outline , 'route':'/help'},
    { 'title':'Terms & Conditions', 'icon': Icons.playlist_add_check, 'route':'/terms-conditions' },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: double.infinity,
          color: Color(0xffeeeeee),
        ),
        Expanded(
          child: ListView.builder(itemCount:_navs.length,itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(_navs[index]['icon'], color: Color(0xff19a795)),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xff19a795)),
              title: Text(_navs[index]['title'],
                  style: TextStyle(
                    color: Color(0xff19a795),
                  )
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).pushNamed(_navs[index]['route']);
              },
            );
          }),
        ),
      ],
    );
  }
}

