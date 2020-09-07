import 'package:flutter/material.dart';
import 'package:suyo/screens/home/components/home_drawer/nav_leading_icon.dart';
import 'package:suyo/services/auth.dart';
import 'package:suyo/shared/constants.dart';

class ClientNav extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Column(
        children: [
          ListTile(
            leading: NavLeadingIcon(icon: Icons.person,),
            trailing: navTrailingIcon,
            title: Text('Account', style: navTitleTextStyle),
            onTap: () async {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: NavLeadingIcon(icon: Icons.store,),
            trailing: navTrailingIcon,
            title: Text('Become a Seller', style: navTitleTextStyle),
            onTap: () async {
              Navigator.of(context).pushNamed('/sellerDashboard');
            },
          ),
          ListTile(
            leading: NavLeadingIcon(icon: Icons.add_shopping_cart,),
            trailing: navTrailingIcon,
            title: Text('Become a Shopper', style: navTitleTextStyle),
            onTap: () async {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: NavLeadingIcon(icon: Icons.electric_bike,),
            trailing: navTrailingIcon,
            title: Text('Become a Rider', style: navTitleTextStyle),
            onTap: () async {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: NavLeadingIcon(icon: Icons.logout,),
            trailing: navTrailingIcon,
            title: Text('Logout', style: navTitleTextStyle),
            onTap: () async {
              await _auth.signOut();
              Navigator.pop(context);
            },
          ),


        ],
      ),
    );
  }
}
