
import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/features/escolhePedidos/domain/entities/pedidos.dart';
import 'package:dartz/dartz.dart';

abstract class PedidoRepository {
  Future<Either<Failure, Pedido>> aceitaPedido(
    String pedido,
  );
}