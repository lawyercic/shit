import 'package:flutter/cupertino.dart';

abstract class BaseRepository {
  Future signIn(
      {required TextEditingController emailControllerSign,
      required TextEditingController passwordControllerSign});

  Future logIn(
      {required TextEditingController emailControllerLogin,
      required TextEditingController passwordControllerLogin});
}
