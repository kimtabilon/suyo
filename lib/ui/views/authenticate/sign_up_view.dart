import 'package:flutter/material.dart';
import 'package:suyo/services/auth_service.dart';
import 'package:suyo/ui/components/constants_ui_component.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final AuthService _auth = AuthService();
  final  _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String firstName = '';
  String middleName = '';
  String lastName = '';
  String phone = '';
  String gender = '';
  String birthday = '';
  String error = '';
  String signupBtn = 'Submit';

  double _dialogWidth = 200.0;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    //print(size.width);
    if(size.width >= 500) {
      setState(()=> _dialogWidth = 400.0);
    } else {
      print(size.width - (size.width/4));
      setState(()=> _dialogWidth = (size.width - (size.width/4)) );
    }


    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
      content: Container(
        width: _dialogWidth,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(child: Text('SIGN UP', style: themeTextBold,)),
              SizedBox(height: 10.0,),
              Divider(
                color: themeColorGreen,
                height: 1,
                thickness: 1,
                endIndent: 0,
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('NAME', style: themeTextBold.copyWith(fontSize: 12.0),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter a first name.' : null,
                  onChanged: (val) => setState(() => firstName = val),
                  obscureText: false,
                  style: signUpTextStyle,
                  decoration: signUpInputDecoration.copyWith(
                      hintText: 'FIRST NAME',
                      prefixIcon: Icon(Icons.person_outline, color: themeColorGreen,)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextFormField(
                  //validator: (val) => val.isEmpty ? 'Enter a middle name.' : null,
                  onChanged: (val) => setState(() => middleName = val),
                  obscureText: false,
                  style: signUpTextStyle,
                  decoration: signUpInputDecoration.copyWith(
                      hintText: 'MIDDLE NAME',
                      prefixIcon: Icon(Icons.person_pin, color: themeColorGreen,)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter a last name.' : null,
                  onChanged: (val) => setState(() => lastName = val),
                  obscureText: false,
                  style: signUpTextStyle,
                  decoration: signUpInputDecoration.copyWith(
                      hintText: 'LAST NAME',
                      prefixIcon: Icon(Icons.people, color: themeColorGreen,)
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('INFORMATION', style: themeTextBold.copyWith(fontSize: 12.0),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter your Phone Number.' : null,
                  onChanged: (val) => setState(() => phone = val),
                  obscureText: false,
                  style: signUpTextStyle,
                  decoration: signUpInputDecoration.copyWith(
                      hintText: 'PHONE NUMBER',
                      prefixIcon: Icon(Icons.phone_android, color: themeColorGreen,)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter your Gender.' : null,
                  onChanged: (val) => setState(() => gender = val),
                  obscureText: false,
                  style: signUpTextStyle,
                  decoration: signUpInputDecoration.copyWith(
                      hintText: 'GENDER',
                      prefixIcon: Icon(Icons.person_pin_circle, color: themeColorGreen,)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter your Birthday.' : null,
                  onChanged: (val) => setState(() => birthday = val),
                  obscureText: false,
                  style: signUpTextStyle,
                  decoration: signUpInputDecoration.copyWith(
                      hintText: 'BIRTHDAY',
                      prefixIcon: Icon(Icons.calendar_today, color: themeColorGreen,)
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('LOGIN DETAILS', style: themeTextBold.copyWith(fontSize: 12.0),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an email.' : null,
                  onChanged: (val) => setState(() => email = val),
                  obscureText: false,
                  style: signUpTextStyle,
                  decoration: signUpInputDecoration.copyWith(
                      hintText: 'EMAIL',
                      prefixIcon: Icon(Icons.alternate_email, color: themeColorGreen,)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextFormField(
                  validator: (val) => val.length < 6 ? 'Enter a password 6 chars long.' : null,
                  onChanged: (val) => setState(() => password = val),
                  obscureText: true,
                  style: signUpTextStyle,
                  decoration: signUpInputDecoration.copyWith(
                      hintText: 'PASSWORD',
                      prefixIcon: Icon(Icons.vpn_key, color: themeColorGreen,)
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Center(child: Text(error, style: TextStyle(color: Colors.red),)),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FlatButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: boxDecorationLinear,
                      child: FlatButton(
                        child: Text(signupBtn, style: TextStyle(color: Colors.white),),
                        onPressed: () async {
                          if(_formKey.currentState.validate()) {
                            setState(()=>signupBtn='Please wait');

                            dynamic result = await _auth
                                .signUpWithEmailAndPassword(
                              email,
                              password,
                              firstName,
                              middleName,
                              lastName,
                              phone,
                              gender,
                              birthday,
                            );

                            if(result == null) {
                              setState(() {
                                error = 'Please suply a valid email';
                                signupBtn='Submit';
                              });
                            } else {
                              Navigator.pop(context, true);
                            }
                          } else {
                            setState(() {
                              signupBtn='Submit';
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


