import 'package:flutter/material.dart';

import '../patterns/observer/notificador.dart';
import '../patterns/singleton/carrinho.dart';

class TestoEscuta extends StatefulWidget {
  const TestoEscuta({super.key});

  @override
  State<TestoEscuta> createState() => _TestoEscutaState();
}

class _TestoEscutaState extends State<TestoEscuta> implements Ouvinte {
  @override
  void initState() {
    super.initState();
    Carrinho.instance.adicionarOuvinte(this);
  }

  @override
  void dispose() {
    Carrinho.instance.removerOuvinte(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(' ${Carrinho.instance.quantidade}');
  }

  @override
  void escutar() {
    setState(() {});
  }
}
