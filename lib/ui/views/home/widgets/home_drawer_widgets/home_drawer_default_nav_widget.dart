import 'package:flutter/material.dart';
import 'package:suyo/ui/components/constants_ui_component.dart';
import 'package:suyo/ui/views/home/widgets/home_drawer_widgets/home_drawer_nav_leading_icon_widget.dart';

class HomeDrawerDefaultNavWidget extends StatefulWidget {

  @override
  _HomeDrawerDefaultNavWidgetState createState() => _HomeDrawerDefaultNavWidgetState();
}

class _HomeDrawerDefaultNavWidgetState extends State<HomeDrawerDefaultNavWidget> {
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
          leading: HomeDrawerNavLeadingIconWidget(icon: _navs[index]['icon'],),
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
