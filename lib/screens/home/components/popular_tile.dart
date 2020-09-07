import 'package:flutter/material.dart';
import 'package:suyo/models/store.dart';

class PopularTile extends StatelessWidget {

  final Store store;

  PopularTile({this.store});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.zero,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Color(int.parse(store.theme)),
                        child: Image.network(store.logo),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        //height: 130.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(store.thumbnail),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(store.name, style: TextStyle(fontSize: 16)),
                        Text(store.tag, style: TextStyle(fontSize: 12),),
                        SizedBox(height: 5.0,),
                        Row(
                          children: [
                            Text('4.3', style: TextStyle(fontSize: 12.0, color: Colors.yellow),),
                            Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                            Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                            Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                            Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                            Icon(Icons.star_border, color: Colors.yellow, size: 12.0,),
                          ],
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
