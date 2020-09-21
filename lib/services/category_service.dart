import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suyo/models/category_model.dart';

class CategoryService {
  final CollectionReference categoryCollection = Firestore.instance.collection('category');

  List<CategoryModel> _categoryListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return CategoryModel(
        categoryId: doc.documentID,
        title: doc.data['title'] ?? '',
        description: doc.data['description'] ?? '',
        banner: doc.data['banner'] ?? '',
        bannerOverlay: doc.data['banner_overlay'] ?? '',
        theme: doc.data['theme'] ?? '0xffffffff'
      );
    }).toList();
  }

  Stream<List<CategoryModel>> get categories {
    return categoryCollection.snapshots()
        .map(_categoryListFromSnapshot);
  }
}