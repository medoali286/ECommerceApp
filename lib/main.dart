import 'package:ecommerceapp/Provider/model_hud.dart';
import 'package:ecommerceapp/Screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/login_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModeHud>(
      create: (context)=>ModeHud(),
      child: MaterialApp(
        initialRoute: LogInScreen.id,
        routes: {
          LogInScreen.id: (context) => LogInScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
        },
      ),
    );
  }
}
