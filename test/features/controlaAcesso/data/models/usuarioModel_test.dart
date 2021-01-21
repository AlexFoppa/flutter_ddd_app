
import 'dart:convert';
import 'package:bestruck/features/controlaAcesso/data/models/usuarioModel.dart';
import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';


void main() {
  final tUsuarioModel = UsuarioModel(
  email:  'teste@teste.com',
  password: '1234',
  );
  
  test(
    'deve ser uma subclasse da entidade Usuario', 
    () async {
      expect(tUsuarioModel, isA<Usuario>());
    }
    );
  
  group('do Json', (){
    test(
      'deve retornar um modelo válido',
    () async {
      //arange
      final Map <String, dynamic> jsonMap=
        json.decode(fixture('usuario.json'));
      //act
      final result = UsuarioModel.fromJson(jsonMap);
      //assert
      expect(result, tUsuarioModel);
    }
  );
  });

  group('para o Json', () {
    test(
      'deve retornar um JSON map com os dados corretos',
      () async {
        // act
        final result = tUsuarioModel.toJson();
        // assert
        final expectedMap = {
            "email":  "teste@teste.com",
            "password": "1234",
            };
        expect(result, expectedMap);
      },
    );
  });
}