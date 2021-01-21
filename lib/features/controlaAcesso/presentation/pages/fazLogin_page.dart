import 'package:bestruck/core/util/message_display.dart';
import 'package:bestruck/features/controlaAcesso/presentation/bloc/bloc.dart';
import 'package:bestruck/features/controlaAcesso/presentation/widgets/telaDeLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class FazLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: buildBody(context),
        ));
  }

  BlocProvider<FazloginBloc> buildBody(BuildContext context) {
    return BlocProvider(
        builder: (_) => sl<FazloginBloc>(),
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          TelaDeLogin(),
          BlocBuilder<FazloginBloc, FazloginState>(
            builder: (context, state) {
              if (state is Error) {
                return MessageDisplay(
                  message: state.message,
                );
              } else if (state is Checked) {
                Navigator.of(context).pop();
                return Container();
              } else {
                return Container();
              }
            },
          ),
          SizedBox(height: 20),
          Text('Ainda não possui cadastro conosco?'),
          GestureDetector(
              child: Text("Então registre-se agora!",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue)),
              onTap: () {
                Navigator.of(context).pushNamed('/cadastraMotorista');
              }),
        ])));
  }
}
