import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseRemoteDataSource {
  Future signIn(
      {required TextEditingController emailControllerSign,
      required TextEditingController passwordControllerSign});

  Future logIn(
      {required TextEditingController emailControllerLogin,
      required TextEditingController passwordControllerLogin});
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future logIn(
      {required TextEditingController emailControllerLogin,
      required TextEditingController passwordControllerLogin}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailControllerLogin.text.trim(),
      password: passwordControllerLogin.text.trim(),
    );
  }

  @override
  Future signIn(
      {required TextEditingController emailControllerSign,
      required TextEditingController passwordControllerSign}) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailControllerSign.text.trim(),
      password: passwordControllerSign.text.trim(),
    );
  }
}
