import 'package:cardapio/src/models/userApiModel.dart';
import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';

class RepositoryUser {
  final String baseUrl = 'http://localhost:3333';
  //final String endpoint = '/flutter/produtos/listar.php';

  Future<UserApiModel> CadastrarUsuario(
      String nome, String email, String senha) async {
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    var resposta;
    //print(dio.toString());

    resposta = await dio.post('/user',
        data: {"name": "$nome", "email": "$email", "password_hash": "$senha"});

    if (resposta.statusCode == 200) {
      return UserApiModel.fromJson(resposta.data);
    }

    return UserApiModel();
  }

  Future<UserApiModel> LoginUsuario(String email, String senha) async {
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    var resposta;

    resposta = await dio
        .post('/login', data: {"email": "$email", "password_hash": "$senha"});

    if (resposta.statusCode == 200) {
      return UserApiModel.fromJson(resposta.data);
    }

    return UserApiModel();
  }
}
