part of 'lawyerd_bloc.dart';

@immutable
abstract class LawyerdState {}

class LawyerdInitial extends LawyerdState {}

class Loading extends LawyerdState {}

class Success extends LawyerdState {}

class Failure extends LawyerdState {}
