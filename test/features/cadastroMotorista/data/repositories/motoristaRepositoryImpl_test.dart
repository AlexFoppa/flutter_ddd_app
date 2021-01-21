import 'package:bestruck/core/error/exceptions.dart';
import 'package:bestruck/core/error/failures.dart';
import 'package:bestruck/core/network/network_info.dart';
import 'package:bestruck/features/cadastroMotorista/data/datasources/motoristaFirebase.dart';
import 'package:bestruck/features/cadastroMotorista/data/models/motoristaModel.dart';
import 'package:bestruck/features/cadastroMotorista/data/repositories/motoristaRepositoryImpl.dart';
import 'package:bestruck/features/cadastroMotorista/domain/entities/motorista.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock
    implements MotoristaFirebaseDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MotoristaRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = MotoristaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  
  group('cadastraMotorista', () {
    final tNome = 'João da Silva'; 
    final tTelefone = '5199997777'; 
    final tCnh = '97312674628'; 
    final tCpf = '203.080.440-10';
    final tEndereco = 'endereço completo';
    final tEmail = 'teste@teste.com';
    final tTipoDeCaminhao = 'normal';
    final tAno = '2012';
    final tImplemento = 'sim';
    final tStatus = 'Aguardando aprovação';
    final tSenha = '1234abc';
    
    final tMotoristaModel = MotoristaModel(
        nome: tNome, 
        telefone: tTelefone,
        cnh: tCnh,
        cpf: tCpf,
        endereco: tEndereco,
        email: tEmail,
        tipoDeCaminhao: tTipoDeCaminhao,
        ano: tAno,
        implemento: tImplemento, 
        status: tStatus,
    );
    final Motorista tMotorista = tMotoristaModel;

    test(
      'deve checar se o dispositivo está online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.cadastraMotorista(
          tNome, tTelefone, tCnh, tCpf, tEndereco, tEmail, tTipoDeCaminhao, tAno, tImplemento, tStatus,tSenha
        );
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    test(
        'deve receber dados de base remota quando a call for bem sucedida',
        () async {
          // arrange
          when(mockRemoteDataSource.cadastraMotorista(any, any, any, any, any, any, any, any, any, any,any))
           .thenAnswer((_) async => tMotoristaModel);
           // act
          final result = await repository.cadastraMotorista(            
            tNome, tTelefone, tCnh, tCpf, tEndereco, tEmail, tTipoDeCaminhao, tAno, tImplemento, tStatus, tSenha
            );
          // assert
          verify(mockRemoteDataSource.cadastraMotorista(tNome, tTelefone, tCnh, tCpf, tEndereco, tEmail, tTipoDeCaminhao, tAno, tImplemento, tStatus,tSenha));
          expect(result, equals(Right(tMotorista)));
        },
      );
    test(
        'deve retonar falha de servidor quando a call for mal sucedida',
        () async {
          // arrange
          when(mockRemoteDataSource.cadastraMotorista(any, any, any, any, any, any, any, any, any, any,any))
           .thenThrow(ServerException());
           // act
          final result = await repository.cadastraMotorista(            
            tNome, tTelefone, tCnh, tCpf, tEndereco, tEmail, tTipoDeCaminhao, tAno, tImplemento, tStatus,tSenha
            );
          // assert
          verify(mockRemoteDataSource.cadastraMotorista(tNome, tTelefone, tCnh, tCpf, tEndereco, tEmail, tTipoDeCaminhao, tAno, tImplemento, tStatus, tSenha));
          expect(result, equals(Left(ServerFailure())));
        },
      );
    
  });
}


