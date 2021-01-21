import 'package:bestruck/features/cadastroMotorista/domain/entities/motorista.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CadastraMotoristaState extends Equatable{
  CadastraMotoristaState([List props = const <dynamic>[]]):super(props);
}
  
class Empty extends CadastraMotoristaState {}

class Loading extends CadastraMotoristaState {
}

class Loaded extends CadastraMotoristaState {
  final Motorista motorista;

  Loaded({@required this.motorista}): super([motorista]);
}

class Error extends CadastraMotoristaState {
  final String message;

  Error({@required this.message}): super([message]);
}