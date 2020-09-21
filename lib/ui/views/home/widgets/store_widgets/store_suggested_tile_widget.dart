import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suyo/controllers/store_controller.dart';
import 'package:suyo/models/store_group_model.dart';
import 'package:suyo/models/store_model.dart';
import 'package:suyo/ui/views/home/home_products_view.dart';

class StoreSuggestedTileWidget extends StatelessWidget {
  final StoreModel store;
  final StoreGroupModel storeGroup;

  StoreSuggestedTileWidget({this.store, this.storeGroup});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: 140.0,
      height: 140.0,
      child: InkWell(
        onTap: () {
          Get.put<StoreController>(StoreController()).setSelectStore(store);
          Get.to(HomeProductsView());
        },
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 65.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(store.customBanner ?? storeGroup.banner),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.all(8.0),
                  height: 65.0,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        store.name,
                        style: TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        storeGroup.tag,
                        style: TextStyle(fontSize: 9),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Text(
                            '4.3',
                            style: TextStyle(fontSize: 9.0, color: Colors.yellow),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 9.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 9.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 9.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 9.0,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                            size: 9.0,
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
