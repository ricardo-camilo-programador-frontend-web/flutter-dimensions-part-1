import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => [..._tasks];


  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  // Impplement methods to update and delete tasks

  // You can also add methods for fetching and managing tasks
}