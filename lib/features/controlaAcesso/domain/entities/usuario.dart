import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Usuario extends Equatable{
  final String email;
  final String password;
  final String uid;

Usuario({
  @required this.email,
  @required this.password,
  this.uid
}) : super ([
  email,
  password,
  uid
]);

}