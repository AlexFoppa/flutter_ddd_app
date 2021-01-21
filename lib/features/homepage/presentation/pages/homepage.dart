
import 'package:bestruck/features/controlaAcesso/data/datasources/usuarioFirebase.dart';
import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final usuario = Provider.of<Usuario>(context);
    print(usuario);

    final UsuarioFirebaseDataSourceImpl _auth = UsuarioFirebaseDataSourceImpl();
    
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text('Bestruck'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Login',
            style: TextStyle(color: Colors.white)),
            onPressed: () async {
             await Navigator.of(context).pushNamed( '/login');
            },
          )
        ],
        ),
        
          body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
      
            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: new Image.asset('images/logoSimples.png',
              fit: BoxFit.fitWidth
              )
          ),
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              child: new Image.asset('images/anunciogenerico.jpg',
              fit: BoxFit.fitWidth
              )
              )
          ,SizedBox(height: 10),
            Row(
              children: <Widget>[
                Spacer(flex: 1,),
                SizedBox(
                  height: 100,
                  child: RaisedButton.icon(
                    
                    icon: Icon(Icons.person),
                    label: Text('Acessar minha página'),
                    
                  onPressed: () {
                  Navigator.of(context).pushNamed( '/login');
                      },
                  )
                ),
                Spacer(flex: 1,),
              ],
            ),
           
            SizedBox(height: 10),
          
            Row(
              children: <Widget>[
                Spacer(flex: 1,),
                SizedBox(
                  height: 100,
                  child: RaisedButton.icon(
                    
                    icon: Icon(Icons.local_shipping),
                    label: Text('Quero ser motorista'),
                    
                  onPressed: () async {
                  await _auth.desloga();
                  Navigator.of(context).pushNamed( '/cadastraMotorista');
                      },
                  )
                ),
                Spacer(flex: 1,),
              ],
            ),
           
            SizedBox(height: 10),
            RaisedButton(
                  child:Text('Sobre nós'),
                  onPressed: () {
                    Navigator.of(context).pushNamed( '/sobreNos');
                      },
            )
          ])
    ),
    bottomNavigationBar: BottomAppBar(
      color: Theme.of(context).primaryColor,
      child:Container(
        height: 50,
        alignment: Alignment.bottomCenter,
      child: Text('Informações para contato: [inserir aqui]', style: TextStyle(color: Colors.white),),
    ),
      ) 
    );
  }
}