import 'package:flutter/material.dart';
import 'package:suyo/models/category.dart';
import 'package:suyo/screens/home/components/popular_tile.dart';
import 'package:suyo/screens/home/components/store_clippath.dart';
import 'package:suyo/screens/home/components/suggested_tile.dart';
import 'package:suyo/services/store.dart';

class Stores extends StatefulWidget {

  final Category category;

  Stores({this.category});

  @override
  _StoresState createState() => _StoresState();
}

class _StoresState extends State<Stores> {
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
                  onPressed: () {

                  },
              ),
              // action button
            ],
            flexibleSpace: StoreClippath(category: widget.category,),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Suggested Restaurant'),
            ),
          ),
          StreamBuilder(
            stream: StoreService(catid: widget.category.catid).stores,
            builder: (context, snapshot) {
              return SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 140.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.hasData ? snapshot.data.length : 0,
                    itemBuilder: (context, index) {
                      return SuggestedTile(store: snapshot.data[index]);
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
              stream: StoreService(catid: widget.category.catid).stores,
              builder: (context, snapshot){
                return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _crossAxisCount,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index){
                        return PopularTile(store: snapshot.data[index]);
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
