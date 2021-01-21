import 'package:bestruck/core/util/loading.dart';
import 'package:bestruck/features/cadastroMotorista/data/datasources/motoristaFirebase.dart';
import 'package:bestruck/features/cadastroMotorista/data/models/motoristaModel.dart';
import 'package:flutter/material.dart';

class PerfilDoMotorista extends StatefulWidget {
  final String uid;

  PerfilDoMotorista({Key key, this.uid}) : super(key: key);
  @override
  _PerfilDoMotorista createState() => _PerfilDoMotorista();
}

class _PerfilDoMotorista extends State<PerfilDoMotorista> {
  bool _maisDadosVisiveis = false;
  String maisOuMenosDados = 'Mais Dados';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData>(
        stream: MotoristaFirebaseDataSourceImpl(uid: widget.uid).mostraPerfil,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData motorista = snapshot.data;

            return Expanded(
                          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Nome completo: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 10),
                  Text(motorista.nome, style: TextStyle(fontSize: 15)),
                  SizedBox(height: 20),
                  Text('Status: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 10),
                  Visibility(
                    visible: motorista.status == 'Aguardando aprovação',
                    child: Text(
                      '${motorista.status} - Aguarde a aprovação de seu cadastro para aceitar pedidos',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                  Visibility(
                      visible: motorista.status != 'Aguardando aprovação',
                      child: Text(motorista.status,
                          style: TextStyle(fontSize: 15, color: Colors.green))),
                  SizedBox(height: 20),
                  RaisedButton(
                    child: Text(maisOuMenosDados),
                    onPressed: mostraOuEscondeDados,
                  ),
                  SizedBox(height: 20),
                  Visibility(
                      visible: _maisDadosVisiveis,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text('CPF: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    Text(motorista.cpf,
                                        style: TextStyle(fontSize: 15)),
                                    Text('          '),
                                    Text('CNH: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    Text(motorista.cnh,
                                        style: TextStyle(fontSize: 15)),
                                  ]),
                            ),
                            SizedBox(height: 20),
                            Text('Telefone: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            SizedBox(height: 10),
                            Text(motorista.telefone,
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 20),
                            Text('E-mail: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            SizedBox(height: 10),
                            Text(motorista.email, style: TextStyle(fontSize: 15)),
                            SizedBox(height: 20),
                            Text('Endereço completo: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            SizedBox(height: 10),
                            Text(motorista.endereco,
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 20),
                            Text('Tipo de Caminhão: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            SizedBox(height: 10),
                            Text(motorista.tipoDeCaminhao,
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 20),
                            Text('Ano de Fabricação: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            SizedBox(height: 10),
                            Text(motorista.ano, style: TextStyle(fontSize: 15)),
                            SizedBox(height: 20),
                            Text('Implemento: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            SizedBox(height: 10),
                            Text(motorista.implemento,
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 20),
                          ]))
                ],
              ),
            );
          } else {
            return LoadingCircle();
          }
        });
  }

  void mostraOuEscondeDados() {
    return setState(() {
      _maisDadosVisiveis = !_maisDadosVisiveis;
      if (_maisDadosVisiveis == false) {
        maisOuMenosDados = 'Mais Dados';
      } else {
        maisOuMenosDados = 'Menos Dados';
      }
    });
  }
}
