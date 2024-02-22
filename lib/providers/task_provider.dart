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

  void toggleTaskCompletion(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }

  // TODO: implement methods to update and delete tasks
  // Also for fetching and managing tasks
}