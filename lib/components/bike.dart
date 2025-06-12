import 'fabricante.dart';

/// Representa o modelo de dados para uma bike.
///
/// Cada bike possui identificador, nome, número de série, fabricante,
/// data de aquisição, data de cadastro no sistema e status de ativo.
class Bike {
  final int id;
  final String nome;
  final String numeroSerie;
  final Fabricante fabricante;
  final DateTime dataAquisicao;
  final DateTime dataCadastroSistema;
  bool ativo;

  Bike({
    required this.id,
    required this.nome,
    required this.numeroSerie,
    required this.fabricante,
    required this.dataAquisicao,
    required this.dataCadastroSistema,
    this.ativo = true,
  });
}
