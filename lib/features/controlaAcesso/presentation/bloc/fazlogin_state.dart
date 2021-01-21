
import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class FazloginState extends Equatable {
  FazloginState([List props = const <dynamic>[]]):super(props);
}

  
class Empty extends FazloginState {}

class Checking extends FazloginState {
}

class Checked extends FazloginState {
  final Usuario usuario;

  Checked({@required this.usuario}): super([usuario]);
}

class Error extends FazloginState {
  final String message;
  
  Error({@required this.message}): super([message]);
}