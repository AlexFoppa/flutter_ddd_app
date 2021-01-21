import 'package:bestruck/core/util/constants.dart';
import 'package:bestruck/features/controlaAcesso/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TelaDeLogin extends StatefulWidget {
  const TelaDeLogin({
    Key key,
  }) : super(key: key);
  @override
  _TelaDeLoginState createState() => _TelaDeLoginState();
}

class _TelaDeLoginState extends State<TelaDeLogin> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'email'),
                keyboardType: TextInputType.emailAddress,
                validator: (val) => val.isEmpty ? 'Informe seu e-mail' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'senha'),
                keyboardType: TextInputType.visiblePassword,
                validator: (val) => val == null ? 'Informe sua senha' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text(
                    'Entrar',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      validaCredenciais();
                    }
                  }),
              SizedBox(height: 12.0),
              Text(
                '',
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ));
  }

  void validaCredenciais() {
    BlocProvider.of<FazloginBloc>(context)
        .dispatch(LeDadosParaLogin(email, password));
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("Validando credenciais")));
  }
}
