
import 'package:bestruck/core/error/exceptions.dart';
import 'package:bestruck/features/cadastroMotorista/data/models/motoristaModel.dart';
import 'package:bestruck/features/cadastroMotorista/domain/entities/motorista.dart';
import 'package:bestruck/features/controlaAcesso/data/datasources/usuarioFirebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



abstract class MotoristaFirebaseDataSource {
  Future<Motorista> cadastraMotorista(
    String nome,
    String telefone,
    String cnh,
    String cpf,
    String endereco,
    String email,
    String tipoDeCaminhao,
    String ano,
    String implemento,
    String status,
    String senha
  );
}
  class MotoristaFirebaseDataSourceImpl implements MotoristaFirebaseDataSource {
  
  String uid;
  MotoristaFirebaseDataSourceImpl( {this.uid});
  
  final CollectionReference motoristas = Firestore.instance.collection('Motorista');


  
   //Cadastra e atualiza os dados do motorista

  @override
  Future<Motorista> cadastraMotorista(
    String nome, String telefone, String cnh, String cpf, String endereco, String email, String tipoDeCaminhao, String ano, String implemento, String status, String senha
    ) async {
   
    try{

    final UsuarioFirebaseDataSourceImpl _usuario =  UsuarioFirebaseDataSourceImpl();

    if(this.uid == null){
     final result = await _usuario.criaUsuario(email, senha);
     uid = result.uid;
  
    }

    await motoristas.document(uid).setData({
        "Nome":nome,
        "Telefone": telefone,
        "Cnh": cnh,
        "Cpf": cpf,
        "Endereco": endereco,
        "Email": email,
        "TipoDeCaminhao": tipoDeCaminhao,
        "Ano": ano,
        "Implemento": implemento,
        "Status": status
    });
    return null;
  }catch(e){
    print(e.toString());
   throw CreateUserException();
  }}




// checa Uid

  Future<String> checaUid() async {
     try{

      final FirebaseAuth _auth = FirebaseAuth.instance;
      final FirebaseUser user = await _auth.currentUser();
      String uid = user.uid;
      return uid;
    }catch(e){
      return null;
    }

  }

//Lista os dados de um motorista
  
  UserData _esteMotorista (DocumentSnapshot snapshot){
    return UserData(
        uid: uid,
        nome: snapshot.data['Nome'] ?? '', 
        telefone: snapshot.data['Telefone']?? '',
        email: snapshot.data['Email']?? '',
        cnh: snapshot.data['Cnh']?? '',
        cpf: snapshot.data['Cpf']?? '',
        endereco: snapshot.data['Endereco']?? '',
        tipoDeCaminhao: snapshot.data['TipoDeCaminhao']?? '',
        ano: snapshot.data['Ano']?? '',
        implemento: snapshot.data['Implemento']?? '',
        status: snapshot.data['Status']?? '',
    );
  } 

  Stream<UserData> get  mostraPerfil  {

    return motoristas.document(this.uid).snapshots()
    .map(_esteMotorista);
  }

  }
