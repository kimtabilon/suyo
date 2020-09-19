import 'package:flutter/material.dart';
import 'package:suyo/models/category_model.dart';
import 'package:suyo/models/user_model.dart';
import 'package:suyo/services/category_service.dart';
import 'package:suyo/ui/components/constants_ui_component.dart';
import 'package:suyo/ui/components/steps_indicator_ui_component.dart';
import 'package:suyo/ui/views/seller/setup/widgets/seller_setup_category_tile_widget.dart';

class SellerSetupSelectCategoryView extends StatefulWidget {

  final UserModel user;

  SellerSetupSelectCategoryView({this.user});

  @override
  _SellerSetupSelectCategoryViewState createState() => _SellerSetupSelectCategoryViewState();
}

class _SellerSetupSelectCategoryViewState extends State<SellerSetupSelectCategoryView> {

  final categories = CategoryModel().list();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        //backgroundColor: themeColorGreen,
        centerTitle: true,
        title: Text('MERCHANT SETUP', style: appbarSmTitle,),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                themeColorLightGreen,
                themeColorGreen,
              ],
            ),
          ),
        ),

      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(child: Text('CHOOSE A CATEGORY'),),
                  ),
                  StepsIndicator(selectedStep: 0, nbSteps: 3,),
                  SizedBox(height: 15.0,),

                ],
              ),
            ),
          ),
          StreamBuilder(
              stream: CategoryService().categories,
              builder: (context, snapshot) => SliverList(
                  delegate: SliverChildBuilderDelegate((context, index){
                    return SellerSetupCategoryTileWidget(category: snapshot.data[index], user: widget.user,);
                  },
                    childCount: snapshot.hasData ? snapshot.data.length : 0,
                  )
              )
          ),
        ],
      ),
    );
  }
}
