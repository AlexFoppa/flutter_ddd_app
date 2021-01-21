import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/core/usecases/usecase.dart';
import 'package:bestruck/features/escolhePedidos/domain/entities/pedidos.dart';
import 'package:bestruck/features/escolhePedidos/domain/repositories/pedidoRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AceitaPedido implements UseCase<Pedido, Params> {
  final PedidoRepository repository;

  AceitaPedido(this.repository);

@override
  Future<Either<Failure, Pedido>> call(Params params) async {
        return await repository.aceitaPedido(
    params.pedido,
          );
  }
}
class Params extends Equatable {
  final String pedido;


  Params({
    @required this.pedido,
          }) : super([ 
            pedido,
            ]);
}

