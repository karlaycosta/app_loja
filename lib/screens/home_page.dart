import 'package:app_loja/widgets/produto.dart';
import 'package:flutter/material.dart';

import '../models/item.dart';
import '../models/produto.dart';
import '../patterns/strategy/promocao.dart';
import '../widgets/app_theme.dart';
import '../widgets/texto_escuta.dart';
import 'carrinho_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final produto = Produto(
    item: const Item(nome: 'Tênis Nike 2023', imagem: 'assets/images/03.jpg'),
    valor: 1500,
  );

  @override
  Widget build(BuildContext context) {
    print('Desenhou...');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Badge(
                offset: Offset(6, 12),
                padding: EdgeInsets.symmetric(horizontal: 6),
                label: TextoEscuta(),
                // child: Icon(Icons.shopping_cart_rounded),
                child: Icon(Icons.local_mall_rounded),
              ),
              // TextoEscuta(),
            ],
          ),
          centerTitle: true,
          actions: [
            Switch(
              value: ThemeProvider.of(context).isDark,
              thumbIcon: MaterialStateProperty.resolveWith<Icon>(
                (states) => states.contains(MaterialState.selected)
                    ? const Icon(Icons.dark_mode_rounded)
                    : const Icon(Icons.light_mode_rounded),
              ),
              onChanged: (value) => ThemeProvider.read(context).swap(),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProdutoWidegt(produto: produto),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: () {
                      setState(() {
                        produto.promocao = const Desconto10();
                      });
                    },
                    child: const Text('10%'),
                  ),
                  FilledButton(
                    onPressed: () {
                      setState(() {
                        produto.promocao = const Desconto20();
                      });
                    },
                    child: const Text('20%'),
                  ),
                  FilledButton(
                    onPressed: () {
                      setState(() {
                        produto.promocao = const Desconto30();
                      });
                    },
                    child: const Text('300%'),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CarrinhoPage()),
            );
            // setState(() {});
          },
          child: const Icon(Icons.local_mall_rounded),
        ),
      ),
    );
  }
}
