import 'package:flutter/material.dart';

import '../models/produto.dart';
import '../patterns/singleton/carrinho.dart';

class ProductWidget extends StatelessWidget {
  final Produto product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: ListTile(
        title: Text(product.item.nome),
        subtitle: const Text('Alguma descrição do produto'),
        leading: Text(
          '${product.preco}',
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        trailing: FilledButton(
          onPressed: () {
            Carrinho.instance.adicionar(product);
            print(Carrinho.instance.quantidade);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
