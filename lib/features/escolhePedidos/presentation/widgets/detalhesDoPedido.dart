import 'package:bestruck/features/escolhePedidos/data/models/pedidoModel.dart';
import 'package:bestruck/features/escolhePedidos/presentation/widgets/opcaoDeAceite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetalhesDoPedido extends StatefulWidget {
  final PedidoModel data;

  const DetalhesDoPedido({this.data});
  @override
  _DetalhesDoPedidoState createState() => _DetalhesDoPedidoState();
}

class _DetalhesDoPedidoState extends State<DetalhesDoPedido> {
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
          'Pedido da empresa ${widget.data.empresa}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        SizedBox(height: 40),
        Row(children: <Widget>[
          Text('Status: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Expanded(
            child: Text(widget.data.status,
                style: TextStyle(fontSize: 20, color: Colors.green)),
          )
        ]),
        SizedBox(height: 20),
        Row(children: <Widget>[
          Text('Motorista: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Expanded(
            child:
                Text(widget.data.motoristaNome, style: TextStyle(fontSize: 20)),
          )
        ]),
        SizedBox(height: 20),
        Row(children: <Widget>[
          Text('Produto: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Expanded(
            child: Text(widget.data.produto, style: TextStyle(fontSize: 20)),
          )
        ]),
        SizedBox(height: 10),
        Row(children: <Widget>[
          Text('Peso: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Expanded(
            child: Text(widget.data.peso, style: TextStyle(fontSize: 20)),
          )
        ]),
        SizedBox(height: 20),
        Row(children: <Widget>[
          Text('Origem: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Expanded(
            child: Text(widget.data.origem, style: TextStyle(fontSize: 20)),
          )
        ]),
        SizedBox(height: 10),
        Row(children: <Widget>[
          Text('Destino: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Expanded(
            child: Text(widget.data.destino, style: TextStyle(fontSize: 20)),
          )
        ]),
        SizedBox(height: 20),
        Row(children: <Widget>[
          Text('Data e hora da coleta: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Expanded(
            child:
                Text(widget.data.dataHoraSaida, style: TextStyle(fontSize: 20)),
          )
        ]),
        SizedBox(height: 20),
        Row(children: <Widget>[
          Text('Especificações: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Expanded(
            child: Text(widget.data.especificacoes,
                style: TextStyle(fontSize: 20)),
          )
        ]),
        SizedBox(height: 10),
        Row(children: <Widget>[
          Text('Tipo de caminhão: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Expanded(
            child: Text(widget.data.tipoDeCaminhao,
                style: TextStyle(fontSize: 20)),
          )
        ]),
        SizedBox(height: 10),
        Row(children: <Widget>[
          Text('Implemento: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Expanded(
            child: Text(widget.data.implemento, style: TextStyle(fontSize: 20)),
          )
        ]),
        SizedBox(height: 30),
        Visibility(
          visible: (widget.data.status=='Aguardando Motorista'),
            child: OpcaoDeAceite(
          pedido: widget.data.reference.documentID,

        ))
      ]),
    )));
  }
}
