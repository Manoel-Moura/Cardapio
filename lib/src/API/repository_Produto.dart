// import 'dart:ffi';

import 'package:cardapio/src/models/cardapioApiModel.dart';
import 'package:cardapio/src/models/produtoApiModel.dart';
// import 'package:cardapio/src/models/produtoApiModel.dart';
import 'package:dio/dio.dart';

class RepositoryProd {
  final String baseUrl = 'http://localhost:3333';
  //final String endpoint = '/flutter/produtos/listar.php';

  Future<ProdutoApiModel> CadastraProduto(String nome, String ingredientes,
      double preco, String categoria, String imagemurl) async {
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    var resposta;
    //print(dio.toString());

    resposta = await dio.post('/produto', data: {
      "nome": "$nome",
      "ingredientes": "$ingredientes",
      "preco": preco,
      "categoria": "$categoria",
      "imagemurl": "$imagemurl"
    });

    if (resposta.statusCode == 200) {
      return ProdutoApiModel.fromJson(resposta.data);
    }

    return ProdutoApiModel();
  }

  Future<CardapioApiModel> BuscaProdutos() async {
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    var resposta;
    //print(dio.toString());

    resposta = await dio.get('/produtos');

    if (resposta.statusCode == 200) {
      return CardapioApiModel.fromJson(resposta.data);
    }

    return CardapioApiModel();
  }
}
