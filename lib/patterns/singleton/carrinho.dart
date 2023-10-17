import 'package:flutter/material.dart';

import '../../models/produto.dart';
import '../observer/notificador.dart';

class Carrinho extends Notificador with ChangeNotifier {
  static Carrinho? _instance;

  // static Carrinho get instance => _instance;

  Carrinho._();

  static Carrinho getInstance() {
    return _instance ??= Carrinho._();
  }

  final _produtos = <Produto>[];

  int get quantidade => _produtos.length;
  List<Produto> get produtos => _produtos.toList();

  void adicionar(Produto produto) {
    _produtos.add(produto);
    notificar();
    notifyListeners();
  }
}
