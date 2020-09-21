import 'package:get/get.dart';
import 'package:suyo/models/store_model.dart';

class StoreController extends GetxController {
  StoreModel selectedStore;

  setSelectStore(StoreModel store) {
    selectedStore = store;
    update();
  }
}