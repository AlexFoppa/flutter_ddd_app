
import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';
import 'package:bestruck/features/controlaAcesso/domain/usecases/fazLogin.dart';
import 'package:bestruck/features/controlaAcesso/presentation/bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFazLogin extends Mock 
  implements FazLogin{}


void main() {
  FazloginBloc bloc;
  MockFazLogin mockFazLogin;


  setUp((){
    mockFazLogin = MockFazLogin();


  bloc = FazloginBloc (
    fazLogin: mockFazLogin,
     );
  });

  test('Estado inicial deve ser vazio',
  (){ 
    expect(bloc.initialState,equals(Empty()));
  });
  group('Cadastra Motorista', (){

  final tEmail = 'teste@teste.com';
  final tPassword = '1234';

  final tUsuario = Usuario(
  email:  'teste@teste.com',
  password:  '1234',
  );  
  

  test('Deve emitir [Loading, Error] quando não conseguir contato com o servidor',
  ()async{ 
   //arrange
   when(mockFazLogin(any))
   .thenAnswer((_) async => Left(ServerFailure()));

   //assertLater
       final expected = [
       Empty(),
       Checking(),
       Error(message: SERVER_FAILURE_MESSAGE),
     ];

   expectLater(bloc.state, emitsInOrder(expected));

   //act

    bloc.dispatch(LeDadosParaLogin( 
      tEmail,
      tPassword
,));
  });

   
 test('Deve buscar dados para validar o cadastro',
  () async { 
   //arrange
   when(mockFazLogin(any))
   .thenAnswer((_) async => Right(tUsuario));

   //act
  bloc.dispatch(LeDadosParaLogin( 
        tEmail,
        tPassword,
        ));
  await untilCalled(mockFazLogin(any));
  //assert
  verify(mockFazLogin(Params(
        email: tEmail,
        password: tPassword
  )));

  });
  
test(
  'Deve emitir [Checking, Checked] quando os dados são buscados com sucesso', 
  () async {
   //arrange
   when(mockFazLogin(any))
   .thenAnswer((_) async => Right(tUsuario));

  //asser later
  final expected = [
    Empty(),
    Checking(),
    Checked(usuario: tUsuario),
  ];
    expectLater(bloc.state, emitsInOrder(expected));
   //act
   bloc.dispatch(LeDadosParaLogin( 
        tEmail,
        tPassword,));
  });
  });
}