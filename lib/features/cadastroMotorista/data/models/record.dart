import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
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
  String uid;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['Nome'] != null),
        assert(map['Telefone'] != null),
        assert(map['Email'] != null),
        assert(map['Cnh'] != null),
        assert(map['Cpf'] != null),
        assert(map['Endereco'] != null),
        assert(map['TipoDeCaminhao'] != null),
        assert(map['Ano'] != null),
        assert(map['Implemento'] != null),
        assert(map['Status'] != null),
        nome = map['Nome'],
        telefone = map['Telefone'],
        email = map['Email'],
        cnh = map['Cnh'],
        cpf = map['Cpf'],
        endereco = map['Endereco'],
        tipoDeCaminhao = map['TipoDeCaminhao'],
        ano = map['Ano'],
        implemento = map['Implemento'],
        status = map['Status'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$nome>";
}
