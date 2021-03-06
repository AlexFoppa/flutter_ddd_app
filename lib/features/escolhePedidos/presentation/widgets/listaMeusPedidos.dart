
import 'package:bestruck/features/escolhePedidos/data/models/pedidoModel.dart';
import 'package:bestruck/features/escolhePedidos/presentation/pages/detalhesDoPedido_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ListaMeusPedidos extends StatefulWidget {
  final String uid;

  const ListaMeusPedidos({Key key, this.uid}) : super(key: key);
 @override
 _ListaMeusPedidos createState() {
   return _ListaMeusPedidos();
 }
}
class _ListaMeusPedidos extends State<ListaMeusPedidos> {
 @override
 Widget build(BuildContext context) {
   return StreamBuilder<QuerySnapshot>(
   stream: Firestore.instance.collection('Pedido').snapshots(),
   builder: (context, snapshot) {
     if (!snapshot.hasData) {return LinearProgressIndicator();}

     return _buildList(context, snapshot.data.documents);
   },
 );
 }

 Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
   return ListView(
     padding: const EdgeInsets.only(top: 20.0),
     children: snapshot.map((data) => _buildListItem(context, data)).toList(),
   );
 }

 Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
   final record = PedidoModel.fromSnapshot(data);
    if(record.motoristaUid == widget.uid){
   return Padding(
     key: ValueKey(record.reference),
     padding:   EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 0.0),
        child: FlatButton(
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.business,
              color: Colors.black,
              ),
            ),
            title: Text('Origem: ${record.origem}, Destino: ${record.destino}') ,
            subtitle: Text('${record.empresa}'),
        ),
         onPressed: () {
                 Navigator.of(context).push(
                   MaterialPageRoute(
                    builder: (context) =>
                        DetalhesDoPedidoPage(data:record)
                           ),
                );
                },
      ),      
      ),
      );
    }else{
      return Container();
    }
 }
}
