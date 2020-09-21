import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suyo/controllers/category_controller.dart';
import 'package:suyo/models/category_model.dart';
import 'package:suyo/ui/components/arc_clipper_ui_component.dart';

class StoreGroupClippathWidget extends StatelessWidget {

  CategoryModel category = Get.find<CategoryController>().selectedCategory;

  @override
  Widget build(BuildContext context) {

    return ClipPath(
      clipper: ArcClipper(),
      child: Container(
        decoration: BoxDecoration(color: Color(int.parse(category.theme))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SUYO ',
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(category.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Flexible(
              child: SizedBox(
                height: 120.0,
                child: CachedNetworkImage(
                  imageUrl: category.banner,
                  placeholder: (context, url) =>
                  const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
