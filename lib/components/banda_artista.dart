/// Representa o modelo de dados para uma banda ou artista.
///
/// Cada banda/artista possui identificador, nome, descrição curta,
/// link relacionado, URL da foto de perfil e status de ativo.
class BandaArtista {
  final int id;
  final String nome;
  final String descricaoCurta;
  final String linkRelacionado;
  final String urlFotoPerfil;
  bool ativo;

  BandaArtista({
    required this.id,
    required this.nome,
    required this.descricaoCurta,
    required this.linkRelacionado,
    required this.urlFotoPerfil,
    this.ativo = true,
  });
}
