
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CadastraMotoristaEvent extends Equatable {
   CadastraMotoristaEvent([List props = const <dynamic>[]]): super(props);
}

   class LeDadosDeCadastroDoMotorista extends CadastraMotoristaEvent{
    final String nome;
    final String telefone;
    final String cnh;
    final String cpf;
    final String endereco;
    final String email;
    final String tipoDeCaminhao;
    final String ano;
    final String implemento;
    final String senha;


LeDadosDeCadastroDoMotorista(
  this.nome, 
  this.telefone, 
  this.cnh, 
  this.cpf, 
  this.endereco, 
  this.email, 
  this.tipoDeCaminhao, 
  this.ano,
  this.implemento,
  this.senha
  ):super([
        nome, 
        telefone,
        cnh,
        cpf,
        endereco,
        email,
        tipoDeCaminhao,
        ano,
        implemento,
        senha
  ]);
   }

