import 'dart:async';

import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/features/escolhePedidos/domain/entities/pedidos.dart';
import 'package:bestruck/features/escolhePedidos/domain/usecases/aceitaPedido.dart';
import 'package:bestruck/features/escolhePedidos/presentation/bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';



const String SERVER_FAILURE_MESSAGE =
    'Não foi possível acessar o servidor neste momento. Tente mais tarde.';

const String ACEITE_FAILURE_MESSAGE =
    'Não foi possível aceitar o pedido neste momento. Reinicie o aplicativo e  tente mais tarde.';


class AceitapedidoBloc extends Bloc<AceitapedidoEvent, AceitapedidoState> {
  final AceitaPedido aceitaPedido;

  AceitapedidoBloc({@required this.aceitaPedido})
      : assert(aceitaPedido != null);

  @override
  AceitapedidoState get initialState => Empty();

  @override
  Stream<AceitapedidoState> mapEventToState(
    AceitapedidoEvent event,
  ) async* {
    if (event is RecebeAceiteDoMotorista) {
      yield Loading();

      final aceitaOuFalha = await aceitaPedido(Params(pedido: event.pedido));
      yield* _eitherAceitaOuFalhaState(aceitaOuFalha);
    }
  }

  Stream<AceitapedidoState> _eitherAceitaOuFalhaState(
    Either<Failure, Pedido> aceitaOuFalha,
  ) async* {
    yield aceitaOuFalha.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (pedido) => Loaded(pedido: pedido),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case AceiteFailure:
        return ACEITE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
