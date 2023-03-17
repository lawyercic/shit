import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../domain/usecases/login_usecase.dart';
import '../../../../domain/usecases/signin_usecase.dart';

part 'lawyerd_event.dart';

part 'lawyerd_state.dart';

class LawyerdBloc extends Bloc<LawyerdEvent, LawyerdState> {
  final emailControllerLogin = TextEditingController();
  final passwordControllerLogin = TextEditingController();
  final emailControllerSign = TextEditingController();
  final passwordControllerSign = TextEditingController();
  final confirmPasswordControllerSign = TextEditingController();
  LogIn logIn;
  SignIn signIn;

  LawyerdBloc(this.logIn, this.signIn) : super(LawyerdInitial()) {
    on<LawyerdEvent>((event, emit) async {
      if (event is LogInEvent) {
        emit(Loading());
        try {
          await logIn.excute(
              emailControllerLogin: emailControllerLogin,
              passwordControllerLogin: passwordControllerLogin);
          emit(Success());
        } catch (e) {
          emit(Failure());
        }
      }
      if (event is SignInEvent) {
        emit(Loading());
        try {
          await signIn.excute(
              emailControllerSign: emailControllerSign,
              passwordControllerSign: passwordControllerSign);
          emit(Success());
        } catch (e) {
          emit(Failure());
        }
      }
    });
  }
}
