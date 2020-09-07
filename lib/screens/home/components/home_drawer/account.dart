import 'package:flutter/material.dart';
import 'package:suyo/models/user.dart';

class HomeDrawerAccount extends StatelessWidget {

  final User user;

  HomeDrawerAccount({this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Color(0xffeeeeee),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 70.0,
              height: 70.0,
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTrzbdOOt3LJpp5FiqZZlHatrFTN1v3zVd4HA&usqp=CAU"),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: double.infinity,
                    child: Text(user.email.split('@')[0])
                ),
                SizedBox(height: 5.0,),
                Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text('4.3', style: TextStyle(fontSize: 11.0),),
                        Icon(Icons.star, size: 11.0,),
                        Icon(Icons.star, size: 11.0,),
                        Icon(Icons.star, size: 11.0,),
                        Icon(Icons.star, size: 11.0,),
                        Icon(Icons.star_border, size: 11.0,),
                      ],
                    )
                ),
                SizedBox(height: 20.0,),
              ],
            ),
          ),
          /*Expanded(
                child: Text(user.email),
              ),*/
        ],
      ),
    );
  }
}
