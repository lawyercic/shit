import 'package:flutter/cupertino.dart';

import '../repository/base_repository.dart';

class LogIn {
  BaseRepository baseRepository;

  LogIn(this.baseRepository);

  Future excute(
      {required TextEditingController emailControllerLogin,
      required TextEditingController passwordControllerLogin}) async {
    return baseRepository.logIn(
        emailControllerLogin: emailControllerLogin,
        passwordControllerLogin: passwordControllerLogin);
  }
}
