import 'package:flutter/material.dart';
import 'package:suyo/models/store_model.dart';

class StoreSuggestedTileWidget extends StatelessWidget {

  final StoreModel store;

  StoreSuggestedTileWidget({this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: 140.0,
      height: 140.0,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 65.0,
                    color: Color(int.parse(store.theme)),
                    child: Image.network(store.logo),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 65.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(store.banner),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              height: 65.0,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(store.name, style: TextStyle(fontSize: 12)),
                  Text(store.tag, style: TextStyle(fontSize: 9),),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      Text('4.3', style: TextStyle(fontSize: 9.0, color: Colors.yellow),),
                      Icon(Icons.star, color: Colors.yellow, size: 9.0,),
                      Icon(Icons.star, color: Colors.yellow, size: 9.0,),
                      Icon(Icons.star, color: Colors.yellow, size: 9.0,),
                      Icon(Icons.star, color: Colors.yellow, size: 9.0,),
                      Icon(Icons.star_border, color: Colors.yellow, size: 9.0,),
                    ],
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
