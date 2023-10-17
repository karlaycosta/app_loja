import 'package:flutter/material.dart';

import '../models/produto.dart';
import '../patterns/singleton/carrinho.dart';

class ProductWidget extends StatefulWidget {
  final Produto product;
  const ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: ListTile(
        title: Text(widget.product.item.nome),
        subtitle: const Text('Alguma descrição do produto'),
        leading: Text(
          '${widget.product.preco}',
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        trailing: FilledButton(
          onPressed: () {
            Carrinho.getInstance().adicionar(widget.product);
            print(Carrinho.getInstance().quantidade);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
