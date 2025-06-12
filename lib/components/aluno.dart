/// Representa o modelo de dados para um aluno.
///
/// Cada aluno possui identificador, nome, email, data de nascimento, gênero,
/// telefone de contato, perfis em redes sociais e status de ativo.
class Aluno {
  final int id;
  final String nome;
  final String email;
  final DateTime dataNascimento;
  final String genero;
  final String telefoneContato;
  final String perfilInstagram;
  final String perfilFacebook;
  final String perfilTiktok;
  bool ativo;

  Aluno({
    required this.id,
    required this.nome,
    required this.email,
    required this.dataNascimento,
    required this.genero,
    required this.telefoneContato,
    required this.perfilInstagram,
    required this.perfilFacebook,
    required this.perfilTiktok,
    this.ativo = true,
  });
}
