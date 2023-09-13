import '../patterns/strategy/promocao.dart';
import 'item.dart';

class Produto {
  final Item item;
  Promocao promocao = SemDesconto();
  final double _preco;
  double get preco => promocao.calcular(_preco);
  double get precoBase => _preco;

  Produto({
    required this.item,
    required double preco,
    Promocao? promocao,
  }) : _preco = preco, promocao = promocao ?? SemDesconto() ;
}
