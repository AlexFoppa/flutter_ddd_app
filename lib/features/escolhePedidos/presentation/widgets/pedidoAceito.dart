import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PedidoAceito extends StatefulWidget {

  @override
  _PedidoAceitoState createState() => _PedidoAceitoState();
}

class _PedidoAceitoState extends State<PedidoAceito> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 30),
        ),
        Text(
          'Pedido aceito',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        SizedBox(height: 40),
        Row(children: <Widget>[
          Expanded(child: 
          Text('A empresa estará lhe esperando no ponto de coleta, e você pode consultar os dados do pedido em seu perfil',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              ),
          )
        ]),
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
                       Navigator.of(context).pushNamed('/');
                      },
                      child: Text('Voltar'),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
      ]),
    )));
  }
}
