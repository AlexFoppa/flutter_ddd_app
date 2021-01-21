
import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';
import 'package:bestruck/features/controlaAcesso/domain/repositories/usuarioRepository.dart';
import 'package:bestruck/features/controlaAcesso/domain/usecases/fazLogin.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUsuarioRepository extends Mock
  implements UsuarioRepository {}

  void main (){
    FazLogin usecase;
    MockUsuarioRepository mockUsuarioRepository; 

  setUp(() {
    mockUsuarioRepository = MockUsuarioRepository();
    usecase = FazLogin(mockUsuarioRepository);
  });



  final tEmail = 'teste@teste.com';
  final tPassword = '1234';
 
  final tUsuario = Usuario(
  
  email:  'teste@teste.com',
  password: '1234',
  );

  test(
    'deve enviar dados ao repositório', 
    () async {
      //arrange
      when(mockUsuarioRepository.fazLogin(any,any))
      .thenAnswer((_) async => Right(tUsuario));
      //act
      final result = await usecase(Params(       
        email: tEmail,
        password: tPassword
        ));
      //assert
      expect(result, Right(tUsuario));
      verify(mockUsuarioRepository.fazLogin(
        tEmail,
        tPassword
        ));
      verifyNoMoreInteractions(mockUsuarioRepository);

    }
  );
}