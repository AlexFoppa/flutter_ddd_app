
import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';
import 'package:dartz/dartz.dart';

abstract class UsuarioRepository {
  Future<Either<Failure, Usuario>> fazLogin(
    String email,
    String password
  );
}