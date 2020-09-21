import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suyo/models/product_model.dart';

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
      'store_id':storeId,
      'name':name,
      'description':description,
      'banner':banner,
    });

    return productCollection.document();
  }

  List<ProductModel> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ProductModel(
          productId: doc.documentID,
          storeId: doc.data['store_id'],
          name: doc.data['name'],
          description: doc.data['description'],
          banner: doc.data['banner'],
      );
    }).toList();
  }

  Stream<List<ProductModel>> get products {
    return productCollection.where('store_id', isEqualTo: storeId).snapshots().map(_productListFromSnapshot);
  }
}