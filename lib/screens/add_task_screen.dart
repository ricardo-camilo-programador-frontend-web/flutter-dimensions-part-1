import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final DateTime _creationDate = DateTime.now();
  final DateTime _dueDate = DateTime.now();
  final String _priority = 'Low';
  final String _status = 'Pending';
  final String _updatedAt = DateTime.now().toString();


  void _addTask(BuildContext context) {
    final taskText = _taskController.text;
    final descriptionText = _descriptionController.text;
    final creationDate = _creationDate.toString();
    final dueDate = _dueDate.toString();
    final priority = _priority;
    final status = _status;
    final updatedAt = _updatedAt;

    if (taskText.isNotEmpty) {
      Provider.of<TaskProvider>(context, listen: false).addTask(
        Task(
          id: DateTime.now().toString(),
          title: taskText,
          description: descriptionText,
          creationDate: creationDate,
          dueDate: dueDate,
          priority: priority,
          status: status,
          updatedAt: updatedAt,
          isDone: false,
        )
      );
      Navigator.of(context).pop();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _taskController,
              decoration: InputDecoration(labelText: 'Task'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _addTask(context),
              child: Text('Add Task'),
            )

          ]
        )
      ) // Implement the form to add a task here
    );
  }}
