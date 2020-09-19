import 'package:flutter/material.dart';
import 'package:suyo/services/auth_service.dart';
import 'package:suyo/ui/components/constants_ui_component.dart';
import 'package:suyo/ui/views/home/widgets/home_drawer_widgets/home_drawer_nav_leading_icon_widget.dart';

class SellerNavDrawerWidget extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ListTile(
            leading: HomeDrawerNavLeadingIconWidget(icon: Icons.person,),
            trailing: navTrailingIcon,
            title: Text('Account', style: navTitleTextStyle),
            onTap: () async {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: HomeDrawerNavLeadingIconWidget(icon: Icons.store,),
            trailing: navTrailingIcon,
            title: Text('Products', style: navTitleTextStyle),
            onTap: () async {
              //Navigator.of(context).pushNamed('/sellerDashboard');
            },
          ),
          ListTile(
            leading: HomeDrawerNavLeadingIconWidget(icon: Icons.add_shopping_cart,),
            trailing: navTrailingIcon,
            title: Text('Store Config', style: navTitleTextStyle),
            onTap: () async {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: HomeDrawerNavLeadingIconWidget(icon: Icons.electric_bike,),
            trailing: navTrailingIcon,
            title: Text('Promos', style: navTitleTextStyle),
            onTap: () async {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: HomeDrawerNavLeadingIconWidget(icon: Icons.logout,),
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
