import 'banda_artista.dart';
import 'categoria_musica.dart';
import 'video_aula.dart';

/// Representa o modelo de dados para uma música.
///
/// Cada música possui identificador, nome, artista/banda, categorias,
/// links de vídeo aulas associadas, duração em segundos, link de streaming,
/// descrição/observações e status de ativo.
class Musica {
  final int id;
  final String nome;
  final BandaArtista artistaBanda;
  final List<CategoriaMusica> categorias;
  final List<VideoAula> linksVideoAulasAssociadas;
  final int duracaoSegundos;
  final String linkStreaming;
  final String descricaoObservacoes;
  bool ativo;

  Musica({
    required this.id,
    required this.nome,
    required this.artistaBanda,
    required this.categorias,
    required this.linksVideoAulasAssociadas,
    required this.duracaoSegundos,
    required this.linkStreaming,
    required this.descricaoObservacoes,
    this.ativo = true,
  });
}
