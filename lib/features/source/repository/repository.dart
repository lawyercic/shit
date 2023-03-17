import 'package:flutter/cupertino.dart';
import 'package:lawer/features/domain/repository/base_repository.dart';
import 'package:lawer/features/source/remoteDataSource/remote_data_source.dart';

class Repository implements BaseRepository {
  BaseRemoteDataSource baseRemoteDataSource;

  Repository(this.baseRemoteDataSource);

  @override
  Future logIn(
      {required TextEditingController emailControllerLogin,
      required TextEditingController passwordControllerLogin}) async {
    return await baseRemoteDataSource.logIn(
        emailControllerLogin: emailControllerLogin,
        passwordControllerLogin: passwordControllerLogin);
  }

  @override
  Future signIn(
      {required TextEditingController emailControllerSign,
      required TextEditingController passwordControllerSign}) async {
    return await baseRemoteDataSource.signIn(
        emailControllerSign: emailControllerSign,
        passwordControllerSign: passwordControllerSign);
  }
}
