import 'package:login_cadastro/model/task_model.dart';

class TaskDataBase {
  List<Task> tasks = [
    Task(title: 'Limpar Quarto', desc: 'Estou precisando limpar meu quarto'),
  ];

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }
}

