import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suyo/controllers/category_controller.dart';
import 'package:suyo/controllers/page_responsive_controller.dart';
import 'package:suyo/models/category_model.dart';
import 'package:suyo/services/store_group_service.dart';
import 'package:suyo/ui/components/constants_ui_component.dart';
import 'package:suyo/ui/views/home/widgets/store_widgets/store_group_clippath_widget.dart';
import 'package:suyo/ui/views/home/widgets/store_widgets/store_group_popular_tile_widget.dart';
import 'package:suyo/ui/views/home/widgets/store_widgets/store_group_suggested_tile_widget.dart';

class HomeStoreGroupView extends StatefulWidget {
  @override
  _HomeStoreGroupViewState createState() => _HomeStoreGroupViewState();
}

class _HomeStoreGroupViewState extends State<HomeStoreGroupView> {
  @override
  Widget build(BuildContext context) {
    CategoryModel category = Get.find<CategoryController>().selectedCategory;

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
                icon: Icon(Icons.info_outline, color: Colors.white),
                onPressed: () {},
              ),
              // action button
            ],
            flexibleSpace: StoreGroupClippathWidget(),
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
                        SizedBox(width: 4.0,),
                        Icon(Icons.pin_drop),
                        SizedBox(width: 4.0,),
                        Text('Delivery Location', style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 32.0,),
                        Text('Bulacan, Bulacan',)
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
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'Enter an email.' : null,
                      obscureText: false,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffeeeeee),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: 'Search Food or Restaurant',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5)),
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                  Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(int.parse(category.theme)),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ),
                      child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Search',
                            style: TextStyle(color: Colors.white),
                          )))
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Suggested Restaurant'),
            ),
          ),
          StreamBuilder(
              stream: StoreGroupService(categoryId: category.categoryId).list,
              builder: (context, snapshot) {
                return SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    height: 140.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.hasData ? snapshot.data.length : 0,
                      itemBuilder: (context, index) {
                        return StoreGroupSuggestedTileWidget(
                            storeGroup: snapshot.data[index]);
                      },
                    ),
                  ),
                );
              }),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Popular Restaurant'),
            ),
          ),
          StreamBuilder(
              stream: StoreGroupService(categoryId: category.categoryId).list,
              builder: (context, snapshot) {
                return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _crossAxisCount,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return StoreGroupPopularTileWidget(
                            storeGroup: snapshot.data[index]);
                      },
                      childCount: snapshot.hasData ? snapshot.data.length : 0,
                    ));
              }),
        ],
      ),
    );
  }
}
