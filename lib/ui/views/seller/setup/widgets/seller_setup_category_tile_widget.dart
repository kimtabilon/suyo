import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:suyo/models/category_model.dart';
import 'package:suyo/models/user_model.dart';
import 'package:suyo/ui/views/seller/setup/seller_setup_store_view.dart';

class SellerSetupCategoryTileWidget extends StatelessWidget {

  final CategoryModel category;
  final UserModel user;

  SellerSetupCategoryTileWidget({this.category, this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft,
                child: SellerSetupStoreView(category: category, user: user,),
            )
        );
        /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SetupStore(category: category, user: user,)),
        );*/
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: ListTile(
          leading: Container(height:100, width: 100,child: Image.asset(category.thumbnail)),
          title: Text(category.title),
          subtitle: Text(category.description),
          trailing: Icon(Icons.arrow_forward_ios, color: Color(int.parse(category.color)),),
          isThreeLine: true,
        ),
      ),
    );
  }
}
