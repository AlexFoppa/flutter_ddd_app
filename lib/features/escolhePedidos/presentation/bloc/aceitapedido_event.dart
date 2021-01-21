

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable

abstract class AceitapedidoEvent extends Equatable {
  AceitapedidoEvent([List props = const <dynamic>[]]): super(props);
}

class RecebeAceiteDoMotorista extends AceitapedidoEvent{
    final String pedido;

  RecebeAceiteDoMotorista(this.pedido):super([pedido]);
}
