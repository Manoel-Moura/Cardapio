import 'package:cardapio/src/API/repository_Produto.dart';
import 'package:cardapio/src/models/produtoApiModel.dart';
import 'package:cardapio/src/models/userApiModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cardapio/src/models/cardapioApiModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    RepositoryProd repo = RepositoryProd();
    return Provider(
      create: (context) => repo,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        home: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Repository listaDeProdutos = Provider.of(context);
    RepositoryProd produtos = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: produtos.BuscaProdutos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              CardapioApiModel produto = snapshot.data as CardapioApiModel;

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: produto.data!.produtos!
                      .map(
                        (e) => Text(
                          '${e.nome}',
                          style: TextStyle(fontSize: 40),
                        ),
                      )
                      .toList(),
                ),
              );
            }
            return const CircularProgressIndicator(
              color: Colors.red,
            );
          },
        ),
        // Container(
        //   child: ListView.builder(
        //     itemCount: lista.dados != null ? lista.dados.lenth : 0,
        //     itemBuilder: (context, i) {
        //       final item = lista.dados[i];
        //       print(lista);
        //       return Container();
        //     },
        //   ),
        // ),
      ),
    );
  }
}
