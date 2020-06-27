import 'package:ecommerceapp/CustomWidgets/custom_text_field.dart';
import 'package:ecommerceapp/Services/store.dart';
import 'package:ecommerceapp/Tools/Tools.dart';
import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/material.dart';

import '../../constans.dart';


class EditProduct extends StatefulWidget {
  static String id='EditProduct';

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  TextEditingController _controllerPrice;
  TextEditingController _controllerName;
  TextEditingController _controllerDescription;
  TextEditingController _controllerCategory;
  TextEditingController _controllerImageLocation;


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

    Product _product=ModalRoute.of(context).settings.arguments;

_controllerPrice=TextEditingController(text: _product.pPrice);
_controllerCategory=TextEditingController(text: _product.pCategory);
_controllerName=TextEditingController(text: _product.pName);
_controllerDescription=TextEditingController(text: _product.pDescription);
_controllerImageLocation=TextEditingController(text: _product.imageLocation);



    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: KMainColor,
      body: Form(
        key: _globalKeyForm,
        child:   Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[



            CustomTextField(
controller: _controllerName,
              hint: 'Product Name',
              onClick: (value){

                _name=value;
              },
            ),

            SizedBox(height: 10,),

            CustomTextField(
              hint: 'Product Price',
              controller: _controllerPrice,
              onClick: (value){
                _price=value;
              },

            ),
            SizedBox(height: 10,),

            CustomTextField(
              controller: _controllerDescription,
              hint: 'Product Description',
              onClick: (value){
                _description=value;
              },

            ),
            SizedBox(height: 10,),

            CustomTextField(
              controller: _controllerCategory,

              hint: 'Product Category',

              onClick: (value){
                _category=value;
              },

            ),
            SizedBox(height: 10,),

            CustomTextField(
              controller: _controllerImageLocation,
              hint: 'Product Location',
              onClick: (value){
                _imageLocation='material/images/jackets/jacket'+value+'.jpg';
              },



            ),
            SizedBox(height: 10,),

            RaisedButton(
                child: Text('Edit Product'),
                onPressed:()async{

                  if(_globalKeyForm.currentState.validate()){

                    _globalKeyForm.currentState.save();



                    Map<String,String> _productMap= {
                      KProductName:_controllerName.text,
                      KProductDescription:_controllerDescription.text,
                      KProductPrice:_controllerPrice.text,
                      KProductCategory:_controllerCategory.text,
                      KProductLocation:_controllerImageLocation.text,



                    };



                    try {
                      await _store.editProduct(
                        docId: _product.pId,
                        product: _productMap

                      );
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
