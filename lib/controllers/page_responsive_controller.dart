import 'package:get/get.dart';

class PageResponsiveController extends GetxController {
  int crossAxisCount = 2;

  setCrossAxisCount(pageSize) {
    if(pageSize.width >= 1400 ) {
      crossAxisCount = 6;
    }else if(pageSize.width >= 1080 ) {
      crossAxisCount = 5;
    } else if(pageSize.width >= 900) {
      crossAxisCount = 4;
    } else if(pageSize.width >= 768) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 2;
    }
  }
}