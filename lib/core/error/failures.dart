import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  Failure([List properties = const <dynamic>[]]) : super(properties);
}

class ServerFailure extends Failure {}

class LoginFailure extends Failure {}

class CreateUserFailure extends Failure {}

class AceiteFailure extends Failure {}