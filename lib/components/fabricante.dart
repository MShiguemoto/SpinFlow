/// Representa o modelo de dados para um fabricante.
///
/// Cada fabricante possui identificador, nome, descrição, nome do contato principal,
/// email de contato, telefone de contato e status de ativo.
class Fabricante {
  final int id;
  final String nome;
  final String descricao;
  final String nomeContatoPrincipal;
  final String emailContato;
  final String telefoneContato;
  bool ativo;

  Fabricante({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.nomeContatoPrincipal,
    required this.emailContato,
    required this.telefoneContato,
    this.ativo = true,
  });
}
