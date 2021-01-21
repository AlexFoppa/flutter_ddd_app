import 'package:bestruck/core/util/message_display.dart';
import 'package:bestruck/features/cadastroMotorista/presentation/bloc/bloc.dart';
import 'package:bestruck/features/cadastroMotorista/presentation/widgets/PerfilDoMotorista.dart';
import 'package:bestruck/features/controlaAcesso/data/datasources/usuarioFirebase.dart';
import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';
import 'package:bestruck/features/escolhePedidos/presentation/widgets/listaMeusPedidos.dart';
import 'package:bestruck/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PerfilPage extends StatelessWidget {
  final UsuarioFirebaseDataSourceImpl _auth = UsuarioFirebaseDataSourceImpl();
  final Usuario user;

  PerfilPage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meu Perfil'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                await _auth.desloga();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: buildBody(context),
        ));
  }

  BlocProvider<CadastraMotoristaBloc> buildBody(BuildContext context) {
    return BlocProvider(
        builder: (_) => sl<CadastraMotoristaBloc>(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  PerfilDoMotorista(
                    uid: this.user.uid,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Meus Pedidos',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Container(

                height: 130,
     
                    child: ListaMeusPedidos(
                  uid: this.user.uid,
                ),
              ),
              SizedBox(height: 20),
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
                        Navigator.of(context).pushNamed('/pedidos');
                      },
                      child: Text('Ver pedidos disponíveis'),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
              BlocBuilder<CadastraMotoristaBloc, CadastraMotoristaState>(
                builder: (context, state) {
                  if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  } else if (state is Loaded) {
                    return MessageDisplay(
                      message: 'ok',
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
