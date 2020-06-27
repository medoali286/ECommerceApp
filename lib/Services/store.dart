import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/constans.dart';
import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/cupertino.dart';



class Store{


  final Firestore _firestore=Firestore.instance;

addProduct(Product product){

  _firestore.collection(KProductsCollection).add(
    {
      KProductName :product.pName,
      KProductLocation :product.imageLocation,
      KProductCategory :product.pCategory,
      KProductPrice :product.pPrice,
      KProductDescription :product.pDescription
    }
  );

}




Stream<QuerySnapshot>loadProduct(){

 return _firestore.collection(KProductsCollection).snapshots();
}


deleteProduct(documentId){

_firestore.collection(KProductsCollection).document(documentId).delete();

}



editProduct({@required String docId,@required Map<String,String> product}){
_firestore.collection(KProductsCollection).document(docId).updateData(product);



}





}