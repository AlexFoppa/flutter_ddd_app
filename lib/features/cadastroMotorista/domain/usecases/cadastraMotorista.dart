
import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/core/usecases/usecase.dart';
import 'package:bestruck/features/cadastroMotorista/domain/entities/motorista.dart';
import 'package:bestruck/features/cadastroMotorista/domain/repositories/MotoristaRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CadastraMotorista implements UseCase<Motorista, Params> {
  final MotoristaRepository repository;

  CadastraMotorista(this.repository);

@override
  Future<Either<Failure, Motorista>> call(Params params) async {
        return await repository.cadastraMotorista(
    params.nome,
    params.telefone,
    params.cnh,
    params.cpf,
    params.endereco,
    params.email,
    params.tipoDeCaminhao,
    params.ano,
    params.implemento,
    params.status,
    params.senha,
          );
  }
}
class Params extends Equatable {
  final String nome;
  final String telefone;
  final String cnh;
  final String cpf;
  final String endereco;
  final String email;
  final String tipoDeCaminhao;
  final String ano;
  final String implemento;
  final String status = 'Aguardando aprovação';
  final String senha;

  Params({
    @required this.nome,
    @required this.telefone,
    @required this.cnh,
    @required this.cpf,
    @required this.endereco,
    @required this.email,
    @required this.tipoDeCaminhao,
    @required this.ano,
    @required this.implemento,
    String status,
    @required this.senha
    }) : super([
            nome,
            telefone,
            cnh,
            cpf,
            endereco, 
            email,
            tipoDeCaminhao,
            ano,
            implemento,
            status,
            senha
            ]);
}

