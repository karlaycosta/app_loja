abstract class Notificador {
  final _ouvintes = <Ouvinte>[];

  void adicionarOuvinte(Ouvinte ouvinte) {
    _ouvintes.add(ouvinte);
  }
  void removerOuvinte(Ouvinte ouvinte) {
    _ouvintes.remove(ouvinte);
  }

  void notificar() {
    for (final ouvinte in _ouvintes) {
      ouvinte.escutar();
    }
  }
}

abstract interface class Ouvinte {
  void escutar();
}