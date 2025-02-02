import 'package:flutter/foundation.dart';
import '../../data/models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => [..._tasks];

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateComplete(Task task) {
    _tasks[_tasks.indexOf(task)].isDone = !_tasks[_tasks.indexOf(task)].isDone;
    notifyListeners();
  }

  void updateTask(Task task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex] = task;
    notifyListeners();
  }

  void updateTaskPriority(Task task) {
    final index = _tasks.indexOf(task);
    
    notifyListeners();
  }


  void updateTaskStatus(Task task) {
    final index = _tasks.indexOf(task);

    notifyListeners();
  }


  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }


  // You can also add methods for fetching and managing tasks
}
