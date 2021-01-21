import 'dart:async';
import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/features/cadastroMotorista/domain/entities/motorista.dart';
import 'package:bestruck/features/cadastroMotorista/domain/usecases/cadastraMotorista.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';

const String SERVER_FAILURE_MESSAGE =
    'Não foi possível acessar o servidor neste momento. Tente mais tarde.';
const String CREATE_USER_FAILURE_MESSAGE = 'O e-mail informado não é válido';

class CadastraMotoristaBloc
    extends Bloc<CadastraMotoristaEvent, CadastraMotoristaState> {
  final CadastraMotorista cadastraMotorista;

  CadastraMotoristaBloc({@required this.cadastraMotorista})
      : assert(cadastraMotorista != null);

  @override
  CadastraMotoristaState get initialState => Empty();

  @override
  Stream<CadastraMotoristaState> mapEventToState(
    CadastraMotoristaEvent event,
  ) async* {
    if (event is LeDadosDeCadastroDoMotorista) {
      yield Loading();

      final cadastraOuFalha = await cadastraMotorista(Params(
        nome: event.nome,
        telefone: event.telefone,
        cnh: event.cnh,
        cpf: event.cpf,
        endereco: event.endereco,
        email: event.email,
        tipoDeCaminhao: event.tipoDeCaminhao,
        ano: event.ano,
        implemento: event.implemento,
        senha: event.senha,
      ));
      yield* _eitherCadastraOuFalhaState(cadastraOuFalha);
    }
  }

  Stream<CadastraMotoristaState> _eitherCadastraOuFalhaState(
    Either<Failure, Motorista> cadastraOuFalha,
  ) async* {
    yield cadastraOuFalha.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (motorista) => Loaded(motorista: motorista),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CreateUserFailure:
        return CREATE_USER_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
