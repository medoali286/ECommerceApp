import 'package:ecommerceapp/CustomWidgets/custom_text_field.dart';
import 'package:ecommerceapp/Services/store.dart';
import 'package:ecommerceapp/Tools/Tools.dart';
import 'package:ecommerceapp/constans.dart';
import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class AddProduct extends StatelessWidget {
  static String id='AddProduct';

  String _price;
  String _name;
  String _description;
  String _category;
  String _imageLocation;
  final GlobalKey<FormState>_globalKeyForm=GlobalKey<FormState>();
  final Store _store=Store();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    key: _scaffoldKey,
    backgroundColor: KMainColor,
body: Form(
  key: _globalKeyForm,
  child:   Column(

    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[

        CustomTextField(

          hint: 'Product Name',
          onClick: (value){

            _name=value;
          },
        ),

      SizedBox(height: 10,),

      CustomTextField(
        hint: 'Product Price',
        onClick: (value){
          _price=value;
        },

      ),
      SizedBox(height: 10,),

      CustomTextField(
        hint: 'Product Description',
        onClick: (value){
          _description=value;
        },

      ),
      SizedBox(height: 10,),

      CustomTextField(

        hint: 'Product Category',

        onClick: (value){
          _category=value;
        },

      ),
      SizedBox(height: 10,),

      CustomTextField(
        hint: 'Product Location',
        onClick: (value){
          _imageLocation='material/images/jackets/jacket'+value+'.jpg';
        },



      ),
      SizedBox(height: 10,),

      RaisedButton(
        child: Text('Add Product'),
          onPressed:()async{

          if(_globalKeyForm.currentState.validate()){

            _globalKeyForm.currentState.save();










           var _product=  Product(

             pPrice: _price,
             pName: _name,
             pDescription: _description,
             pCategory: _category,
             imageLocation: _imageLocation
           );
try {
  await _store.addProduct(_product);
  _scaffoldKey.currentState.showSnackBar(Tools.snackBar('success'));

}  catch (e){
  _scaffoldKey.currentState.showSnackBar(Tools.snackBar(e.message));

            }

          }


          } ),





    ],



  ),
),
  );
  }
}
