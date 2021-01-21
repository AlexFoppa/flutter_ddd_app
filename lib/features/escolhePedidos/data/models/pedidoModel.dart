
import 'package:bestruck/features/escolhePedidos/domain/entities/pedidos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class PedidoModel extends Pedido {
 
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
  final DocumentReference reference;

 PedidoModel.fromMap(Map<String, dynamic> map, {this.reference})
     : assert(map['DataHoraSaida'] != null),
       assert(map['Destino'] != null),
       assert(map['Especificacoes'] != null),
       assert(map['Implemento'] != null),
       assert(map['Origem'] != null),
       assert(map['Peso'] != null),
       assert(map['Produto'] != null),
       assert(map['Status'] != null),
       assert(map['TipoDeCaminhao'] != null), 
       assert(map['Empresa'] != null), 
       dataHoraSaida = map['DataHoraSaida'],
       destino = map['Destino'], 
        especificacoes = map['Especificacoes'], 
        implemento = map['Implemento'], 
        origem = map['Origem'], 
        peso = map['Peso'], 
        produto = map['Produto'], 
        status = map['Status'], 
        tipoDeCaminhao = map['TipoDeCaminhao'],
        empresa =  map['Empresa'],
        motoristaUid = map['MotoristaUid']?? '',
        motoristaNome = map['MotoristaNome']?? '';

 PedidoModel.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);

  

 @override
 String toString() => "Record<$destino>";

  }


