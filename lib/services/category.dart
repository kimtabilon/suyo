import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suyo/models/category.dart';

class CategoryService {
  final CollectionReference categoryCollection = Firestore.instance.collection('category');

  List<Category> _categoryListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Category(
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

  Stream<List<Category>> get categories {
    return categoryCollection.snapshots()
        .map(_categoryListFromSnapshot);
  }
}