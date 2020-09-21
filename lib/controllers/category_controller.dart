import 'package:get/get.dart';
import 'package:suyo/models/category_model.dart';

class CategoryController extends GetxController {
  CategoryModel selectedCategory;

  setSelectCategory(CategoryModel category) {
    selectedCategory = category;
    update();
  }
}