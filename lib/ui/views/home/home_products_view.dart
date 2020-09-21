import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suyo/controllers/category_controller.dart';
import 'package:suyo/controllers/page_responsive_controller.dart';
import 'package:suyo/controllers/store_controller.dart';
import 'package:suyo/controllers/store_group_controller.dart';
import 'package:suyo/models/category_model.dart';
import 'package:suyo/models/store_group_model.dart';
import 'package:suyo/models/store_model.dart';
import 'package:suyo/services/product_service.dart';
import 'package:suyo/services/store_service.dart';
import 'package:suyo/ui/views/home/widgets/store_widgets/product_menu_tile_widget.dart';
import 'package:suyo/ui/views/home/widgets/store_widgets/product_suggested_tile_widget.dart';
import 'package:suyo/ui/views/home/widgets/store_widgets/store_clippath_widget.dart';
import 'package:suyo/ui/views/home/widgets/store_widgets/store_popular_tile_widget.dart';
import 'package:suyo/ui/views/home/widgets/store_widgets/store_suggested_tile_widget.dart';

class HomeProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoryModel category =
        Get.find<CategoryController>().selectedCategory;
    StoreGroupModel storeGroup =
        Get.find<StoreGroupController>().selectedStoreGroup;
    StoreModel store =
        Get.find<StoreController>().selectedStore;

    int _crossAxisCount = Get.find<PageResponsiveController>().crossAxisCount;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            expandedHeight: 220.0,
            actions: <Widget>[
              // action button
              IconButton(
                icon: Icon(Icons.favorite, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
              // action button
            ],
            flexibleSpace: StoreClippathWidget(),
          ),
          SliverToBoxAdapter(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(store.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                        Icon(Icons.info_outline)
                      ],
                    ),
                    Row(
                      children: [
                        Text(store.description,)
                      ],
                    ),
                    Row(
                      children: [
                        Text('4.3', style: TextStyle(fontSize: 12.0, color: Colors.yellow),),
                        Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                        Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                        Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                        Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                        Icon(Icons.star_border, color: Colors.yellow, size: 12.0,),
                        SizedBox(width: 10,),
                        Icon(Icons.timelapse),
                        SizedBox(width: 5,),
                        Text('25 mins - 1.9 km', style: TextStyle(fontSize: 12.0,),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Suggested'),
            ),
          ),
          StreamBuilder(
              stream:
                  ProductService(storeId: store.storeId).products,
              builder: (context, snapshot) {
                return SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    height: 140.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.hasData ? snapshot.data.length : 0,
                      itemBuilder: (context, index) {
                        return ProductSuggestedTileWidget(product: snapshot.data[index]);
                      },
                    ),
                  ),
                );
              }),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('MENU'),
            ),
          ),
          StreamBuilder(
              stream:
              ProductService(storeId: store.storeId).products,
              builder: (context, snapshot) {
                return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _crossAxisCount,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ProductMenuTileWidget(product: snapshot.data[index]);
                      },
                      childCount: snapshot.hasData ? snapshot.data.length : 0,
                    ));
              }),
        ],
      ),
    );
  }
}
