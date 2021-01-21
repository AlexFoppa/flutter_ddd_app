
import 'package:bestruck/core/util/constants.dart';
import 'package:bestruck/features/cadastroMotorista/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormularioDeCadastroDoMotorista extends StatefulWidget {
  const FormularioDeCadastroDoMotorista({
    Key key,
  }) : super(key: key);

  @override
  _FormularioControlsState createState() => _FormularioControlsState();
}

class _FormularioControlsState extends State<FormularioDeCadastroDoMotorista> { 
  final _formKey = GlobalKey <FormState> ();

  TextEditingController nome = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController cnh = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController confirmaSenha = TextEditingController();
  TextEditingController endereco = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tipoDeCaminhao = TextEditingController();
  TextEditingController ano = TextEditingController();
  TextEditingController implemento = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: SingleChildScrollView(
        child: new Column(
        children: <Widget>[ 
          Padding( 
            padding: EdgeInsets.only(bottom: 30),
            child: TextFormField( 
                  autofocus: true,
                  controller: nome,  
                  style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.text,
                    maxLines: null,
                decoration: textInputDecoration.copyWith(hintText: 'Nome completo'),
                 validator: (val) => val.isEmpty ? 'Informe seu nome': null,
                ),
        ),
        Padding( 
            padding: EdgeInsets.only(bottom: 30),
            child:  TextFormField( 
                  autofocus: true,
                  controller: telefone,  
                  style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.phone,
                    maxLines: null,
                  decoration: textInputDecoration.copyWith(hintText: 'Telefone para contato'),
                  validator: (val) => val.isEmpty ? 'Informe um telefone de contato': null,
                ),
        ),
        Padding( 
            padding: EdgeInsets.only(bottom: 30),
            child: TextFormField( 
                  autofocus: true,
                  controller: cnh,  
                  style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    maxLines: null,
                  decoration: textInputDecoration.copyWith(hintText: 'CNH'),
                  validator: (val) => val.isEmpty ? 'Informe o número de sua Carteira Nacional de Habilitação (CNH)': null,
                ),
        ),
        Padding( 
            padding: EdgeInsets.only(bottom: 30),
                child: TextFormField( 
                  autofocus: true,
                  controller: cpf,  
                  style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    maxLines: null,
                  decoration: textInputDecoration.copyWith(hintText: 'CPF'),
                  validator: (val) => val.isEmpty ? 'Informe o número de seu Cadastro de Pessoa Física - CPF': null,
                ),
        ),
        Padding( 
            padding: EdgeInsets.only(bottom: 30),
                child: TextFormField( 
                  autofocus: true,
                  controller: endereco,  
                  style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: textInputDecoration.copyWith(hintText: 'Endereço completo'),
                    validator: (val) => val.isEmpty ? 'Informe seu endereço completo': null,
                ),
        ),
        Padding( 
            padding: EdgeInsets.only(bottom: 30),
                child: TextFormField( 
                  autofocus: true,
                  controller: email,  
                  style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.emailAddress,
                    maxLines: null,
                    decoration: textInputDecoration.copyWith(hintText: 'E-mail'),
                    validator: (val) => val.isEmpty ? 'Informe seu endereço de e-mail': null,
                ),
        ),
                 Padding( 
            padding: EdgeInsets.only(bottom: 30),
                child: TextFormField( 
                  autofocus: true,
                  obscureText: true,
                  controller: senha,  
                  style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: textInputDecoration.copyWith(hintText: 'Senha'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe uma senha';
                    }else if (senha.text.length <6){
                    return 'A senha deve possuir, no mínimo, seis caracteres';  
                    }else if(senha.text != confirmaSenha.text){
                    return 'As senhas informadas não são iguais';
                  }
                    return null;
                  },
                ),
        ),
         Padding( 
            padding: EdgeInsets.only(bottom: 30),
                child: TextFormField( 
                  autofocus: true,
                  obscureText: true,
                  controller: confirmaSenha,  
                  style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: textInputDecoration.copyWith(hintText: 'Repita sua senha'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Confirme sua senha';
                  }else if(senha.text != confirmaSenha.text){
                    return 'As senhas informadas não são iguais';
                  }
                    return null;
                  },
                ),
        ),

        Padding( 
            padding: EdgeInsets.only(bottom: 30),
                child: TextFormField( 
                  autofocus: true,
                  controller: tipoDeCaminhao,  
                  style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: textInputDecoration.copyWith(hintText: 'Tipo de caminhão'),
                    validator: (val) => val.isEmpty ? 'Informe o tipo de caminhão que você possui': null,
                ),
        ),
        Padding( 
            padding: EdgeInsets.only(bottom: 30),
                child: TextFormField( 
                  autofocus: true,
                  controller: ano,  
                  style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    maxLines: null,
                    decoration: textInputDecoration.copyWith(hintText: 'Ano de fabricação de seu veículo'),
                    validator: (val) => val.isEmpty ? 'Informe o ano de fabricação de seu veículo': null,
                ),
        ),
        Padding( 
            padding: EdgeInsets.only(bottom: 30),
                child: TextFormField( 
                  autofocus: true,
                  controller: implemento,  
                  style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                   decoration: textInputDecoration.copyWith(hintText: 'Implemento'),
                    validator: (val) => val.isEmpty ? 'Informe se/qual implemento seu veículo possui': null,
                ),
           ),
        
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
              cancelar();
              },
              child: Text('Cancelar'),
            ),
            Spacer(flex: 1),
           RaisedButton(
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPressed: () {
                if (_formKey.currentState.validate()) {
               _formKey.currentState.save();
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Validando dados')));
                      dispatchCadastro();
                    }              
                  },
                child: Text('Salvar'),
                ),
         Container(
           height:10
         ),                               
            ],
          ),
         ),
         Container(
           height:200
         )
       ]
      ),
    ));
  }

  
  void cancelar(){
    limpa();
    Navigator.pop(context);
  }

  void dispatchCadastro(){
    BlocProvider.of<CadastraMotoristaBloc>(context)
     .dispatch(LeDadosDeCadastroDoMotorista(
       nome.text, 
       telefone.text, 
       cnh.text, 
       cpf.text, 
       endereco.text, 
       email.text, 
       tipoDeCaminhao.text, 
       ano.text, 
       implemento.text,
      senha.text
       ));
      cancelar();
      }

      void limpa(){
       nome.clear(); 
       telefone.clear(); 
       cnh.clear(); 
       cpf.clear(); 
       endereco.clear(); 
       email.clear();
       tipoDeCaminhao.clear(); 
       ano.clear();
       implemento.clear();
       senha.clear();
       confirmaSenha.clear();
  }
}
