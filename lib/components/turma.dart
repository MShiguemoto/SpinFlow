import 'sala.dart';

/// Representa o modelo de dados para uma turma.
///
/// Cada turma possui identificador, nome, descrição, dias da semana,
/// hora de início, duração em minutos, sala e status de ativo.
class Turma {
  final int id;
  final String nome;
  final String descricao;
  final List<String> diasSemana;
  final String horaInicio;
  final int duracaoMinutos;
  final Sala sala;
  bool ativo;

  Turma({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.diasSemana,
    required this.horaInicio,
    required this.duracaoMinutos,
    required this.sala,
    this.ativo = true,
  });
}
