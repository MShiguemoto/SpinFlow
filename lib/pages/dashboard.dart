import 'package:flutter/material.dart';

/// Um widget que representa a tela principal do painel da professora.
///
/// Organiza as funcionalidades em abas, permitindo uma navegação clara
/// e acesso rápido às seções de Visão Geral, Cadastros, Aulas, Manutenção
/// e Recados.
class TelaDashboard extends StatefulWidget {
  const TelaDashboard({super.key});

  @override
  State<TelaDashboard> createState() => _TelaDashboardState();
}

class _TelaDashboardState extends State<TelaDashboard>
    with SingleTickerProviderStateMixin {
  // Controlador para gerenciar o estado das abas (Tabs).
  late final TabController _tabController;

  // Lista de abas que serão exibidas na TabBar.
  final List<Tab> _tabs = const [
    Tab(text: 'Visão Geral'),
    Tab(text: 'Cadastros'),
    Tab(text: 'Aulas'),
    Tab(text: 'Manutenção'),
    Tab(text: 'Recados'),
  ];

  @override
  void initState() {
    super.initState();
    // Inicializa o TabController, definindo a quantidade de abas e
    // associando-o a este State para sincronização.
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    // Libera os recursos do TabController quando o widget for descartado.
    _tabController.dispose();
    super.dispose();
  }

  //----------------------------------------------------------------------------
  // Construção do Widget Principal
  //----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel da Professora'),
        // A TabBar é colocada na parte inferior do AppBar.
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
          isScrollable:
              true, // Permite que as abas rolem se não couberem na tela.
        ),
      ),
      // Corpo da tela, que exibe o conteúdo da aba selecionada.
      body: TabBarView(
        controller: _tabController,
        // Define os conteúdos para cada aba, na mesma ordem em que foram declaradas.
        children: [
          _visaoGeral(),
          _cadastros(),
          _aulasEAuloes(),
          _manutencao(),
          _recados(),
        ],
      ),
    );
  }

  //----------------------------------------------------------------------------
  // Métodos para construir o conteúdo de cada Aba
  //----------------------------------------------------------------------------

  /// Constrói o conteúdo da aba 'Visão Geral'.
  ///
  /// Exibe um GridView com cartões de informação resumida.
  Widget _visaoGeral() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2, // Define que o grid terá 2 colunas.
        crossAxisSpacing: 8.0, // Espaçamento horizontal entre os cartões.
        mainAxisSpacing: 8.0, // Espaçamento vertical entre os cartões.
        children: [
          _infoCard(
            icon: Icons.message,
            valor: '3',
            titulo: 'Recados',
            context: context,
          ),
          _infoCard(
            icon: Icons.person,
            valor: '82',
            titulo: 'Alunos Ativos',
            context: context,
          ),
          _infoCard(
            icon: Icons.schedule,
            valor: '12',
            titulo: 'Aulas Agendadas',
            context: context,
          ),
          _infoCard(
            icon: Icons.music_note,
            valor: '4',
            titulo: 'Mix de Músicas',
            context: context,
          ),
          _infoCard(
            icon: Icons.directions_bike,
            valor: '18',
            titulo: 'Bikes OK',
            context: context,
          ),
        ],
      ),
    );
  }

  /// Constrói o conteúdo da aba 'Cadastros'.
  ///
  /// Apresenta uma lista de opções de cadastro que levam a outras telas.
  Widget _cadastros() {
    return ListView(
      children: [
        _cadastroTile(
          titulo: 'Vídeo Aula',
          context: context,
          routeName: '', // Rota temporária vazia
        ),
        _cadastroTile(
          titulo: 'Aluno',
          context: context,
          routeName: '', // Rota temporária vazia
        ),
        _cadastroTile(
          titulo: 'Fabricante',
          context: context,
          routeName: '', // Rota temporária vazia
        ),
        _cadastroTile(
          titulo: 'Sala',
          context: context,
          routeName: '', // Rota temporária vazia
        ),
        _cadastroTile(
          titulo: 'Tipo Manutenção',
          context: context,
          routeName: '', // Rota temporária vazia
        ),
        _cadastroTile(
          titulo: 'Categoria Música',
          context: context,
          routeName: '', // Rota temporária vazia
        ),
        _cadastroTile(
          titulo: 'Banda Artista',
          context: context,
          routeName: '', // Rota temporária vazia
        ),
        _cadastroTile(
          titulo: 'Turma',
          context: context,
          routeName: '', // Rota temporária vazia
        ),
        _cadastroTile(
          titulo: 'Bike',
          context: context,
          routeName: '', // Rota temporária vazia
        ),
        _cadastroTile(
          titulo: 'Música',
          context: context,
          routeName: '', // Rota temporária vazia
        ),
        _cadastroTile(
          titulo: 'Mix Aula (Playlist)',
          context: context,
          routeName: '', // Rota temporária vazia
        ),
        _cadastroTile(
          titulo: 'Grupo Aluno',
          context: context,
          routeName: '', // Rota temporária vazia
        ),
      ],
    );
  }

  /// Constrói o conteúdo da aba 'Aulas'.
  /// (Implementação de exemplo)
  Widget _aulasEAuloes() {
    return ListView(
      children: [
        _cadastroTile(
          titulo: 'Gerenciar Aulas',
          context: context,
          routeName: '', // Rota de exemplo
        ),
        _cadastroTile(
          titulo: 'Agendar Aulão Especial',
          context: context,
          routeName: '', // Rota de exemplo
        ),
      ],
    );
  }

  /// Constrói o conteúdo da aba 'Manutenção'.
  /// (Implementação de exemplo)
  Widget _manutencao() {
    return ListView(
      children: [
        _cadastroTile(
          titulo: 'Registrar Manutenção de Bike',
          context: context,
          routeName: '', // Rota de exemplo
        ),
        _cadastroTile(
          titulo: 'Histórico de Manutenções',
          context: context,
          routeName: '', // Rota de exemplo
        ),
      ],
    );
  }

  /// Constrói o conteúdo da aba 'Recados'.
  /// (Implementação de exemplo)
  Widget _recados() {
    return ListView(
      children: [
        _cadastroTile(
          titulo: 'Enviar Novo Recado',
          context: context,
          routeName: '/recados', // Rota de exemplo
        ),
        _cadastroTile(
          titulo: 'Ver Recados Enviados',
          context: context,
          routeName: '', // Rota de exemplo
        ),
      ],
    );
  }

  //----------------------------------------------------------------------------
  // Componentes Locais (Gerados por Métodos)
  //----------------------------------------------------------------------------

  /// Componente local para um cartão de informações na 'Visão Geral'.
  ///
  /// Um método que retorna um [Card] estilizado para exibir um ícone,
  /// um valor e um título.
  Widget _infoCard({
    required IconData icon,
    required String valor,
    required String titulo,
    required BuildContext context,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 4.0, // Sombra sutil para dar profundidade.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Bordas arredondadas.
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centraliza o conteúdo verticalmente.
          crossAxisAlignment:
              CrossAxisAlignment
                  .center, // Centraliza o conteúdo horizontalmente.
          children: [
            Icon(icon, size: 40.0, color: colorScheme.primary),
            const SizedBox(height: 12.0),
            Text(
              valor,
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              titulo,
              style: textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Componente local para um item de lista nas abas de cadastro/gerenciamento.
  ///
  /// Um método que retorna um [ListTile] estilizado que, ao ser tocado,
  /// navega para a rota especificada.
  Widget _cadastroTile({
    required String titulo,
    required BuildContext context,
    required String routeName,
  }) {
    return ListTile(
      title: Text(titulo),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),
      onTap: () {
        // Ação de navegação ao tocar no item.
        // Atualmente, as rotas estão vazias, então nada acontecerá.
        // Substitua '' pelo nome da rota correta quando ela for criada.
        if (routeName.isNotEmpty) {
          Navigator.pushNamed(context, routeName);
        } else {
          // Opcional: Exibe uma mensagem informando que a tela não foi implementada.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'A tela para "$titulo" ainda não foi implementada.',
              ),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
    );
  }
}
