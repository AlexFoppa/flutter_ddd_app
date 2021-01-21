
import 'package:bestruck/features/cadastroMotorista/domain/entities/motorista.dart';
import 'package:bestruck/features/cadastroMotorista/domain/repositories/MotoristaRepository.dart';
import 'package:bestruck/features/cadastroMotorista/domain/usecases/cadastraMotorista.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockMotoristaRepository extends Mock
  implements MotoristaRepository {}

  void main (){
    CadastraMotorista usecase;
    MockMotoristaRepository mockMotoristaRepository; 

  setUp(() {
    mockMotoristaRepository = MockMotoristaRepository();
    usecase = CadastraMotorista(mockMotoristaRepository);
  });


  final tNome = 'João da Silva'; 
  final tTelefone = '5199997777'; 
  final tCnh = '97312674628'; 
  final tCpf = '203.080.440-10';
  final tEndereco = 'endereço completo';
  final tEmail = 'teste@teste.com';
  final tTipoDeCaminhao = 'normal';
  final tAno = '2012';
  final tImplemento = 'sim';
  final tStatusFinal = 'Aguardando aprovação';
  final tSenha = '1234abc';

  final tMotorista = Motorista(
  
  nome: 'João da Silva', 
  telefone: '5199997777', 
  cnh: '97312674628', 
  cpf:  '203.080.440-10',
  endereco:  'endereço completo',
  email:  'teste@teste.com',
  tipoDeCaminhao:  'normal',
  ano: '2012',
  implemento: 'sim',

  );

  test(
    'deve enviar dados ao repositório atualizando o status', 
    () async {
      //arrange
      when(mockMotoristaRepository.cadastraMotorista(any,any,any,any,any,any,any,any,any,any,any))
      .thenAnswer((_) async => Right(tMotorista));
      //act
      final result = await usecase(Params(       
        nome: tNome, 
        telefone: tTelefone,
        cnh: tCnh,
        cpf: tCpf,
        endereco: tEndereco,
        email: tEmail,
        tipoDeCaminhao: tTipoDeCaminhao,
        ano: tAno,
        implemento: tImplemento,
        senha: tSenha
      ));
      //assert
      expect(result, Right(tMotorista));
      verify(mockMotoristaRepository.cadastraMotorista(
        tNome, 
        tTelefone,
        tCnh,
        tCpf,
        tEndereco,
        tEmail,
        tTipoDeCaminhao,
        tAno,
        tImplemento,
        tStatusFinal,
        tSenha
        ));
      verifyNoMoreInteractions(mockMotoristaRepository);

    }
  );
}