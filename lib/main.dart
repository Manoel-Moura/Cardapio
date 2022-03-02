import 'package:cardapio/src/models/produtosModel.dart';
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
    Repository repo = Repository();
    return Provider(
      create: (context) => repo,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        home: Home(),
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
    Repository lp = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FutureBuilder(
              future: lp.buscarListaDeProdutos(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  CardapioApiModel cardapio = snapshot.data as CardapioApiModel;
                  List<Result>? produtos = cardapio.result;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: produtos!
                            .map(
                              (e) => Text(
                                '${e.nome}',
                              ),
                            )
                            .toList()),
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
            Center(
                //Image.network(lista.imagem),
                ),
          ],
        ),
      ),
    );
  }
}
