import 'package:flutter/material.dart';

class CategoryTiles extends StatelessWidget {

  final category;

  CategoryTiles({this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/stores', arguments: category);
      },
      child: Card(
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
                    color: Color(int.parse(category.color)),
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
                          category.thumbnail,
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
                  Text(category.title, style: TextStyle(color: Color(int.parse(category.color)), fontWeight: FontWeight.bold)),
                ],
              ),
              subtitle: Text(
                category.description,
                style:  TextStyle(
                    backgroundColor: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
