import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => [..._tasks];


  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTaskStatus(Task task) {
    _tasks[_tasks.indexOf(task)].isDone = !_tasks[_tasks.indexOf(task)].isDone;
    notifyListeners();
  }
  // You can also add methods for fetching and managing tasks
}