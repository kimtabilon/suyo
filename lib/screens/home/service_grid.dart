import 'package:flutter/material.dart';

class ServiceGrid extends StatefulWidget {
  @override
  _ServiceGridState createState() => _ServiceGridState();
}

class _ServiceGridState extends State<ServiceGrid> {

  //List<String> services = ['', 'SUYO GO', 'SUYO MART', 'SUYO MEDS','SUYO EATS', 'SUYO GO', 'SUYO MART', 'SUYO MEDS'];
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
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      //crossAxisSpacing: 10.0,
      //childAspectRatio: 4.8,
      //scrollDirection: Axis.horizontal,
      // Generate 100 widgets that display their index in the List.

      children: List.generate(services.length, (index) {
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
                    Text('SUYO '),
                    Text(services[index]['title'], style: TextStyle(color: Color(services[index]['color']))),
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
      }),
    );
  }
}
