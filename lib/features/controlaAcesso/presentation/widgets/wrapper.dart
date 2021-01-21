
import 'package:bestruck/features/cadastroMotorista/presentation/pages/perfil_page.dart';
import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';

import 'package:bestruck/features/homepage/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Usuario>(context);
    print(user);
    
    // return either the Home or Authenticate widget
    if (user == null){
      print("sem user logado");
      return Homepage();
    } else {
       print("user logado");
      return PerfilPage(user: user);
    }
    
  }
}