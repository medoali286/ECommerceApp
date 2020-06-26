import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/constans.dart';
import 'package:ecommerceapp/models/product.dart';



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

}