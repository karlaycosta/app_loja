abstract interface class Promocao {
  double calcular(double price);
}

final class SemDesconto implements Promocao {
  const SemDesconto();
  @override
  double calcular(double price) => price;
}

final class Desconto10 implements Promocao {
  const Desconto10();

  @override
  double calcular(double price) {
    return price - (price * (10 / 100));
  }
}

final class Desconto20 implements Promocao {
  const Desconto20();

  @override
  double calcular(double price) {
    return price - (price * (20 / 100));
  }
}

final class Desconto30 implements Promocao {
  const Desconto30();
  @override
  double calcular(double price) {
    return price - (price * (30 / 100));
  }
}