

import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/core/error/exceptions.dart';
import 'package:bestruck/core/network/network_info.dart';
import 'package:bestruck/features/escolhePedidos/data/datasources/pedidoFirebase.dart';
import 'package:bestruck/features/escolhePedidos/domain/entities/pedidos.dart';
import 'package:bestruck/features/escolhePedidos/domain/repositories/pedidoRepository.dart';
import 'package:bestruck/features/escolhePedidos/domain/usecases/aceitaPedido.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';


class PedidoRepositoryImpl implements PedidoRepository{
  final PedidoFirebaseDataSourceImpl remoteDataSource;
  final NetworkInfo networkInfo;

  PedidoRepositoryImpl({
    @required this.remoteDataSource, 
    @required this.networkInfo});

  @override
  Future<Either<Failure, Pedido>> aceitaPedido(
     pedido,
  )async{
     networkInfo.isConnected;
     try{
     final pedidoAceito = await remoteDataSource.aceitaPedido(
         pedido
        );
      return Right(pedidoAceito);
     } on ServerException {
       return Left(ServerFailure());
     } on AceitaPedido{
       return Left(AceiteFailure());
       } 

    }

  }
    