import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suyo/controllers/store_group_controller.dart';
import 'package:suyo/models/product_model.dart';
import 'package:suyo/models/store_group_model.dart';
import 'package:suyo/models/store_model.dart';
import 'package:suyo/ui/views/home/home_stores_view.dart';

class ProductMenuTileWidget extends StatelessWidget {

  final ProductModel product;

  ProductMenuTileWidget({this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.zero,
        child: InkWell(
          onTap: () {
            //Get.put<StoreGroupController>(StoreGroupController()).setSelectStoreGroup(storeGroup);
            //Get.to(HomeStoresView());
          },
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: product.banner,
                          imageBuilder: (context, imageProvider) => Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name, style: TextStyle(fontSize: 16)),
                          Text(product.description, style: TextStyle(fontSize: 12),),
                          SizedBox(height: 5.0,),
                          Row(
                            children: [
                              Text('4.3', style: TextStyle(fontSize: 12.0, color: Colors.yellow),),
                              Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                              Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                              Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                              Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                              Icon(Icons.star_border, color: Colors.yellow, size: 12.0,),
                            ],
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
