import 'dart:io';
import 'package:get/get.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:suyo/models/user_model.dart';
import 'package:suyo/services/product_service.dart';
import 'package:suyo/ui/components/constants_ui_component.dart';
import 'package:suyo/ui/components/steps_indicator_ui_component.dart';
import 'package:suyo/ui/views/seller/seller_dashboard_view.dart';

class SellerSetupAddProductView extends StatefulWidget {

  final UserModel user;

  SellerSetupAddProductView({this.user});

  @override
  _SellerSetupAddProductViewState createState() => _SellerSetupAddProductViewState();
}

class _SellerSetupAddProductViewState extends State<SellerSetupAddProductView> {
  final  _formKey = GlobalKey<FormState>();

  String name = '';
  String description = '';

  String banner;

  String error = '';
  String btn = 'Save';

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
        case 'banner':
          setState(()=>banner=fileURL);
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        //backgroundColor: themeColorGreen,
        centerTitle: true,
        title: Text('MERCHANT SETUP : Add Product', style: appbarSmTitle,),
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
              dynamic result = await ProductService(storeId: widget.user.uid).createProduct(name, description, banner);

              if(result != null) {
                Get.to(SellerDashboardView(user: widget.user,));
              } else {
                setState(() {
                  error="Somethings went wrong.";
                  btn="Save";
                });
              }
            } else {
              setState(() {
                btn="Save";
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
                    child: Center(child: Text('Add Products'),),
                  ),
                  StepsIndicator(selectedStep: 2, nbSteps: 3,),
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
                      child: Text('PRODUCT', style: themeTextBold.copyWith(fontSize: 12.0),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Enter a product name.' : null,
                        onChanged: (val) => setState(() => name = val),
                        obscureText: false,
                        style: signUpTextStyle,
                        decoration: signUpInputDecoration.copyWith(
                            hintText: 'PRODUCT NAME',
                            prefixIcon: Icon(Icons.store, color: themeColorGreen,)
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
                      child: Text('ASSETS', style: themeTextBold.copyWith(fontSize: 12.0),),
                    ),
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(child: Text('BANNER'),),
                        ]
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
