import 'dart:async';
import 'dart:io';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:suyo/models/category_model.dart';
import 'package:suyo/models/user_model.dart';
import 'package:suyo/services/store_service.dart';
import 'package:suyo/ui/components/constants_ui_component.dart';
import 'package:suyo/ui/components/steps_indicator_ui_component.dart';
import 'package:suyo/ui/views/seller/setup/seller_setup_add_product_view.dart';

class SellerSetupStoreView extends StatefulWidget {

  final CategoryModel category;
  final UserModel user;

  SellerSetupStoreView({this.category, this.user});

  @override
  _SellerSetupStoreViewState createState() => _SellerSetupStoreViewState();
}

class _SellerSetupStoreViewState extends State<SellerSetupStoreView> {

  final  _formKey = GlobalKey<FormState>();

  String name = '';
  String tag = '';
  String description = '';

  String street = '';
  String barangay = '';
  String city = '';
  String province = '';

  String logo;
  String banner;
  String theme = '';

  String error = '';
  String btn = 'SUBMIT';

  double _dialogWidth = 200.0;

  Future chooseFile(imageType) async {
    try {
      final _picker = ImagePicker();
      await _picker.getImage(source: ImageSource.gallery).then((pickedFile) {
        uploadFile(File(pickedFile.path), imageType);
      });
    }catch(e){
      print(e.toString());
    }

  }

  Future uploadFile(_image, imageType) async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('stores/${widget.user.uid}/${imageType}_${Path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      switch(imageType) {
        case 'logo':
          setState(()=>logo=fileURL);
          break;
        case 'banner':
          setState(()=>banner=fileURL);
          break;
        default:
          break;
      }
    });
  }

  Color currentColor = themeColorGreen;
  Color pickerColor = themeColorGreen;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    if(size.width >= 500) {
      setState(()=> _dialogWidth = 400.0);
    } else {
      setState(()=> _dialogWidth = (size.width - (size.width/4)) );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        //backgroundColor: themeColorGreen,
        centerTitle: true,
        title: Text('MERCHANT SETUP : Store Config', style: appbarSmTitle,),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                themeColorLightGreen,
                themeColorGreen,
              ],
            ),
          ),
        ),

      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: boxDecorationLinear.copyWith(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: FlatButton(
          child: Text(btn, style: TextStyle(color: Colors.white),),
          onPressed: () async {
            setState(() {
              btn="Please wait...";
            });

            if(_formKey.currentState.validate()) {
              dynamic result = await StoreService(catid: widget.category.catid).createStore(widget.user.uid, widget.category.catid, name, tag, description, street, barangay, city, province, logo, banner, theme);

              if(result != null) {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: SellerSetupAddProductView(user: widget.user,),
                    )
                );
              } else {
                setState(() {
                  error="Somethings went wrong.";
                  btn="SUBMIT";
                });
              }
            } else {
              setState(() {
                btn="SUBMIT";
              });
            }
          },
        ),

      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(child: Text('PROVIDE YOUR STORE DETAILS'),),
                  ),
                  StepsIndicator(selectedStep: 1, nbSteps: 3,),
                  SizedBox(height: 15.0,),

                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: _dialogWidth,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text('STORE', style: themeTextBold.copyWith(fontSize: 12.0),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Enter a store name.' : null,
                        onChanged: (val) => setState(() => name = val),
                        obscureText: false,
                        style: signUpTextStyle,
                        decoration: signUpInputDecoration.copyWith(
                            hintText: 'STORE NAME',
                            prefixIcon: Icon(Icons.store, color: themeColorGreen,)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: TextFormField(
                        //validator: (val) => val.isEmpty ? 'Enter a store tag name.' : null,
                        onChanged: (val) => setState(() => tag = val),
                        obscureText: false,
                        style: signUpTextStyle,
                        decoration: signUpInputDecoration.copyWith(
                            hintText: 'STORE TAG NAME',
                            prefixIcon: Icon(Icons.star_border, color: themeColorGreen,)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Enter Description.' : null,
                        onChanged: (val) => setState(() => description = val),
                        obscureText: false,
                        style: signUpTextStyle,
                        decoration: signUpInputDecoration.copyWith(
                            hintText: 'DESCRIPTION',
                            prefixIcon: Icon(Icons.info_outline, color: themeColorGreen,)
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text('STORE ADDRESS', style: themeTextBold.copyWith(fontSize: 12.0),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Enter Street.' : null,
                        onChanged: (val) => setState(() => street = val),
                        obscureText: false,
                        style: signUpTextStyle,
                        decoration: signUpInputDecoration.copyWith(
                            hintText: 'STREET',
                            prefixIcon: Icon(Icons.pin_drop, color: themeColorGreen,)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Enter Barangay.' : null,
                        onChanged: (val) => setState(() => barangay = val),
                        obscureText: false,
                        style: signUpTextStyle,
                        decoration: signUpInputDecoration.copyWith(
                            hintText: 'BARANGAY',
                            prefixIcon: Icon(Icons.streetview, color: themeColorGreen,)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Enter City.' : null,
                        onChanged: (val) => setState(() => city = val),
                        obscureText: false,
                        style: signUpTextStyle,
                        decoration: signUpInputDecoration.copyWith(
                            hintText: 'CITY',
                            prefixIcon: Icon(Icons.location_city, color: themeColorGreen,)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Enter Province.' : null,
                        onChanged: (val) => setState(() => province = val),
                        obscureText: false,
                        style: signUpTextStyle,
                        decoration: signUpInputDecoration.copyWith(
                            hintText: 'PROVINCE',
                            prefixIcon: Icon(Icons.landscape, color: themeColorGreen,)
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text('ASSETS', style: themeTextBold.copyWith(fontSize: 12.0),),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(child: Text('LOGO'),),
                        Center(child: Text('BANNER'),),
                        Center(child: Text('THEME'),),
                      ]
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100,
                          alignment: Alignment.center,
                          child: logo != null ?
                          Image.network(logo, height: 50, ) :
                          RaisedButton(
                            child: Text('Upload', style: TextStyle(color: Colors.white)),
                            onPressed: () async {
                              await chooseFile('logo');
                            },
                            color: themeColorGreen,
                          ),
                        ),
                        Container(
                          height: 100,
                          alignment: Alignment.center,
                          child: banner != null ?
                          Image.network(banner, height: 50, ) :
                          RaisedButton(
                            child: Text('Upload', style: TextStyle(color: Colors.white)),
                            onPressed: () async {
                              await chooseFile('banner');
                            },
                            color: themeColorGreen,
                          ),
                        ),
                        RaisedButton(
                          elevation: 3.0,
                          child: const Text('Change'),
                          color: currentColor,
                          textColor: useWhiteForeground(currentColor)
                              ? const Color(0xffffffff)
                              : const Color(0xff000000),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Pick a color!'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: pickerColor,
                                      onColorChanged: changeColor,
                                      showLabel: true,
                                      pickerAreaHeightPercent: 0.8,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: const Text('Got it'),
                                      onPressed: () {
                                        setState((){
                                          theme = pickerColor.value.toString();
                                          currentColor = pickerColor;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },

                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Center(child: Text(error, style: TextStyle(color: Colors.red),)),

                    SizedBox(height: 20.0,),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
