import 'package:bestruck/core/error/exceptions.dart';
import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/core/network/network_info.dart';
import 'package:bestruck/features/controlaAcesso/data/datasources/usuarioFirebase.dart';
import 'package:bestruck/features/controlaAcesso/data/models/usuarioModel.dart';
import 'package:bestruck/features/controlaAcesso/data/repositories/usuarioRepositoryImpl.dart';
import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock
    implements UsuarioFirebaseDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  UsuarioRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = UsuarioRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  
  group('fazLogin', () {
    final tEmail = 'teste@teste.com';
    final tPassword = '1234';
    
    final tUsuarioModel = UsuarioModel(
        email: tEmail,
        password: tPassword
    );
    final Usuario tUsuario = tUsuarioModel;

    test(
      'deve checar se o dispositivo está online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.fazLogin(
          tEmail, tPassword,
        );
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    test(
        'deve receber dados de base remota quando a call for bem sucedida',
        () async {
          // arrange
          when(mockRemoteDataSource.fazLogin(any, any))
           .thenAnswer((_) async => tUsuarioModel);
           // act
          final result = await repository.fazLogin(            
            tEmail, tPassword,
            );
          // assert
          verify(mockRemoteDataSource.fazLogin( tEmail, tPassword,));
          expect(result, equals(Right(tUsuario)));
        },
      );
    test(
        'deve retonar falha de servidor quando a call for mal sucedida',
        () async {
          // arrange
          when(mockRemoteDataSource.fazLogin(any, any))
           .thenThrow(ServerException());
           // act
          final result = await repository.fazLogin(            
              tEmail, tPassword,
            );
          // assert
          verify(mockRemoteDataSource.fazLogin( tEmail, tPassword));
          expect(result, equals(Left(ServerFailure())));
        },
      );
    
  });
}


