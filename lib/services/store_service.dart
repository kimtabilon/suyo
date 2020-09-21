import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suyo/models/store_model.dart';

class StoreService {

  final String storeGroupId;

  StoreService({this.storeGroupId});

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
        storeId: doc.documentID,
        storeGroupId: doc.data['store_group_id'],
        name: doc.data['name'],
        description: doc.data['description'],
        customLogo: doc.data['custom_logo'],
        customBanner: doc.data['custom_banner'],

        addrStreet: doc.data['addr_street'],
        addrBarangay: doc.data['addr_barangay'],
        addrCity: doc.data['addr_city'],
        addrProvince: doc.data['addr_province'],
      );
    }).toList();
  }

  Stream<List<StoreModel>> get stores {
    return storeCollection.where('store_group_id', isEqualTo: storeGroupId).snapshots().map(_storeListFromSnapshot);
  }
}