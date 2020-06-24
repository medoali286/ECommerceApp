import 'package:ecommerceapp/CustomWidgets/custom_text_field.dart';
import 'package:ecommerceapp/Provider/model_hud.dart';
import 'package:ecommerceapp/Provider/model_hud.dart';
import 'package:ecommerceapp/Provider/model_hud.dart';
import 'package:ecommerceapp/Screens/signup_screen.dart';
import 'package:ecommerceapp/Services/auth.dart';
import 'package:ecommerceapp/constans.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:ecommerceapp/Provider/model_hud.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogInScreen extends StatelessWidget {
  static String id = 'LogInScreen';
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  final GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey<ScaffoldState>();
  String email;
  String password;
  Auth _auth=Auth();


  @override
  Widget build(BuildContext context) {


    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: KMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModeHud>(context).isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset("material/images/icons/buy.png"),
                      Positioned(
                        bottom: 0,
                        child: Text(
                          'Buy it',
                          style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: height * .013,
              ),



              CustomTextField(
                hint: 'enter your email',
                icon: Icons.email,
                onClick: (value){
                  email=value;
                },
              ),
              SizedBox(
                height: height * .013,
              ),
              CustomTextField(
                hint: 'enter your password',
                icon: Icons.lock,
                onClick: (value){
                  password=value;
                  },
              ),
              SizedBox(
                height: height * .05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.black,
                  child: Text(
                    'login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{


                    final modeHud=Provider.of<ModeHud>(context,listen: false);
                    modeHud.changeIsLoading(true);

                    if(_globalKey.currentState.validate()){

                      _globalKey.currentState.save();

                      try {
                    final authResult = await _auth.signIn(
                          email: email, password: password);
                    modeHud.changeIsLoading(false);

                   _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(authResult.user.email)));

                    }on PlatformException catch(e){
                        modeHud.changeIsLoading(false);

                        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(e.message.toString()),));



                   }






                    }
                    modeHud.changeIsLoading(false);

                  },
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don\'t have an account ?',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  GestureDetector(
                    child: Text(
                      'Sign up',
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: (){
                      Navigator.of(context).pushNamed(SignUpScreen.id);
                    },

                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
