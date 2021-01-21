import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Motorista extends Equatable {
  final String nome;
  final String telefone;
  final String cnh;
  final String cpf;
  final String endereco;
  final String email;
  final String tipoDeCaminhao;
  final String ano;
  final String implemento;
  final String status;
  final String uid;

  Motorista({
    @required this.nome,
    @required this.telefone,
    @required this.cnh,
    @required this.cpf,
    @required this.endereco,
    @required this.email,
    @required this.tipoDeCaminhao,
    @required this.ano,
    @required this.implemento,
    this.status,
    this.uid
  }) : super([
            nome,
            telefone,
            cnh,
            cpf,
            endereco, 
            email,
            tipoDeCaminhao,
            ano,
            implemento,
            status,
            uid
            ]);
  }