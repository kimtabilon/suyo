import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        Get.to(SellerSetupStoreView(
          category: category,
          user: user,
        ));
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: ListTile(
          leading: Container(
            height: 100,
            width: 100,
            child: CachedNetworkImage(
              imageUrl: category.banner,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          title: Text(category.title),
          subtitle: Text(category.description),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Color(int.parse(category.theme)),
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
