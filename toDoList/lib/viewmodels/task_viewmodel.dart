import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(Task(title: title));
    notifyListeners();// Notifica a view que o estado mudou
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();// Notifica a view que o estado mudou
  }

  void toggleTaskCompletion(int index){
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();// Notifica a view que o estado mudou
  }

}