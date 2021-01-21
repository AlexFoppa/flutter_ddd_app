
import 'package:bestruck/features/cadastroMotorista/data/models/motoristaModel.dart';
import 'package:bestruck/features/cadastroMotorista/domain/entities/motorista.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  final tMotoristaModel = MotoristaModel(
  nome: 'João da Silva', 
  telefone: '5199997777', 
  cnh: '97312674628', 
  cpf:  '203.080.440-10',
  endereco:  'endereço completo',
  email:  'teste@teste.com',
  tipoDeCaminhao:  'normal',
  ano: '2012',
  implemento: 'sim',
  status: 'Aguardando aprovação'
  );
  
  test(
    'deve ser uma subclasse da entidade Motorista', 
    () async {
      expect(tMotoristaModel, isA<Motorista>());
    }
    );
}