import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/core/usecases/usecase.dart';
import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';
import 'package:bestruck/features/controlaAcesso/domain/repositories/usuarioRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class FazLogin implements UseCase<Usuario, Params> {
  final UsuarioRepository repository;

  FazLogin(this.repository);

@override
  Future<Either<Failure, Usuario>> call(Params params) async {
        return await repository.fazLogin(
    params.email,
    params.password
          );
  }
}
class Params extends Equatable {
  final String email;
  final String password;

  Params({
    @required this.email,
    @required this.password,
          }) : super([ 
            email,
            password,
            ]);
}

