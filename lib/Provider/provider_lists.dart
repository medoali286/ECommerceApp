 import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'admin_mode.dart';
import 'model_hud.dart';

List<SingleChildWidget> mainProviderList(BuildContext context){

  return [

   ChangeNotifierProvider(create: (context){return ModeHud();}),
   ChangeNotifierProvider(create:(context){return AdminMode();},),

  ];
}













