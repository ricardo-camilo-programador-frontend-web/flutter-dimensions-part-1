import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';

class EditTaskScreen extends StatefulWidget {
  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late Task _task;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null || args is! Task) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed('/');
      });
      return;
    }

    _task = args;
    _taskController.text = _task.title;
    _descriptionController.text = _task.description;
  }

  @override
  void dispose() {
    _taskController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _editTask(BuildContext context) {
    final taskText = _taskController.text;
    final descriptionText = _descriptionController.text;
    final creationDate = _task.creationDate;
    final dueDate = _task.dueDate;
    final priority = _task.priority;
    final status = _task.status;

    final updatedAt = _task.updatedAt;

    Provider.of<TaskProvider>(context, listen: false).updateTask(
      Task(
        id: _task.id,
        title: taskText,
        description: descriptionText,
        creationDate: creationDate,
        dueDate: dueDate,
        priority: priority,
        status: status,
        updatedAt: updatedAt,
        isDone: _task.isDone,
      )
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[

            TextField(
              controller: _taskController,
              decoration: InputDecoration(labelText: 'Task'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => _editTask(context),
              child: Text('Edit Task'),
            )
          ]
        )
      ) // Implement the form to edit a task here
    );
  }}
