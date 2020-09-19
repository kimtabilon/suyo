import 'package:flutter/material.dart';
import 'package:suyo/ui/views/authenticate/sign_up_view.dart';
import 'package:suyo/services/auth_service.dart';
import 'package:suyo/ui/components/constants_ui_component.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  String loginBtn = 'SIGN IN';

  double _formWidth = 400.0;

  Future<void> _showMyDialog() async {
    bool signUpSuccess = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SignUpView();
      },
    );

    if(signUpSuccess) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      validator: (val) => val.isEmpty ? 'Enter an email.':null,
      onChanged: (val) => setState(()=> email = val),
      obscureText: false,
      style: signinFieldTextStyle,
      textAlign: TextAlign.center,
      decoration: signinInputDecoration.copyWith(
          hintText: 'EMAIL',
          hintStyle: signinFieldTextStyle.copyWith(fontSize: 11.0)
      ),
    );

    final passwordField = TextFormField(
      validator: (val) => val.length < 6 ? 'Enter a password 6 chars long.':null,
      onChanged: (val) => setState(()=>password=val),
      obscureText: true,
      style: signinFieldTextStyle,
      textAlign: TextAlign.center,
      decoration: signinInputDecoration.copyWith(
          hintText: 'PASSWORD',
          hintStyle: signinFieldTextStyle.copyWith(fontSize: 11.0)
      ),
    );


    final loginButon = Material(
      elevation: 0.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff61cb86),
      child: MaterialButton(
        minWidth: 250,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          setState((){
            loginBtn = 'Please wait...';
          });

          if(_formKey.currentState.validate()) {
            dynamic result = await _auth.signInWithEmailAndPassword(email, password);

            if(result == null) {
              setState((){
                error = 'Could not sign in with those credentials.';
                loginBtn='SIGN IN';
              });
            } else {
              Navigator.pop(context);
            }
          } else {
            setState(()=>loginBtn='SIGN IN');
          }
        },
        child: Text(loginBtn,
            textAlign: TextAlign.center,
            style: signinFieldTextStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold
            )
        ),
      ),
    );

    final regButon = Material(
      elevation: 0.0,
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
            style: signinFieldTextStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold
            )
        ),
      ),
    );

    var size = MediaQuery.of(context).size;

    if(size.width > 1000) {
      setState(()=> _formWidth = (size.width - (size.width/2)));
    } else if(size.width > 700) {
      setState(()=> _formWidth = (size.width - (size.width/3)));
    } else if(size.width > 500) {
      setState(()=> _formWidth = (size.width - (size.width/4)));
    } else {
      setState(()=> _formWidth = (size.width - (size.width/6)));
    }

    return Scaffold(
        backgroundColor: themeColorGreen,
        floatingActionButton: RawMaterialButton(
          onPressed: () => Navigator.pop(context),
          elevation: 0.0,
          focusElevation: 0.0,
          highlightElevation: 0.0,
          disabledElevation: 0.0,
          hoverElevation: 0.0,
          constraints: BoxConstraints(),
          fillColor: Colors.transparent,
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          shape: CircleBorder(),
          padding: EdgeInsets.all(15.0),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            width: double.infinity,
            decoration: boxDecorationLinear,
            child: Form(
              key: _formKey,
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
                  Container(width: _formWidth, child: emailField),
                  SizedBox(height: 7.0),
                  Container(width: _formWidth, child: passwordField),
                  SizedBox(height: 7.0),
                  Text(error, style: TextStyle(fontSize: 13.0, color: Colors.red),),
                  SizedBox(height: 40.0, ),
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
          ),
        )
    );
  }
}


