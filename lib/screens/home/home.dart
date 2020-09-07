import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suyo/models/user.dart';
import 'package:suyo/screens/home/components/bottom_appbar.dart';
import 'package:suyo/screens/home/components/category_tiles.dart';
import 'package:suyo/screens/home/components/home_clippath.dart';
import 'package:suyo/screens/home/components/home_drawer.dart';
import 'package:suyo/services/auth.dart';
import 'package:suyo/services/category.dart';

class Home extends StatefulWidget {

  final User user;

  Home({this.user});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    if(size.width >= 1400 ) {
      setState(()=> _crossAxisCount = 6);
    }else if(size.width >= 1080 ) {
      setState(()=> _crossAxisCount = 5);
    } else if(size.width >= 900) {
      setState(()=> _crossAxisCount = 4);
    } else if(size.width >= 768) {
      setState(()=> _crossAxisCount = 3);
    } else {
      setState(()=> _crossAxisCount = 2);
    }

    return Scaffold(
      drawer: Drawer(
        child: HomeDrawer(user: widget.user,),
        /*child: StreamProvider<User>.value(
            value: AuthService().user,
            child: HomeDrawer()
        ),*/
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: BottomAppbar(),
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
            flexibleSpace: HomeClippath(),
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
                  return CategoryTiles(category: snapshot.data[index],);
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

