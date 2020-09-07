import 'package:flutter/material.dart';

const themeColorLightGreen = Color(0xff61cb86);
const themeColorGreen = Color(0xff19a795);
const themeTextBold = TextStyle(
  fontWeight: FontWeight.bold,
  color: Color(0xff333333),
);

/*DRAWER NAVIGATION*/
const navTrailingIcon = Icon(Icons.arrow_forward_ios, size: 15.0, color: themeColorGreen);
const navTitleTextStyle = TextStyle(
  fontSize: 13.0,
  color: themeColorGreen,
);

/*SIGNUP*/
const signUpTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 15.0,
  color: themeColorGreen,
);

const signUpHintStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 11.0,
  color: Colors.black26,
);

const signUpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
  hintStyle: signUpHintStyle,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Colors.black26, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Colors.black26, width: 1.0),
  ),
);

const boxDecorationLinear = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          themeColorLightGreen,
          themeColorLightGreen,
          themeColorGreen,
        ]
    )
);

/*SIGN IN*/
const signinFieldTextStyle =  TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 15.0,
  color: themeColorGreen,
);

const signinInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      borderSide: BorderSide.none,
    )
);