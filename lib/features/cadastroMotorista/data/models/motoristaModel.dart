import 'package:bestruck/features/cadastroMotorista/domain/entities/motorista.dart';
import 'package:meta/meta.dart';

class MotoristaModel extends Motorista {

  
  MotoristaModel({
    
    @required String nome,
    @required String telefone,
    @required String cnh,
    @required String cpf,
    @required String endereco,
    @required String email,
    @required String tipoDeCaminhao,
    @required String ano,
    @required String implemento,
    @required String status,
     String uid,
  }) : super(
        nome: nome, 
        telefone: telefone,
        cnh: cnh,
        cpf: cpf,
        endereco: endereco,
        email: email,
        tipoDeCaminhao: tipoDeCaminhao,
        ano: ano,
        implemento: implemento,
        status: status,
        uid:uid
            );

  }

  class UserData {

  final String uid;
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

  UserData({this.nome, this.telefone, this.cnh, this.cpf, this.endereco, this.email, this.tipoDeCaminhao, this.ano, this.implemento, this.status, this.uid,});

}