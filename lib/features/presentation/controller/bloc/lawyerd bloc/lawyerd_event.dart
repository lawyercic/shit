part of 'lawyerd_bloc.dart';

@immutable
abstract class LawyerdEvent {}

class SignInEvent extends LawyerdEvent {}

class LogInEvent extends LawyerdEvent {}
