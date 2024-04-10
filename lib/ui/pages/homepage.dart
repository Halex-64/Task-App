import 'package:flutter/material.dart';
import 'package:login_cadastro/database/task_database.dart';
import 'package:login_cadastro/model/task_model.dart';
import 'package:login_cadastro/ui/widgets/myAppBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskDataBase taskDataBase = TaskDataBase();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MyAppBar(texto: 'Tarefas'),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Adicione Suas Tarefas!'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  hintText: 'Titulo', border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: descController,
              decoration: const InputDecoration(
                  hintText: 'Descrição', border: OutlineInputBorder()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Lista de Tarefas'),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  taskDataBase.addTask(Task(
                      title: titleController.text, desc: descController.text));
                  titleController.clear();
                  descController.clear();
                });
              },
              child: const Text('Adicionar Tarefa')),
          Expanded(
            child: ListView.builder(
                itemCount: taskDataBase.tasks.length,
                itemBuilder: (context, index) {
                  Task task = taskDataBase.tasks[index];
                  return ListTile(
                    title: Text(task.title),
                    subtitle: Text(task.desc),
                    leading: IconButton(
                      icon: const Icon(Icons.check, color: Colors.greenAccent),
                      onPressed: () {
                        taskDataBase.removeTask(index);
                      },
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        setState(() {
                          taskDataBase.removeTask(index);
                        });
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
