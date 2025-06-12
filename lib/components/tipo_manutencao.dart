/// Representa o modelo de dados para um tipo de manutenção.
///
/// Cada tipo de manutenção possui identificador, nome, descrição e status de ativo.
class TipoManutencao {
  final int id;
  final String nome;
  final String descricao;
  bool ativo;

  TipoManutencao({
    required this.id,
    required this.nome,
    required this.descricao,
    this.ativo = true,
  });
}
