import 'package:flutter/material.dart';
import 'package:suyo/screens/home/components/home_drawer/nav_leading_icon.dart';
import 'package:suyo/shared/constants.dart';

class DefaultNav extends StatefulWidget {

  @override
  _DefaultNavState createState() => _DefaultNavState();
}

class _DefaultNavState extends State<DefaultNav> {
  List<Map<String, dynamic>> _navs = [
    { 'title':'Login', 'icon': Icons.login_outlined, 'route':'/login' },
    { 'title':'About Us', 'icon': Icons.info_outline, 'route':'/login' },
    { 'title':'Help', 'icon': Icons.help_outline , 'route':'/help'},
    { 'title':'Terms & Conditions', 'icon': Icons.playlist_add_check, 'route':'/login' },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemCount:_navs.length,itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: NavLeadingIcon(icon: _navs[index]['icon'],),
          trailing: navTrailingIcon,
          title: Text(_navs[index]['title'], style: navTitleTextStyle),
          onTap: () {
            Navigator.of(context).pushNamed(_navs[index]['route']);
          },
        );
      }),
    );
  }
}
