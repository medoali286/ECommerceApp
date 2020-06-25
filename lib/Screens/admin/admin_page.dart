import 'package:ecommerceapp/Screens/admin/add_product.dart';
import 'package:ecommerceapp/Screens/admin/delete_product.dart';
import 'package:ecommerceapp/Screens/admin/edit_product.dart';
import 'package:ecommerceapp/Tools/text.dart';
import 'package:ecommerceapp/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AdminPage extends StatelessWidget {
  static String id='AdminPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          SizedBox(
            width: double.infinity,
          ),

          RaisedButton(
            child: Text('Add Product'),
              onPressed: (){
              Navigator.pushNamed(context, AddProduct.id);

              }


          ),



          RaisedButton(

              child: Text('Edit Product'),

              onPressed: (){


                Navigator.pushNamed(context, EditProduct.id);

              }
          ),




          RaisedButton(
              child: Text('Delete Product'),

              onPressed:(){

                Navigator.pushNamed(context, DeleteProduct.id);

              }


          ),

        ],
      ),


    );
  }
}
