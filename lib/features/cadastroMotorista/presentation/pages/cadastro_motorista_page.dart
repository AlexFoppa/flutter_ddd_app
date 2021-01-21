import 'package:bestruck/core/util/message_display.dart';
import 'package:bestruck/features/cadastroMotorista/presentation/bloc/bloc.dart';
import 'package:bestruck/features/cadastroMotorista/presentation/widgets/FormularioDeCadastroDoMotorista.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class CadastroDeMotorista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('Cadastro de Motorista'),
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
              FormularioDeCadastroDoMotorista(),
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
