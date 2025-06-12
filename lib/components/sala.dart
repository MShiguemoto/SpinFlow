/// Representa o modelo de dados para uma sala.
///
/// Cada sala possui identificador, nome, capacidade total de bikes,
/// número de filas, número de bikes por fila e status de ativo.
class Sala {
  final int id;
  final String nome;
  final int capacidadeTotalBikes;
  final int numeroFilas;
  final int numeroBikesPorFila;
  bool ativo;

  Sala({
    required this.id,
    required this.nome,
    required this.capacidadeTotalBikes,
    required this.numeroFilas,
    required this.numeroBikesPorFila,
    this.ativo = true,
  });
}
