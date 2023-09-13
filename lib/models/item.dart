class Item {
  /// Nome do itemm
  final String nome;

  /// Caminho da imagem do item
  final String imagem;

  /// Construtor da classe.
  /// 
  /// Parâmetros nomeados:
  /// 
  /// [nome] Obrigatório.
  /// 
  /// [imagem] Opcional com seu valor padrão vazio.
  const Item({required this.nome, this.imagem = ''});

}
