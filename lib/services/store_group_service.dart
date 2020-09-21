import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suyo/models/store_group_model.dart';

class StoreGroupService {

  final String categoryId;

  StoreGroupService({this.categoryId});

  final CollectionReference storeGroupCollection = Firestore.instance.collection('store_group');

  List<StoreGroupModel> _storeGroupListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return StoreGroupModel(
          storeGroupId: doc.documentID,
          categoryId: doc.data['category_id'] ?? '',
          name: doc.data['name'] ?? '',
          description: doc.data['description'] ?? '',
          tag: doc.data['tag'] ?? '',
          theme: doc.data['theme'] ?? '0xffffffff',
          logo: doc.data['logo'] ?? '',
          banner: doc.data['banner'] ?? ''
      );
    }).toList();
  }

  Stream<List<StoreGroupModel>> get list {
    return storeGroupCollection
        .where('category_id', isEqualTo: categoryId)
        .snapshots()
        .map(_storeGroupListFromSnapshot);
  }
}