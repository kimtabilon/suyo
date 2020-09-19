import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suyo/models/product._modeldart';

class ProductService {
  final String storeId;

  ProductService({this.storeId});

  final CollectionReference productCollection = Firestore.instance.collection('product');

  Future createProduct(
    String name,
    String description,
    String banner,
  ) async {
    await productCollection.document().setData({
      'storeId':storeId,
      'name':name,
      'description':description,
      'banner':banner,
    });

    return productCollection.document(storeId);
  }

  List<Product> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      print(doc.data['storeId']);
      return Product(
          productId: doc.documentID,
          storeId: doc.data['storeId'],
          name: doc.data['name'],
          description: doc.data['description'],
          banner: doc.data['banner'],
      );
    }).toList();
  }

  Stream<List<Product>> get products {
    return productCollection.where('storeId', isEqualTo: storeId).snapshots().map(_productListFromSnapshot);
  }
}