

import 'package:flutter/cupertino.dart';

class ModeHud extends ChangeNotifier{
  bool isLoading=false;

  changeIsLoading(bool value){

    isLoading=value;
    notifyListeners();




  }





}