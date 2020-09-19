import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:suyo/models/product._modeldart';
import 'package:suyo/models/user_model.dart';
import 'package:suyo/services/product_service.dart';
import 'package:suyo/ui/components/constants_ui_component.dart';
import 'package:suyo/ui/views/seller/setup/seller_setup_add_product_view.dart';
import 'package:suyo/ui/views/seller/widgets/seller_drawer_widget.dart';
import 'package:suyo/ui/views/seller/widgets/seller_product_tile_widget.dart';

class SellerDashboardView extends StatefulWidget {

  final UserModel user;

  SellerDashboardView({this.user});

  @override
  _SellerDashboardViewState createState() => _SellerDashboardViewState();
}

class _SellerDashboardViewState extends State<SellerDashboardView> {

  int page = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: themeColorGreen,
        title: Text('SUYO MERCHANT'),
        centerTitle: true,
      ),
      drawer: Drawer(child: SellerDrawerWidget(user: widget.user,),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColorGreen,
        child: const Icon(Icons.add), onPressed: () {
        Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.downToUp,
              child: SellerSetupAddProductView(user: widget.user,),
            )
        );
        },
      ),
      /*bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: themeColorGreen,
        buttonBackgroundColor: themeColorGreen,
        height: 60,
        animationDuration: Duration(
          milliseconds: 100,
        ),
        index: 2,
        animationCurve: Curves.bounceInOut,
        items: <Widget>[
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.verified_user, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
          Icon(Icons.more_horiz, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          //Handle button tap
          setState(()=>page=index);
        },
      ),*/
      body: CustomScrollView(
        slivers: <Widget>[
          StreamBuilder(
              stream: ProductService(storeId: widget.user.uid).products,
              builder: (context, snapshot){
                return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index){
                      return SellerProductTileWidget(product: snapshot.data[index],);
                    },
                      childCount: snapshot.hasData ? snapshot.data.length : 0,
                    )
                );
              }
          ),
          /*StreamBuilder(
              stream: ProductService(storeId: widget.user.uid).products,
              builder: (context, snapshot) {
                return SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    height: 140.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.hasData ? snapshot.data.length : 0,
                      itemBuilder: (context, index) {
                        return ProductTile(product: snapshot.data[index],);
                      },
                    ),
                  ),
                );
              }
          ),*/
        ],
      ),
    );
  }
}
