import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suyo/models/store_model.dart';

class StoreService {

  final String catid;

  StoreService({this.catid});

  final CollectionReference storeCollection = Firestore.instance.collection('store');

  Future createStore(
      String userId,
      String catId,
      String name,
      String tag,
      String description,

      String street,
      String barangay,
      String city,
      String province,

      String logo,
      String banner,
      String theme,
    ) async
  {
    await storeCollection.document(userId).setData(
      {
        'catid': catId,
        'name': name,
        'tag': tag,
        'description': description,

        'street': street,
        'barangay': barangay,
        'city': city,
        'province': province,

        'logo': logo,
        'banner': banner,
        'theme': theme,
      }
    );

    return storeCollection.document(userId);
  }

  List<StoreModel> _storeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return StoreModel(
        storeid: doc.documentID,
        catid: doc.data['catid'],
        name: doc.data['name'],
        description: doc.data['description'],
        tag: doc.data['tag'],

        street: doc.data['street'],
        barangay: doc.data['barangay'],
        city: doc.data['city'],
        province: doc.data['province'],

        logo: doc.data['logo'],
        banner: doc.data['banner'],
        theme: doc.data['theme']
      );
    }).toList();
  }

  Stream<List<StoreModel>> get stores {
    return storeCollection.where('catid', isEqualTo: catid).snapshots().map(_storeListFromSnapshot);
  }
}