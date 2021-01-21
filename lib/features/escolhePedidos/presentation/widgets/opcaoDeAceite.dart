import 'package:bestruck/features/escolhePedidos/presentation/bloc/aceitapedido_bloc.dart';
import 'package:bestruck/features/escolhePedidos/presentation/bloc/bloc.dart';
import 'package:bestruck/features/escolhePedidos/presentation/pages/pedidoAceito_page.dart';
import 'package:bestruck/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpcaoDeAceite extends StatefulWidget {
  final String pedido;

  const OpcaoDeAceite({this.pedido});
  @override
  _OpcaoDeAceiteState createState() => _OpcaoDeAceiteState();
}

class _OpcaoDeAceiteState extends State<OpcaoDeAceite> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: buildBody(context),
    ));
  }

  BlocProvider<AceitapedidoBloc> buildBody(BuildContext context) {
    return BlocProvider(
        builder: (_) => sl<AceitapedidoBloc>(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Spacer(flex: 1),
                    RaisedButton(
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancelar'),
                    ),
                    Spacer(flex: 1),
                    RaisedButton(
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      onPressed: () {
                        aceitaPedido();
                      },
                      child: Text('Aceitar'),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void aceitaPedido() {
    BlocProvider.of<AceitapedidoBloc>(context).dispatch(
      RecebeAceiteDoMotorista(widget.pedido),
    );
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PedidoAceitoPage()));
  }
}
