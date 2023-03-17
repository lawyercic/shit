import 'package:flutter/cupertino.dart';
import 'package:lawer/features/domain/repository/base_repository.dart';

class SignIn {
  BaseRepository baseRepository;

  SignIn(this.baseRepository);

  Future excute(
      {required TextEditingController emailControllerSign,
      required TextEditingController passwordControllerSign}) async {
    return baseRepository.signIn(
        emailControllerSign: emailControllerSign,
        passwordControllerSign: passwordControllerSign);
  }
}
