import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextStyle style = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 15.0,
      color: Color(0xff19a795),
  );

  final _formKey = GlobalKey<FormState>();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(child: Text('SIGN UP')),
              SizedBox(height: 10.0,),
              Divider(
                color: Color(0xff61cb86),
                height: 1,
                thickness: 1,
                //indent: 20,
                endIndent: 0,
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: false,
                  style: style,
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Color(0xff19a795),),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "EMAIL",
                      hintStyle: style.copyWith(fontSize: 11.0, color: Colors.black26),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Color(0xff61cb86), width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Color(0xff19a795), width: 1.0),
                      ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  style: style,
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline, color: Color(0xff19a795),),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "PASSWORD",
                      hintStyle: style.copyWith(fontSize: 11.0, color: Colors.black26),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Color(0xff61cb86), width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Color(0xff19a795), width: 1.0),
                      ),
                  ),
                ),
              ),
              SizedBox(height: 40.0,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FlatButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color(0xff61cb86),
                                Color(0xff61cb86),
                                Color(0xff19a795)
                              ]
                          )
                      ),
                      child: FlatButton(
                        child: Text('Submit', style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /*Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                right: -20.0,
                top: -20.0,
                child: Ink(
                  decoration: ShapeDecoration(
                    //color: Colors.black26,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.close),
                    //color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: false,
                        style: style,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person, color: Color(0xff19a795),),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "EMAIL",
                            hintStyle: style.copyWith(fontSize: 11.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              //borderSide: BorderSide.none,
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Submit"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),*/
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      obscureText: false,
      style: style,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person, color: Color(0xff19a795),),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "EMAIL",
          hintStyle: style.copyWith(fontSize: 11.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: BorderSide.none,
          )
      ),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline, color: Color(0xff19a795),),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "PASSWORD",
          hintStyle: style.copyWith(fontSize: 11.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: BorderSide.none,
          )
      ),
    );
    final loginButon = Material(
        elevation: 0.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff61cb86),
        child: MaterialButton(
          minWidth: 250,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
          child: Text("LOG IN",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
    );

    final regButon = Material(
      elevation: 0.0,
      //borderRadius: BorderRadius.circular(30.0),
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black26,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(50),
      ),

      child: MaterialButton(
        minWidth: 250,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _showMyDialog();
        },
        child: Text("SIGNUP",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xff61cb86),
                  Color(0xff61cb86),
                  Color(0xff19a795)
                ]
            )
        ),
        child: Padding(
          padding: EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.0,
                child: Image.asset(
                  "assets/app/logo-sm.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 5.0),
              Text('SUYO', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w500),),
              Text('Delivery App', style: TextStyle(fontSize: 11.0),),
              SizedBox(height: 45.0),
              emailField,
              SizedBox(height: 7.0),
              passwordField,
              SizedBox(height: 55.0, ),
              loginButon,
              SizedBox(height: 9.0,),
              regButon,
              SizedBox(height: 35.0, ),
              Text('Forgot Password?', style: TextStyle(fontSize: 13.0, color: Color(0xffeeeeee)),),
              SizedBox(height: 35.0, ),
              Text('---- or sign in using ----', style: TextStyle(fontSize: 11.0, color: Color(0xffeeeeee)),),
              SizedBox(height: 9.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.favorite),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.stars),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
