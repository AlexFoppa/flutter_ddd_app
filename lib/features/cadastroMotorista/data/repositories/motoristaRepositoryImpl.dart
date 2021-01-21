
import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/core/error/exceptions.dart';
import 'package:bestruck/core/network/network_info.dart';
import 'package:bestruck/features/cadastroMotorista/data/datasources/motoristaFirebase.dart';
import 'package:bestruck/features/cadastroMotorista/domain/entities/motorista.dart';
import 'package:bestruck/features/cadastroMotorista/domain/repositories/MotoristaRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';


class MotoristaRepositoryImpl implements MotoristaRepository{
  final MotoristaFirebaseDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MotoristaRepositoryImpl({
    @required this.remoteDataSource, 
    @required this.networkInfo});

  @override
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
  )async{
     networkInfo.isConnected;
     try{
     final motorista = await remoteDataSource.cadastraMotorista(
        nome, telefone, cnh, cpf, endereco, email, tipoDeCaminhao, ano, implemento, status, senha
        );
      return Right(motorista);
     } on ServerException {
       return Left(ServerFailure());
     }on CreateUserException{
       return Left(CreateUserFailure());
     }


    }
    



}
