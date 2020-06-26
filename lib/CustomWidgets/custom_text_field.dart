import 'package:ecommerceapp/constans.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {

  final IconData icon;
  final String hint;
  final Function onClick;

  String _errorMessage(String hint){
    switch(hint){
      case 'enter your name':return 'name is empty !';
      case 'enter your email' :return 'email is empty !';
      case 'enter your password' :return 'password is empty !';
      case 'Product Name' :return 'Product Name is empty !';
      case 'Product Price' :return 'Product Price is empty !';
      case 'Product Description' :return 'Product Description is empty !';
      case 'Product Category' :return 'Product Category is empty !';
      case 'Product Location' :return 'Product Location is empty !';

    }





  }





  CustomTextField({@required this.onClick,@required this.hint,@required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (value){
          if(value.isEmpty){


            return _errorMessage(hint);
          // ignore: missing_return
          }



        },
        cursorColor: KMainColor,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: KMainColor),
          prefixIcon: Icon(icon,
            color: KMainColor,),
          filled: true,
          fillColor: KSecondaryColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),

            borderSide: BorderSide(
                color: Colors.white
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),

            borderSide: BorderSide(
                color: Colors.white
            ),
          ),
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),

            borderSide: BorderSide(
                color: Colors.white
            ),
          ),
        ),

onSaved: onClick,

      ),
    );
  }
}