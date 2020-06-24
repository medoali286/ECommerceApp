import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth{

  final _auth=FirebaseAuth.instance;

Future<AuthResult>  signUp({@required String email,@required String password})async{

    final authResult=await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return authResult;

  }

  Future<AuthResult>  signIn({@required String email,@required String password})async{

    final authResult=await _auth.signInWithEmailAndPassword(email: email, password: password);
    return authResult;

  }





}