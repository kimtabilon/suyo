import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suyo/ui/components/constants_ui_component.dart';
import 'package:suyo/ui/views/authenticate/sign_in_view.dart';
import 'package:suyo/ui/views/home/home_help_view.dart';
import 'package:suyo/ui/views/home/home_index_view.dart';
import 'package:suyo/ui/views/home/widgets/home_drawer_widgets/home_drawer_nav_leading_icon_widget.dart';

class HomeDrawerDefaultNavWidget extends StatefulWidget {

  @override
  _HomeDrawerDefaultNavWidgetState createState() => _HomeDrawerDefaultNavWidgetState();
}

class _HomeDrawerDefaultNavWidgetState extends State<HomeDrawerDefaultNavWidget> {
  List<Map<String, dynamic>> _navs = [
    { 'title':'Login', 'icon': Icons.login_outlined, 'page':SignInView() },
    { 'title':'About Us', 'icon': Icons.info_outline, 'page':HomeIndexView() },
    { 'title':'Help', 'icon': Icons.help_outline , 'page':HomeHelpView()},
    { 'title':'Terms & Conditions', 'icon': Icons.playlist_add_check, 'page':HomeIndexView() },
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
            Get.to(_navs[index]['page']);
          },
        );
      }),
    );
  }
}
