/// Representa o modelo de dados para uma categoria de música.
///
/// Cada categoria possui identificador, nome, descrição e status de ativo.
class CategoriaMusica {
  final int id;
  final String nome;
  final String descricao;
  bool ativo;

  CategoriaMusica({
    required this.id,
    required this.nome,
    required this.descricao,
    this.ativo = true,
  });
}
