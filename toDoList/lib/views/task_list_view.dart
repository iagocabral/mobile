import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart';

class TaskListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implementar a busca
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Implementar o menu de configurações
            },
          ),
        ],
      ),

      body: Consumer<TaskViewModel>(
        builder: (context, taskViewModel, child) {
          if (taskViewModel.tasks.isEmpty) {
            return Center(
              child: Text(
                'Nenhuma tarefa adicionada ainda',
                style: Theme.of(context).textTheme.bodyLarge, // Atualizado para bodyLarge
              ),
            );
          }
          return ListView.builder(
            itemCount: taskViewModel.tasks.length,
            itemBuilder: (context, index) {
              final task = taskViewModel.tasks[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4, // Adiciona sombra ao card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.task_alt, // Ícone que melhor representa uma tarefa
                      color: task.isCompleted
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.grey, // Cor muda se a tarefa estiver concluída
                    ),
                    title: Text(
                      task.title,
                      style: TextStyle(
                        decoration: task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none, // Risca a tarefa se concluída
                      ),
                    ),
                    trailing: Checkbox(
                      value: task.isCompleted,
                      onChanged: (value) {
                        taskViewModel.toggleTaskCompletion(index);
                      },
                      activeColor: Theme.of(context).colorScheme.secondary, // Cor do Checkbox
                    ),
                    onLongPress: () => taskViewModel.removeTask(index),
                  ),
                ),
              );
            },
          );
        },
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        backgroundColor: Theme.of(context).colorScheme.secondary, // Usar a cor secundária no botão
        child: Icon(Icons.add),
      ),
    );
  }
}