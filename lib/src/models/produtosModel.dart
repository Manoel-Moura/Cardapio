// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class listaDeProdutos {
//   var dados;
//   var nome, imagem, valor, id, categoria, ingrediente;

//   _getDados() async {
//     // final url = "http://localhost/flutter/produtos/listar.php";
//     final url = Uri.parse("http://192.168.10.146/flutter/produtos/listar.php");
//     final response = await http.get(url);
//     final map = json.decode(response.body);
//     final itens = map["result"];

//     this.dados = itens;
//   }

//   @override
//   void initState() {
//     _getDados();
//   }

//   listaDeProdutos() {
//     _getDados();
//   }
// }
import 'dart:convert';
import 'package:cardapio/src/models/cardapioApiModel.dart';
import 'package:dio/dio.dart';

class Repository {
  final String baseUrl = 'http://localhost';
  final String endpoint = '/flutter/produtos/listar.php';

  Future<CardapioApiModel> buscarListaDeProdutos() async {
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    var resposta;

    resposta = await dio.get(endpoint);

    if (resposta.statusCode == 200) {
      return CardapioApiModel.fromJson(resposta.data);
    }

    return CardapioApiModel();
  }
}
