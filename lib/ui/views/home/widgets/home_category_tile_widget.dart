import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suyo/controllers/category_controller.dart';
import 'package:suyo/models/category_model.dart';
import 'package:suyo/ui/views/home/home_store_group_view.dart';

class HomeCategoryTileWidget extends StatelessWidget {
  final CategoryModel category;

  HomeCategoryTileWidget({this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.put<CategoryController>(CategoryController()).setSelectCategory(category);
        Get.to(HomeStoreGroupView());
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.all(8.0),
        //color: Colors.green,
        child: Stack(
          //mainAxisSize: MainAxisSize.min,
          children: [

            //Image.asset(services[index]['image']),
            Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 110.0,
                  width: 140.0,
                  decoration: BoxDecoration(
                    color: Color(int.parse(category.theme)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(150.0),
                    ),
                  ),
                )),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Container(
                height: 120,
                width: 120,
                child: CachedNetworkImage(
                  imageUrl: category.banner,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),

            ListTile(
              title: Row(
                children: [
                  Text(
                    'SUYO ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(category.title,
                      style: TextStyle(
                          color: Color(int.parse(category.theme)),
                          fontWeight: FontWeight.bold)),
                ],
              ),
              subtitle: Text(
                category.description,
                style: TextStyle(backgroundColor: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
