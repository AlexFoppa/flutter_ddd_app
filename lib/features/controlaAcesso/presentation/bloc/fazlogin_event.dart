import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


@immutable

abstract class FazloginEvent extends Equatable {
   FazloginEvent([List props = const <dynamic>[]]): super(props);
}


class  LeDadosParaLogin extends FazloginEvent{
  final String email;
  final String password;
   
LeDadosParaLogin(
  this.email, 
  this.password, 
):super([
        email,
        password,
  ]);  
}