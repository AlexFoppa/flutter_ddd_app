
import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';
import 'package:meta/meta.dart';

class UsuarioModel extends Usuario {
  UsuarioModel({
    
    @required String email,
    @required String password,
  }) : super(
        email: email,
        password: password,
            );

    factory UsuarioModel.fromJson(Map<String, dynamic> json){
        return UsuarioModel(
        email: json['email'],
        password: json['password']
        );
    }

    Map<String,dynamic> toJson(){
      return {
       'email':email,
       'password':password,
    };
    }
  }