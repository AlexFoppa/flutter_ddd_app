import 'package:bestruck/core/error/exceptions.dart';
import 'package:bestruck/features/cadastroMotorista/data/datasources/motoristaFirebase.dart';
import 'package:bestruck/features/cadastroMotorista/data/models/motoristaModel.dart';
import 'package:bestruck/features/escolhePedidos/domain/entities/pedidos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class PedidoFirebaseDataSource {
  Future<Pedido> aceitaPedido(
    String pedido,
  );
}

class PedidoFirebaseDataSourceImpl implements PedidoFirebaseDataSource {
  String pedidoUid;
  String motoristaUid;
  String motoristaNome;

  final CollectionReference motoristas =
      Firestore.instance.collection('Motorista');
  final CollectionReference pedidos = Firestore.instance.collection('Pedido');

  @override
  Future<Pedido> aceitaPedido(String pedido) async {
    try {
      pedidoUid = pedido;

      final FirebaseAuth _auth = FirebaseAuth.instance;
      final FirebaseUser user = await _auth.currentUser();

      motoristaUid = user.uid;

      Stream<UserData> motorista =
          MotoristaFirebaseDataSourceImpl(uid: motoristaUid).mostraPerfil;
      await motorista.take(1).forEach((element) {
        motoristaNome = element.nome;
      });

      print('Pedido: $pedidoUid');
      print('MotoristaUID: $motoristaUid');
      print('Pedido 1: $motoristaNome');
      


        await pedidos.document(pedidoUid).updateData({
        "MotoristaNome":motoristaNome,
        "MotoristaUid": motoristaUid,
        "Status": 'Motorista escolhido - aguardando momento da coleta',
        },);

      return null;
    } catch (e) {
      print(e.toString());
      throw AceitaPedidoException();
    }
  }
}
