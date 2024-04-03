import 'package:flutter/material.dart';
import 'package:login_cadastro/database/task_database.dart';
import 'package:login_cadastro/model/task_model.dart';
import 'package:login_cadastro/ui/widgets/myAppBar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TaskDataBase taskDataBase = TaskDataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(texto: 'Lista de Tarefas'),
      body: ListView.builder(
          itemCount: taskDataBase.tasks.length,
          itemBuilder: (context, index) {
            Task task = taskDataBase.tasks[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.desc),
            );
          }),
    );
  }
}
