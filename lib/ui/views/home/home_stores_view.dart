import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suyo/controllers/page_responsive_controller.dart';
import 'package:suyo/controllers/store_group_controller.dart';
import 'package:suyo/models/category_model.dart';
import 'package:suyo/models/store_group_model.dart';
import 'package:suyo/services/store_service.dart';
import 'package:suyo/ui/views/home/widgets/store_widgets/store_clippath_widget.dart';
import 'package:suyo/ui/views/home/widgets/store_widgets/store_popular_tile_widget.dart';
import 'package:suyo/ui/views/home/widgets/store_widgets/store_suggested_tile_widget.dart';

class HomeStoresView extends StatefulWidget {

  @override
  _HomeStoresViewState createState() => _HomeStoresViewState();
}

class _HomeStoresViewState extends State<HomeStoresView> {

  @override
  Widget build(BuildContext context) {
    StoreGroupModel storeGroup = Get.find<StoreGroupController>().selectedStoreGroup;

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
                  onPressed: () {

                  },
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {

                },
              ),
              // action button
            ],
            flexibleSpace: StoreClippathWidget(),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Suggested Restaurant'),
            ),
          ),
          StreamBuilder(
            stream: StoreService(storeGroupId: storeGroup.storeGroupId).stores,
            builder: (context, snapshot) {
              return SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 140.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.hasData ? snapshot.data.length : 0,
                    itemBuilder: (context, index) {
                      return StoreSuggestedTileWidget(storeGroup: storeGroup, store: snapshot.data[index]);
                    },
                  ),
                ),
              );
            }
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Popular Restaurant'),
            ),
          ),
          StreamBuilder(
              stream: StoreService(storeGroupId: storeGroup.storeGroupId).stores,
              builder: (context, snapshot){
                return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _crossAxisCount,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index){
                        return StorePopularTileWidget(store: snapshot.data[index]);
                      },
                      childCount: snapshot.hasData ? snapshot.data.length : 0,
                    )
                );
              }
          ),

        ],
      ),
    );
  }

}
