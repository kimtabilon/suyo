import 'package:flutter/material.dart';
import 'package:suyo/models/category_model.dart';
import 'package:suyo/ui/components/arc_clipper_ui_component.dart';

class StoreClippathWidget extends StatelessWidget {

  final CategoryModel category;

  StoreClippathWidget({this.category});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ArcClipper(),
      child: Container(
        decoration: BoxDecoration(
            color: Color(int.parse(category.color))
            /*gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xff61cb86),
                  Color(0xff19a795)
                ]
            )*/
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 15.0,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('SUYO ', style: TextStyle(fontSize: 18.0),),
                Text(category.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
              ],
            ),
            SizedBox(height: 10.0,),
            Flexible(child: SizedBox(height:120.0,child: Image.asset(category.thumbnail)),),
            SizedBox(height: 50.0,),
          ],
        ),
      ),
    );
  }
}
