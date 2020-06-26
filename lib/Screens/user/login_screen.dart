import 'package:ecommerceapp/CustomWidgets/custom_text_field.dart';
import 'package:ecommerceapp/Provider/admin_mode.dart';
import 'package:ecommerceapp/Provider/model_hud.dart';
import 'package:ecommerceapp/Screens/user/home_page.dart';
import 'package:ecommerceapp/Screens/user/signup_screen.dart';
import 'package:ecommerceapp/Services/auth.dart';
import 'package:ecommerceapp/Tools/Tools.dart';
import 'package:ecommerceapp/Tools/text.dart';
import 'package:ecommerceapp/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../admin/admin_page.dart';

// ignore: must_be_immutable
class LogInScreen extends StatelessWidget {

  static String id = 'LogInScreen';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String email;
  String password;
  Auth _auth = Auth();
  final adminPassword ='admin1234';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: KMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModeHud>(context).isLoading,
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
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
                          style:
                              TextStyle(fontFamily: 'Pacifico', fontSize: 25),
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
                onClick: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: height * .013,
              ),
              CustomTextField(
                hint: 'enter your password',
                icon: Icons.lock,
                onClick: (value) {
                  password = value;
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
                  onPressed: () async {

                                _validate(context);


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
                    onTap: () {
                      Navigator.of(context).pushNamed(SignUpScreen.id);
                    },
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Provider.of<AdminMode>(context).isAdmin
                            ? Text('')
                            : GestureDetector(
                                child: TextTools.text('i\'m an admin'),
                                onTap: () {
                                  Provider.of<AdminMode>(context, listen: false)
                                      .changeIsAdmin(true);
                                },
                              )),
                    Expanded(
                        child: Provider.of<AdminMode>(context).isAdmin
                            ? GestureDetector(
                                child: TextTools.text('i\' a user'),
                                onTap: () {
                                  Provider.of<AdminMode>(context, listen: false)
                                      .changeIsAdmin(false);
                                },
                              )
                            : Text('')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validate(BuildContext context) async{

    final modelHud=Provider.of<ModeHud>(context,listen: false);

    modelHud.changeIsLoading(true);

    if(_globalKey.currentState.validate()){

      _globalKey.currentState.save();

if(Provider.of<AdminMode>(context,listen: false).isAdmin){
if(adminPassword==password){



  try {
   await _auth.signIn(email: email, password: password);
    Navigator.pushNamed(context, AdminPage.id);
  }on PlatformException catch (e){
    modelHud.changeIsLoading(false);
    _scaffoldKey.currentState.showSnackBar(Tools.snackBar(e.message.toString()));

  }




}else{
  modelHud.changeIsLoading(false);
  _scaffoldKey.currentState.showSnackBar(Tools.snackBar('something went wrong !'));



}


}else{
try {
 await _auth.signIn(email: email, password: password);
  Navigator.pushNamed(context, HomePage.id);
}on PlatformException catch (e){
  modelHud.changeIsLoading(false);
  _scaffoldKey.currentState.showSnackBar(Tools.snackBar(e.message.toString()));

}
}




    }

    modelHud.changeIsLoading(false);




  }
}
