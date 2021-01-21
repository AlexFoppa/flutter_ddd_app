import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/util/routegenerator.dart';
import 'features/controlaAcesso/data/datasources/usuarioFirebase.dart';
import 'features/controlaAcesso/presentation/widgets/wrapper.dart';
import 'injection_container.dart' as di;

void main() async {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Usuario>.value(
        value: UsuarioFirebaseDataSourceImpl().user,
        child: MaterialApp(
          title: 'Bestruck',
          theme: ThemeData(
              primaryColor: Colors.grey.shade600,
              accentColor: Colors.grey.shade800),
          home: Wrapper(),
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
