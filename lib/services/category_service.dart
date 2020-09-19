import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suyo/models/category_model.dart';

class CategoryService {
  final CollectionReference categoryCollection = Firestore.instance.collection('category');

  List<CategoryModel> _categoryListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return CategoryModel(
        catid: doc.documentID,
        title: doc.data['title'] ?? '',
        description: doc.data['description'] ?? '',
        thumbnail: doc.data['thumbnail'] ?? '',
        banner: doc.data['banner'] ?? '',
        color: doc.data['color'] ?? '0xffffffff',
        theme: doc.data['theme'] ?? ''
      );
    }).toList();
  }

  Stream<List<CategoryModel>> get categories {
    return categoryCollection.snapshots()
        .map(_categoryListFromSnapshot);
  }
}