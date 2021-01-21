

import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/core/error/exceptions.dart';
import 'package:bestruck/core/network/network_info.dart';
import 'package:bestruck/features/controlaAcesso/data/datasources/usuarioFirebase.dart';
import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';
import 'package:bestruck/features/controlaAcesso/domain/repositories/usuarioRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';


class UsuarioRepositoryImpl implements UsuarioRepository{
  final UsuarioFirebaseDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UsuarioRepositoryImpl({
    @required this.remoteDataSource, 
    @required this.networkInfo});

  @override
  Future<Either<Failure, Usuario>> fazLogin(
    String email,
    String password,
  )async{
     networkInfo.isConnected;
     try{
     final usuario = await remoteDataSource.fazLogin(
         email, password
        );
      return Right(usuario);
     } on ServerException {
       return Left(ServerFailure());
     } on LoginException{
       return Left(LoginFailure());
       } on CreateUserException{
       return Left(CreateUserFailure());
       }

    }

  }
    