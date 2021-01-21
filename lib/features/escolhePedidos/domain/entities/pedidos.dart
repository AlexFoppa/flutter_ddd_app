import 'package:equatable/equatable.dart';

class Pedido extends Equatable {
  final String dataHoraSaida;
  final String destino;
  final String especificacoes;
  final String implemento;
  final String origem;
  final String peso;
  final String produto;
  final String status;
  final String tipoDeCaminhao;
  final String empresa;
  final String motoristaUid;
  final String motoristaNome;

  Pedido({
    this.dataHoraSaida, 
    this.destino, 
    this.especificacoes, 
    this.implemento, 
    this.origem, 
    this.peso, 
    this.produto, 
    this.status, 
    this.tipoDeCaminhao,
    this.empresa,
    this.motoristaUid,
    this.motoristaNome 
  }) : super([
      dataHoraSaida, 
      destino, 
      especificacoes, 
      implemento, 
      origem, 
      peso, 
      produto, 
      status, 
      tipoDeCaminhao,
      empresa,
      motoristaUid,
      motoristaNome 
            ]);
  }
  