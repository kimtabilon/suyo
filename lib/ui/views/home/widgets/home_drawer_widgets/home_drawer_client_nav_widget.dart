import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suyo/models/user_model.dart';
import 'package:suyo/services/auth_service.dart';
import 'package:suyo/ui/components/constants_ui_component.dart';
import 'package:suyo/ui/views/home/widgets/home_drawer_widgets/home_drawer_nav_leading_icon_widget.dart';
import 'package:suyo/ui/views/seller/setup/seller_setup_select_category_view.dart';

class HomeDrawerClientNavWidget extends StatelessWidget {

  final UserModel user;

  HomeDrawerClientNavWidget({this.user});

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
              Get.back();
            },
          ),
          ListTile(
            leading: HomeDrawerNavLeadingIconWidget(icon: Icons.store,),
            trailing: navTrailingIcon,
            title: Text('Become a Seller', style: navTitleTextStyle),
            onTap: () async {
              Get.to(SellerSetupSelectCategoryView(user: user,));
              //Navigator.of(context).pushNamed('/sellerSetup', arguments: user);
            },
          ),
          ListTile(
            leading: HomeDrawerNavLeadingIconWidget(icon: Icons.add_shopping_cart,),
            trailing: navTrailingIcon,
            title: Text('Become a Shopper', style: navTitleTextStyle),
            onTap: () async {
              Get.back();
            },
          ),
          ListTile(
            leading: HomeDrawerNavLeadingIconWidget(icon: Icons.electric_bike,),
            trailing: navTrailingIcon,
            title: Text('Become a Rider', style: navTitleTextStyle),
            onTap: () async {
              Get.back();
            },
          ),
          ListTile(
            leading: HomeDrawerNavLeadingIconWidget(icon: Icons.logout,),
            trailing: navTrailingIcon,
            title: Text('Logout', style: navTitleTextStyle),
            onTap: () async {
              await _auth.signOut();
              Get.back();
            },
          ),


        ],
      ),
    );
  }
}
