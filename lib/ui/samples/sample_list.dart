import 'package:flutter/material.dart';
import 'package:suyo/models/category_model.dart';

class SampleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = CategoryModel().list();

    return ListView.builder
      (
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Container(height:100, width: 100,child: Image.asset(items[index]['image'])),
              title: Text(items[index]['title']),
              subtitle: Text(items[index]['description']),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(items[index]['color']),),
              isThreeLine: true,
            ),
          );
        }
    );
    /*return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Two-line ListTile'),
            subtitle: Text('Here is a second line'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 72.0),
            title: Text('Three-line ListTile'),
            subtitle: Text(
                'A sufficiently long subtitle warrants three lines.'
            ),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Suyo Eats')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Suyo Go')),
        ),
        Container(
          height: 50,
          color: Colors.amber[300],
          child: const Center(child: Text('Suyo Mart')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Suyo Meds')),
        ),
      ],
    );*/
  }
}
