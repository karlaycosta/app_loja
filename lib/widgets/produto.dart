import 'package:flutter/material.dart';

import '../models/produto.dart';
import '../patterns/singleton/carrinho.dart';
import '../patterns/strategy/promocao.dart';

class ProdutoWidegt extends StatelessWidget {
  final Produto produto;
  const ProdutoWidegt({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    print('Build....');
    final like = ValueNotifier<bool>(false);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 240,
        width: 180,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  color: Colors.grey,
                  child: Image.asset(produto.item.imagem),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    child: ListenableBuilder(
                      listenable: like,
                      builder: (context, snapshot) {
                        return Icon(
                          like.value ? Icons.favorite : Icons.favorite_outline,
                          color: Colors.white,
                        );
                      }
                    ),
                    onTap: () {
                      like.value = !like.value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              produto.item.nome,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (produto.promocao is! SemDesconto)
                  Text(
                    'R\$ ${produto.valor.toStringAsFixed(2)}',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                Text(
                  'R\$ ${produto.preco.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                Carrinho.getInstance().adicionar(produto);
              },
              child: const Text('Comprar'),
            ),
          ],
        ),
      ),
    );
  }
}
