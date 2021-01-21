import 'package:bestruck/features/cadastroMotorista/presentation/pages/cadastro_motorista_page.dart';
import 'package:bestruck/features/cadastroMotorista/presentation/pages/perfil_page.dart';
import 'package:bestruck/features/controlaAcesso/presentation/pages/fazLogin_page.dart';
import 'package:bestruck/features/escolhePedidos/presentation/pages/pedidoAceito_page.dart';
import 'package:bestruck/features/escolhePedidos/presentation/pages/pedidos_page.dart';
import 'package:bestruck/features/homepage/presentation/pages/homepage.dart';
import 'package:bestruck/features/homepage/presentation/pages/sobreNos.dart';
import 'package:bestruck/main.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Homepage());
      case '/cadastraMotorista':
        return MaterialPageRoute(
          builder: (_) => CadastroDeMotorista(),
        );
      case '/sobreNos':
        return MaterialPageRoute(builder: (_) => SobreNos());
      case '/login':
        return MaterialPageRoute(builder: (_) => FazLogin());
      case '/perfil':
        return MaterialPageRoute(builder: (_) => PerfilPage());
      case '/pedidos':
        return MaterialPageRoute(builder: (_) => PedidosPage());
      case '/pedidoAceito':
        return MaterialPageRoute(builder: (_) => PedidoAceitoPage());
    }
    return MaterialPageRoute(builder: (_) => MyApp());
  }
}
