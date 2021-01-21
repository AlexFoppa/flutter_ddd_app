import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/features/cadastroMotorista/domain/entities/motorista.dart';
import 'package:bestruck/features/cadastroMotorista/domain/usecases/cadastraMotorista.dart';
import 'package:bestruck/features/cadastroMotorista/presentation/bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCadastraMotorista extends Mock 
  implements CadastraMotorista{}


void main() {
  CadastraMotoristaBloc bloc;
  MockCadastraMotorista mockCadastraMotorista;


  setUp((){
    mockCadastraMotorista = MockCadastraMotorista();


  bloc = CadastraMotoristaBloc (
    cadastraMotorista: mockCadastraMotorista,
     );
  });

  test('Estado inicial deve ser vazio',
  (){ 
    expect(bloc.initialState,equals(Empty()));
  });
  group('Cadastra Motorista', (){
  
  final tNome = 'João da Silva'; 
  final tTelefone = '5199997777'; 
  final tCnh = '97312674628'; 
  final tCpf = '203.080.440-10';
  final tEndereco = 'endereço completo';
  final tEmail = 'teste@teste.com';
  final tTipoDeCaminhao = 'normal';
  final tAno = '2012';
  final tImplemento = 'sim';
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
  

  test('Deve emitir [Loading, Error] quando não conseguir contato com o servidor',
  ()async{ 
   //arrange
   when(mockCadastraMotorista(any))
   .thenAnswer((_) async => Left(ServerFailure()));

   //assertLater
       final expected = [
       Empty(),
       Loading(),
       Error(message: SERVER_FAILURE_MESSAGE),
     ];

   expectLater(bloc.state, emitsInOrder(expected));

   //act

    bloc.dispatch(LeDadosDeCadastroDoMotorista( 
        tNome, 
        tTelefone,
        tCnh,
        tCpf,
        tEndereco,
        tEmail,
        tTipoDeCaminhao,
        tAno,
        tImplemento,
        tSenha));
  });

   
 test('Deve buscar dados para cadastrar o motorista',
  () async { 
   //arrange
   when(mockCadastraMotorista(any))
   .thenAnswer((_) async => Right(tMotorista));

   //act
  bloc.dispatch(LeDadosDeCadastroDoMotorista( 
        tNome, 
        tTelefone,
        tCnh,
        tCpf,
        tEndereco,
        tEmail,
        tTipoDeCaminhao,
        tAno,
        tImplemento,
        tSenha));
  await untilCalled(mockCadastraMotorista(any));
  //assert
  verify(mockCadastraMotorista(Params(
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
  )));

  });
  
test(
  'Deve emitir [Loading, Loaded] quando os dados são buscados com sucesso', 
  () async {
   //arrange
   when(mockCadastraMotorista(any))
   .thenAnswer((_) async => Right(tMotorista));

  //asser later
  final expected = [
    Empty(),
    Loading(),
    Loaded(motorista: tMotorista),
  ];
    expectLater(bloc.state, emitsInOrder(expected));
   //act
   bloc.dispatch(LeDadosDeCadastroDoMotorista( 
        tNome, 
        tTelefone,
        tCnh,
        tCpf,
        tEndereco,
        tEmail,
        tTipoDeCaminhao,
        tAno,
        tImplemento,
        tSenha));
  });
  });
}