import 'aluno.dart';

/// Representa o modelo de dados para um grupo de alunos.
///
/// Cada grupo possui identificador, nome, descrição, alunos participantes e status de ativo.
class GrupoAluno {
  final int id;
  final String nome;
  final String descricao;
  final List<Aluno> alunosParticipantes;
  bool ativo;

  GrupoAluno({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.alunosParticipantes,
    this.ativo = true,
  });
}
