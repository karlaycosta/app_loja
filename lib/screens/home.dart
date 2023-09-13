import 'package:flutter/material.dart';

import '../models/item.dart';
import '../models/produto.dart';
import '../patterns/strategy/promocao.dart';
import '../widgets/product_widget.dart';
import '../widgets/testo_escuta.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final produto = Produto(
    item: const Item(nome: 'Arroz', imagem: '01'),
    preco: 10,
  );

  @override
  Widget build(BuildContext context) {
    print('Desenhou...');
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shopping_cart_rounded),
            TestoEscuta(),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProductWidget(product: produto),
            Text(
              'R\$ ${produto.precoBase.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 48,
              ),
            ),
            const Divider(),
            Text(
              'R\$ ${produto.preco.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 48,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton(
                  onPressed: () {
                    setState(() {
                      produto.promocao = Desconto10();
                    });
                  },
                  child: const Text('10%'),
                ),
                FilledButton(
                  onPressed: () {
                    setState(() {
                      produto.promocao = Desconto20();
                    });
                  },
                  child: const Text('20%'),
                ),
                FilledButton(
                  onPressed: () {
                    setState(() {
                      produto.promocao = Desconto30();
                    });
                  },
                  child: const Text('30%'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.local_mall_rounded),
      ),
    );
  }
}
