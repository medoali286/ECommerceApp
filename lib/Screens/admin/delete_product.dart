import 'package:flutter/material.dart';

import '../../constans.dart';


class DeleteProduct extends StatelessWidget {
  static String id= 'DeleteProduct';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      body: Center(child: Text('DeleteProduct')),
    );
  }
}
