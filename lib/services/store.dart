import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suyo/models/store.dart';

class StoreService {

  final String catid;

  StoreService({this.catid});

  final CollectionReference storeCollection = Firestore.instance.collection('store');

  List<Store> _storeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Store(
        storeid: doc.documentID,
        catid: doc.data['catid'],
        name: doc.data['name'],
        description: doc.data['description'],
        address: doc.data['address'],
        logo: doc.data['logo'],
        thumbnail: doc.data['thumbnail'],
        tag: doc.data['tag'],
        theme: doc.data['theme']
      );
    }).toList();
  }

  Stream<List<Store>> get stores {
    return storeCollection.where('catid', isEqualTo: catid).snapshots().map(_storeListFromSnapshot);
  }
}