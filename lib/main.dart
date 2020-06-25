
import 'package:ecommerceapp/Provider/provider_lists.dart';
import 'package:ecommerceapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/user/login_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: mainProviderList(context),
      child: MaterialApp(
          initialRoute: LogInScreen.id,
          routes: route(),
        ),
    );

  }
}
