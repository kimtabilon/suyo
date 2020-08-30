import 'package:flutter/material.dart';
import 'package:suyo/screens/components/appbar/app_bar_title.dart';
import 'package:suyo/screens/components/clipper/home_arc_clip.dart';
import 'package:suyo/screens/components/drawer/drawer.dart';
import 'package:suyo/screens/home/service_grid.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Map<String, dynamic>> services = [
    {
      'title':'EATS',
      'description':'Satisfy your cravings. Find the food you love with SuyoEats.',
      'image':'assets/services/suyo-eats.png',
      'color':0xffffcc3a
    },
    {
      'title':'GO',
      'description':'Save time and energy. Shop your grocery needs and have it delivered at your doorsteps with SuyoMart',
      'image':'assets/services/suyo-go.png',
      'color':0xff32a5ee
    },
    {
      'title':'MART',
      'description':'Experience care right at your fingertips. Satisfy your medical needs with SuyoMeds',
      'image':'assets/services/suyo-mart.png',
      'color':0xff85d86d
    },
    {
      'title':'MEDS',
      'description':'Satisfy your cravings. Find the food you love with Suyo Eats.',
      'image':'assets/services/suyo-meds.png',
      'color':0xffff7140
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: DrawerComponent(),
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
            expandedHeight: 200.0,
            floating: true,
            actions: <Widget>[
              // action button
              IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.white)
              ),
              // action button
            ],
            flexibleSpace: ClipPath(

              clipper: ArcClipper(),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color(0xff61cb86),
                          Color(0xff19a795)
                        ]
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 10.0,),
                    Text(
                      'SUYO',
                      style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Delivery App',
                      style: TextStyle(color: Colors.black, fontSize: 11.0),
                    ),
                    SizedBox(height: 10.0,),
                    Flexible(child: SizedBox(height:70.0,child: Image.asset('assets/app/logo-sm.png')),),
                    SizedBox(height: 10.0,),
                    Text(
                      'WELCOME TO SUYO APP',
                      style: TextStyle(color: Colors.white, fontSize: 9.0),
                    ),
                    SizedBox(height: 10.0,),
                  ],
                ),
              ),
            ),
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
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ) ,

            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {

              return Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: EdgeInsets.all(8.0),
                //color: Colors.green,
                child: Stack(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    //Image.asset(services[index]['image']),
                    Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          height: 110.0,
                          width: 140.0,
                          decoration: BoxDecoration(
                            color: Color(services[index]['color']),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(150.0),
                            ),
                          ),
                        )
                    ),
                    Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          height: 120.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: new AssetImage(
                                  services[index]['image'],
                                ),
                                //fit: BoxFit.cover,
                                fit: BoxFit.fill,
                              )
                          ),
                        )
                    ),

                    ListTile(
                      title: Row(
                        children: [
                          Text('SUYO ', style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(services[index]['title'], style: TextStyle(color: Color(services[index]['color']), fontWeight: FontWeight.bold)),
                        ],
                      ),
                      subtitle: Text(
                        services[index]['description'],
                        style:  TextStyle(
                            backgroundColor: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },childCount: services.length
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color(0xff61cb86),
                            Color(0xff19a795)
                          ]
                      )
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Suyo Eats',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.0
                          ),
                        ),
                        Text('Lechon',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.0
                          ),
                        ),
                        Text('P149.00',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.0
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

