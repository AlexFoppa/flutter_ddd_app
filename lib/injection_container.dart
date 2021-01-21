import 'package:bestruck/features/cadastroMotorista/data/datasources/motoristaFirebase.dart';
import 'package:bestruck/features/cadastroMotorista/data/repositories/motoristaRepositoryImpl.dart';
import 'package:bestruck/features/cadastroMotorista/domain/repositories/MotoristaRepository.dart';
import 'package:bestruck/features/cadastroMotorista/domain/usecases/cadastraMotorista.dart';
import 'package:bestruck/features/cadastroMotorista/presentation/bloc/bloc.dart';
import 'package:bestruck/features/controlaAcesso/data/datasources/usuarioFirebase.dart';
import 'package:bestruck/features/controlaAcesso/data/repositories/usuarioRepositoryImpl.dart';
import 'package:bestruck/features/controlaAcesso/domain/repositories/usuarioRepository.dart';
import 'package:bestruck/features/controlaAcesso/domain/usecases/fazLogin.dart';
import 'package:bestruck/features/controlaAcesso/presentation/bloc/bloc.dart';
import 'package:bestruck/features/escolhePedidos/data/datasources/pedidoFirebase.dart';
import 'package:bestruck/features/escolhePedidos/domain/repositories/pedidoRepository.dart';
import 'package:bestruck/features/escolhePedidos/domain/usecases/aceitaPedido.dart';
import 'package:bestruck/features/escolhePedidos/presentation/bloc/aceitapedido_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'core/network/network_info.dart';
import 'package:bestruck/features/escolhePedidos/data/repositories/pedidoRepositoryImpl.dart';


final sl = GetIt.instance;

void init() {
  // Features - cadastra Motorista

  sl.registerFactory(() => CadastraMotoristaBloc(cadastraMotorista: sl()));
  sl.registerLazySingleton(() => CadastraMotorista(sl()));
  sl.registerLazySingleton<MotoristaRepository>(
      () => MotoristaRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<MotoristaFirebaseDataSource>(
      () => MotoristaFirebaseDataSourceImpl());


  // Features - controla acesso

  sl.registerFactory(() => FazloginBloc(fazLogin: sl()));
  sl.registerLazySingleton(() => FazLogin(sl()));
  sl.registerLazySingleton<UsuarioRepository>(
      () => UsuarioRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<UsuarioFirebaseDataSource>(
      () => UsuarioFirebaseDataSourceImpl());

  // Features - aceitaPedido

  sl.registerFactory(() => AceitapedidoBloc(aceitaPedido: sl()));
  sl.registerLazySingleton(() => AceitaPedido(sl()));
  sl.registerLazySingleton<PedidoRepository>(
      () => PedidoRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton(
      () => PedidoFirebaseDataSourceImpl());


      
  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //External
  sl.registerLazySingleton(() => DataConnectionChecker());
}

