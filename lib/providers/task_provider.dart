import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void editTask(int index, String newData) {
    _tasks[index].title = newData;
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }
}