import 'dart:async';
import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';
import 'package:bestruck/features/controlaAcesso/domain/usecases/fazLogin.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Não conseguimos validar suas credenciais agora. Tente mais tarde.';
const String LOGIN_FAILURE_MESSAGE = 'Usuário ou senha inválida';

class FazloginBloc extends Bloc<FazloginEvent, FazloginState> {
  final FazLogin fazLogin;

  FazloginBloc({@required this.fazLogin}):assert(fazLogin != null);
  
  @override
  FazloginState get initialState => Empty();

  @override
  Stream<FazloginState> mapEventToState(
    FazloginEvent event,
  ) async* {
    if(event is LeDadosParaLogin){
       yield Checking();
       
       final cadastraOuFalha = await fazLogin(Params(
          email: event.email,
          password: event.password,
        ));
        yield* _eitherCadastraOuFalhaState(cadastraOuFalha);
    }
  }
  Stream<FazloginState> _eitherCadastraOuFalhaState(
    Either<Failure, Usuario> cadastraOuFalha,
  ) async* {
    yield cadastraOuFalha.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (usuario) => Checked(usuario: usuario),
    );
  }
      String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case LoginFailure:
        return LOGIN_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }

  }
