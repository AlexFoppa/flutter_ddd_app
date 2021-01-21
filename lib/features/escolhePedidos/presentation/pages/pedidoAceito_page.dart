
import 'package:bestruck/features/controlaAcesso/data/datasources/usuarioFirebase.dart';
import 'package:bestruck/features/escolhePedidos/data/models/pedidoModel.dart';
import 'package:bestruck/features/escolhePedidos/presentation/widgets/pedidoAceito.dart';
import 'package:flutter/material.dart';

class PedidoAceitoPage extends StatelessWidget {
  final PedidoModel data;
   final UsuarioFirebaseDataSourceImpl _auth = UsuarioFirebaseDataSourceImpl();

  PedidoAceitoPage({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pedido Aceito'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                await _auth.desloga();
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: PedidoAceito(), 
        ));
  }

}
