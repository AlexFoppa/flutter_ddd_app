
import 'package:bestruck/core/util/message_display.dart';
import 'package:bestruck/features/controlaAcesso/data/datasources/usuarioFirebase.dart';
import 'package:bestruck/features/escolhePedidos/data/models/pedidoModel.dart';
import 'package:bestruck/features/escolhePedidos/presentation/bloc/bloc.dart';
import 'package:bestruck/features/escolhePedidos/presentation/widgets/detalhesDoPedido.dart';
import 'package:bestruck/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetalhesDoPedidoPage extends StatelessWidget {
  final PedidoModel data;
   final UsuarioFirebaseDataSourceImpl _auth = UsuarioFirebaseDataSourceImpl();

  DetalhesDoPedidoPage({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalhes do pedido'),
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
          child: buildBody(context), 
        ));
  }

  BlocProvider<AceitapedidoBloc> buildBody(BuildContext context) {
    return BlocProvider(
        builder: (_) => sl<AceitapedidoBloc>(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DetalhesDoPedido(data: data),
              BlocBuilder<AceitapedidoBloc, AceitapedidoState>(
                builder: (context, state) {
                  if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  } else if (state is Loaded) {
                    return MessageDisplay(
                      message: 'Pedido Aceito',
                    );
                  } else {
                    return MessageDisplay(
                      message: '',
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }

}
