import 'package:ecommerceapp/Screens/admin/edit_product.dart';
import 'package:flutter/material.dart';

import 'Screens/admin/add_product.dart';
import 'Screens/admin/admin_page.dart';
import 'Screens/admin/delete_product.dart';
import 'Screens/admin/manage_product.dart';
import 'Screens/user/home_page.dart';
import 'Screens/user/login_screen.dart';
import 'Screens/user/signup_screen.dart';

Map<String,Widget Function(BuildContext)>route(){
  return{
    LogInScreen.id: (context) => LogInScreen(),
    SignUpScreen.id: (context) => SignUpScreen(),
    HomePage.id:(context)=>HomePage(),
    AdminPage.id:(context)=>AdminPage(),
    AddProduct.id:(context)=>AddProduct(),
    ManageProduct.id:(context)=>ManageProduct(),
    DeleteProduct.id:(context)=>DeleteProduct(),
    EditProduct.id:(context)=>EditProduct(),













  };



}