
import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/features/cadastroMotorista/domain/entities/motorista.dart';
import 'package:dartz/dartz.dart';

abstract class MotoristaRepository {
  Future<Either<Failure, Motorista>> cadastraMotorista(
    String nome,
    String telefone,
    String cnh,
    String cpf,
    String endereco,
    String email,
    String tipoDeCaminhao,
    String ano,
    String implemento,
    String status,
    String senha
  );

  
  
}