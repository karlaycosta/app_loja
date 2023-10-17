
import 'package:flutter/material.dart';

import '../patterns/singleton/carrinho.dart';
import '../widgets/product_widget.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final carrinho = Carrinho.getInstance();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListenableBuilder(
              listenable: carrinho,
              builder: (context, child) {
                return ListView.builder(
                  itemCount: carrinho.quantidade,
                  itemBuilder: (context, index) {
                    return ProductWidget(product: carrinho.produtos[index]);
                  },
                );
              }
            ),
          ),
          Container(
            height: 128,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
