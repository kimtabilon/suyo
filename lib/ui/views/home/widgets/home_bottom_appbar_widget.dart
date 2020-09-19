import 'package:flutter/material.dart';
import 'package:suyo/ui/components/constants_ui_component.dart';

class HomeBottomAppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      decoration: boxDecorationLinear.copyWith(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('SUYO EATS', style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),),
                Text('003476624', style: TextStyle(color: Colors.white, fontSize: 12.0,)),
                Text('10/23/2020',style: TextStyle(color: Colors.white, fontSize: 12.0,)),
              ]
          ),
          Column(children: [
            Text('Lechon',style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold)),
            Text('Bulacan',style: TextStyle(color: Colors.white, fontSize: 12.0,)),
          ]),
          Text('P149.00', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
