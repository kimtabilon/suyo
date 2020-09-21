import 'package:get/get.dart';
import 'package:suyo/models/store_group_model.dart';

class StoreGroupController extends GetxController {
  StoreGroupModel selectedStoreGroup;

  setSelectStoreGroup(StoreGroupModel storeGroup) {
    selectedStoreGroup = storeGroup;
    update();
  }
}