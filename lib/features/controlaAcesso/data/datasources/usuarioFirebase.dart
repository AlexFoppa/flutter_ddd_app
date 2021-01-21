import 'package:bestruck/core/error/exceptions.dart';
import 'package:bestruck/features/controlaAcesso/domain/entities/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UsuarioFirebaseDataSource {
  Future<Usuario> fazLogin(
    String email,
    String password,
  );
}

class UsuarioFirebaseDataSourceImpl implements UsuarioFirebaseDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Usuario _usuarioFromFirebase(FirebaseUser user) {
    return user != null
        ? Usuario(uid: user.uid, email: null, password: null)
        : null;
  }

  Stream<Usuario> get user {
    return _auth.onAuthStateChanged.map(_usuarioFromFirebase);
  }

  @override
  Future<Usuario> fazLogin(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _usuarioFromFirebase(user);
    } catch (e) {
      print(e.toString());
      throw LoginException();
    }
  }

  Future desloga() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future criaUsuario(String email, String password) async {
    print('cria usuario chamado');
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser usuario = result.user;

      return _usuarioFromFirebase(usuario);
    } catch (e) {
      print(e.toString());
      throw CreateUserException();
    }
  }
}
