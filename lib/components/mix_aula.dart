import 'musica.dart';

/// Representa o modelo de dados para um Mix de Aula (Playlist).
///
/// Cada mix possui identificador, nome, datas de validade, descrição/observações,
/// músicas do mix e status de ativo.
class MixAula {
  final int id;
  final String nome;
  final DateTime dataInicioValidade;
  final DateTime dataFimValidade;
  final String descricaoObservacoes;
  final List<Musica> musicasDoMix;
  bool ativo;

  MixAula({
    required this.id,
    required this.nome,
    required this.dataInicioValidade,
    required this.dataFimValidade,
    required this.descricaoObservacoes,
    required this.musicasDoMix,
    this.ativo = true,
  });
}
