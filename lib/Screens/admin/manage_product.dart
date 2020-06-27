import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Screens/admin/edit_product.dart';
import 'package:ecommerceapp/Services/store.dart';
import 'package:ecommerceapp/Tools/Tools.dart';
import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constans.dart';

class ManageProduct extends StatefulWidget {
  static String id = 'ManageProduct';

  @override
  _ManageProductState createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  final _store = Store();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> _product = [];
              for (var doc in snapshot.data.documents) {
                var data = doc.data;

                _product.add(Product(
                  pId: doc.documentID,
                    pPrice: data[KProductPrice],
                    pName: data[KProductName],
                    pDescription: data[KProductDescription],
                    pCategory: data[KProductCategory],
                    imageLocation: data[KProductLocation]));
              }
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .8,
                  ),
                  itemCount: _product.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      _product[index].imageLocation)),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Opacity(
                                opacity: .6,
                                child: Container(
                                  color: Colors.white,
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          _product[index].pName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('\$ ${_product[index].pPrice}'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTapUp: (details) {
                          double dx=details.globalPosition.dx;
                          double dy=details.globalPosition.dy;
                          double dx2=MediaQuery.of(context).size.width-dx;
                          double dy2=MediaQuery.of(context).size.height-dy;


                          showMenu(context: context,
                              position:RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                              items: [

                                PopupMenuItem(
                                    child: GestureDetector(
                              child: Text('Edit'),
                                      onTap: (){
                                Navigator.of(context).pushNamed(EditProduct.id,arguments: _product[index]);

                                      },
                                        )
                                ),
                                PopupMenuItem(
                                    child:GestureDetector(

                                        child: Text('Delete'),
                                      onTap: ()async{
                                       await _store.deleteProduct(_product[index].pId);
                                       _scaffoldKey.currentState.showSnackBar(Tools.snackBar('success'));
                                      },

                                    ),

                                ),

                              ]);

                        },
                      ),
                    );
                  });
            } else {
              return Center(child: Text('Loading.....'));
            }
          }),
    );
  }
}
