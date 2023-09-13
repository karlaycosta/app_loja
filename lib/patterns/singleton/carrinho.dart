import '../../models/produto.dart';
import '../observer/notificador.dart';

class Carrinho extends Notificador {
  static final Carrinho _instance = Carrinho._();
  Carrinho._();
  static Carrinho get instance => _instance;

  final _produtos = <Produto>[];
  int get quantidade => _produtos.length;

  void adicionar(Produto produto) {
    _produtos.add(produto);
    notificar();
  }
}
