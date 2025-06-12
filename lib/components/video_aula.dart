/// Representa o modelo de dados para uma única videoaula.
///
/// Cada videoaula tem um identificador único, nome, link do vídeo e um status de ativo.
class VideoAula {
  final int id;
  final String nome;
  final String linkVideo;
  bool ativo;

  VideoAula({
    required this.id,
    required this.nome,
    required this.linkVideo,
    this.ativo = true,
  });
}
