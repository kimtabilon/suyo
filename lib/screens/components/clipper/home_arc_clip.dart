import 'package:flutter/material.dart';

class HomeArcClip extends StatefulWidget {
  @override
  _HomeArcClipState createState() => _HomeArcClipState();
}

class _HomeArcClipState extends State<HomeArcClip> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ArcClipper(),
      child: Container(
        padding: EdgeInsets.only(top: 20.0),
        width: double.infinity,
        height: 300.0,
        decoration: BoxDecoration(
          color: Color(0xff08A691),
          border: Border.all(width: 0, color: Colors.transparent),
          /*image: DecorationImage(
                  image: new AssetImage('assets/app/logo-sm.png'),
                )*/
        ),
        child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      //border: Border.all(width: 1.0, color: Colors.white),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(150.0)),
                    ),
                    child: Image.asset('assets/app/logo-sm.png'),
                  ),
                ),
              ),
            ]

        ),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height/1.4);
    path.quadraticBezierTo(
        size.width/2, size.height, size.width, (size.height/1.4));
    path.lineTo(size.width, 0);
    path.close(); // this closes the loop from current position to the starting point of widget
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}