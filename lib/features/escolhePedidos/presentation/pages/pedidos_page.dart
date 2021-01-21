import 'package:bestruck/features/controlaAcesso/data/datasources/usuarioFirebase.dart';
import 'package:bestruck/features/escolhePedidos/presentation/widgets/listaPedidos.dart';


import 'package:flutter/material.dart';

class PedidosPage extends StatelessWidget {
  final UsuarioFirebaseDataSourceImpl _auth = UsuarioFirebaseDataSourceImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pedidos disponíveis para mim'),
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
        body: ListaPedidos()
    );

}
}
