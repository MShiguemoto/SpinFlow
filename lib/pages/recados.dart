import 'package:flutter/material.dart';
import 'package:in_class/components/recados.dart';
import 'package:intl/intl.dart';

// Cole a classe Recado (do passo 2) aqui ou em um arquivo separado.

/// Tela para visualizar e gerenciar a lista de recados.
///
/// Permite ao usuário ver os recados existentes, adicionar novos,
/// editar e excluir recados através de uma interface intuitiva.
class TelaRecados extends StatefulWidget {
  const TelaRecados({super.key});

  @override
  State<TelaRecados> createState() => _TelaRecadosState();
}

class _TelaRecadosState extends State<TelaRecados> {
  // Lista de recados. Em um aplicativo real, esses dados viriam de um
  // banco de dados ou de uma API. Aqui, usamos dados de exemplo.
  final List<Recado> _listaRecados = [
    Recado(
      id: 1,
      titulo: "Lembrete Reunião de Pais",
      descricao:
          "A reunião será na próxima sexta-feira às 19h. Trazer o relatório de performance dos alunos.",
      dataCriacao: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Recado(
      id: 2,
      titulo: "Manutenção da Bike 5",
      descricao:
          "A Bike 5 está com o pedal fazendo barulho. Precisa ser verificado pela manutenção.",
      dataCriacao: DateTime.now().subtract(const Duration(days: 3)),
      lido: true,
    ),
    Recado(
      id: 3,
      titulo: "Comprar Novas Músicas",
      descricao:
          "Pesquisar e comprar novas músicas para o Mix de Julho. Focar em pop e rock anos 90.",
      dataCriacao: DateTime.now().subtract(const Duration(days: 5)),
    ),
  ];

  /// Navega para a tela ou mostra um diálogo para criar um novo recado.
  void _adicionarRecado() {
    _mostrarDialogoDoRecado();
  }

  /// Mostra um diálogo de confirmação antes de excluir um recado.
  void _excluirRecado(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmar Exclusão"),
          content: const Text("Deseja realmente excluir este recado?"),
          actions: [
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text("Excluir"),
              onPressed: () {
                // setState notifica o Flutter que o estado mudou,
                // fazendo com que a UI seja reconstruída com a lista atualizada.
                setState(() {
                  _listaRecados.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// Mostra um diálogo para adicionar um novo recado ou editar um existente.
  ///
  /// Se [recadoParaEditar] for fornecido, o diálogo preenche os campos
  /// para edição. Caso contrário, abre um formulário em branco para criação.
  void _mostrarDialogoDoRecado({Recado? recadoParaEditar, int? index}) {
    final _tituloController = TextEditingController();
    final _descricaoController = TextEditingController();
    final bool isEditing = recadoParaEditar != null;

    if (isEditing) {
      _tituloController.text = recadoParaEditar.titulo;
      _descricaoController.text = recadoParaEditar.descricao;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isEditing ? "Editar Recado" : "Novo Recado"),
          content: Column(
            mainAxisSize:
                MainAxisSize.min, // Faz a coluna ocupar o mínimo de espaço.
            children: [
              TextField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: "Título"),
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: "Descrição"),
                textCapitalization: TextCapitalization.sentences,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text("Salvar"),
              onPressed: () {
                final titulo = _tituloController.text;
                final descricao = _descricaoController.text;

                if (titulo.isNotEmpty && descricao.isNotEmpty) {
                  setState(() {
                    if (isEditing && index != null) {
                      // Atualiza o recado existente na lista.
                      _listaRecados[index] = Recado(
                        id: recadoParaEditar.id,
                        titulo: titulo,
                        descricao: descricao,
                        dataCriacao: recadoParaEditar.dataCriacao,
                        lido: recadoParaEditar.lido,
                      );
                    } else {
                      // Adiciona um novo recado à lista.
                      _listaRecados.insert(
                        0,
                        Recado(
                          id:
                              DateTime.now()
                                  .millisecondsSinceEpoch, // ID único simples
                          titulo: titulo,
                          descricao: descricao,
                          dataCriacao: DateTime.now(),
                        ),
                      );
                    }
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gerenciar Recados')),
      body:
          _listaRecados.isEmpty
              ? const Center(
                child: Text(
                  'Nenhum recado encontrado.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: _listaRecados.length,
                itemBuilder: (context, index) {
                  final recado = _listaRecados[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    child: ListTile(
                      // Ícone indica se o recado foi lido ou não
                      leading: Icon(
                        recado.lido
                            ? Icons.mark_email_read_outlined
                            : Icons.mark_email_unread,
                        color:
                            recado.lido
                                ? Colors.grey
                                : Theme.of(context).colorScheme.primary,
                      ),
                      // Título em negrito se não foi lido
                      title: Text(
                        recado.titulo,
                        style: TextStyle(
                          fontWeight:
                              recado.lido ? FontWeight.normal : FontWeight.bold,
                        ),
                      ),
                      // Subtítulo com a data formatada
                      subtitle: Text(
                        'Criado em: ${DateFormat('dd/MM/yyyy').format(recado.dataCriacao)}',
                        style: const TextStyle(color: Colors.black54),
                      ),
                      // Botões de ação para editar e excluir
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit_outlined,
                              color: Colors.blueGrey,
                            ),
                            onPressed:
                                () => _mostrarDialogoDoRecado(
                                  recadoParaEditar: recado,
                                  index: index,
                                ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.redAccent,
                            ),
                            onPressed: () => _excluirRecado(index),
                          ),
                        ],
                      ),
                      onTap: () {
                        // Marca o recado como lido ao ser tocado
                        setState(() {
                          recado.lido = true;
                        });
                      },
                    ),
                  );
                },
              ),
      // Botão flutuante para adicionar novos recados.
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarRecado,
        tooltip: 'Adicionar Novo Recado',
        child: const Icon(Icons.add),
      ),
    );
  }
}
