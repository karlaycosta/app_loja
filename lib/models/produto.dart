import '../patterns/strategy/promocao.dart';
import 'item.dart';

class Produto {
  final Item item;
  final double valor;
  double get preco => promocao.calcular(valor);

  Promocao promocao;

  Produto({
    required this.item,
    required this.valor,
    this.promocao = const SemDesconto(),
  });
}
