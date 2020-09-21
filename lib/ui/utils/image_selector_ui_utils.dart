import 'dart:io';

import 'package:image_picker/image_picker.dart';
class ImageSelector {
  Future<File> selectImage() async {
    final ImagePicker _picker = ImagePicker();
    PickedFile pickedFile =  await _picker.getImage(source: ImageSource.gallery);
    return File(pickedFile.path);
  }
}