/// Representa o modelo de dados para um único recado.
///
/// Cada recado tem um identificador único, título, descrição, data de criação
/// e um status para saber se foi lido.
class Recado {
  final int id;
  final String titulo;
  final String descricao;
  final DateTime dataCriacao;
  bool lido;

  Recado({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.dataCriacao,
    this.lido = false,
  });
}
