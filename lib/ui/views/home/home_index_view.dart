import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suyo/controllers/page_responsive_controller.dart';
import 'package:suyo/models/user_model.dart';
import 'package:suyo/services/category_service.dart';
import 'package:suyo/ui/views/home/widgets/home_bottom_appbar_widget.dart';
import 'package:suyo/ui/views/home/widgets/home_category_tile_widget.dart';
import 'package:suyo/ui/views/home/widgets/home_clippath_widget.dart';
import 'package:suyo/ui/views/home/widgets/home_drawer_widget.dart';

class HomeIndexView extends StatefulWidget {

  final UserModel user;

  HomeIndexView({this.user});

  @override
  _HomeIndexViewState createState() => _HomeIndexViewState();
}

class _HomeIndexViewState extends State<HomeIndexView> {

  @override
  Widget build(BuildContext context) {

    int _crossAxisCount = Get.find<PageResponsiveController>().crossAxisCount;

    return Scaffold(
      drawer: Drawer(
        child: HomeDrawerWidget(user: widget.user,),
        /*child: StreamProvider<User>.value(
            value: AuthService().user,
            child: HomeDrawer()
        ),*/
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: HomeBottomAppbarWidget(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //centerTitle: true,
            //pinned: true,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.clear_all),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            //title: AppBarTitle(),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            expandedHeight: 220.0,
            //floating: true,
            actions: <Widget>[
              // action button
              IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {

                  },
              ),
              // action button
            ],
            flexibleSpace: HomeClippathWidget(),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Suyo Services', style: TextStyle(color: Color(0xff19a795), fontSize: 15.0),),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color(0xffeeeeee),
                      border: Border.merge(
                        new Border(top: BorderSide(color: Colors.black26, width: 1.0)),
                        new Border(bottom: BorderSide(color: Colors.black26, width: 1.0)),
                      )
                    ),
                    child: Text('Choose a service!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.0,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          StreamBuilder(
            stream: CategoryService().categories,
            builder: (context, snapshot) => SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
              ),
              delegate: SliverChildBuilderDelegate((context, index){
                  return HomeCategoryTileWidget(category: snapshot.data[index],);
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

