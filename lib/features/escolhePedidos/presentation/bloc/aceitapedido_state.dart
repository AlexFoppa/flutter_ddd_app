

import 'package:bestruck/features/escolhePedidos/domain/entities/pedidos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AceitapedidoState extends Equatable {
  AceitapedidoState([List props = const <dynamic>[]]):super(props);
}

  
class Empty extends AceitapedidoState {}

class Loading extends AceitapedidoState {
}

class Loaded extends AceitapedidoState {
  final Pedido pedido;

  Loaded({@required this.pedido}): super([pedido]);
}

class Error extends AceitapedidoState {
  final String message;

  Error({@required this.message}): super([message]);
}