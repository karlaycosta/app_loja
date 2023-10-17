import 'package:flutter/material.dart';

import '../patterns/observer/notificador.dart';
import '../patterns/singleton/carrinho.dart';

class TextoEscuta extends StatefulWidget {
  final TextStyle? textStyle;
  const TextoEscuta({super.key, this.textStyle});

  @override
  State<TextoEscuta> createState() => _TextoEscutaState();
}

class _TextoEscutaState extends State<TextoEscuta> implements Ouvinte {
  @override
  void initState() {
    super.initState();
    Carrinho.getInstance().adicionarOuvinte(this);
  }

  @override
  void dispose() {
    Carrinho.getInstance().removerOuvinte(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${Carrinho.getInstance().quantidade}',
      style: widget.textStyle ?? const TextStyle(height: 0.5),
    );
  }

  @override
  void escutar() {
    setState(() {});
  }
}
