import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../logic/providers/task_provider.dart';
import '../../data/models/task.dart';
import '../widgets/task_tile.dart';
import '../widgets/custom_dropdown.dart';
import '../theme/app_colors.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final DateTime _creationDate = DateTime.now();
  final DateTime _dueDate = DateTime.now();
  TaskPriority _priority = TaskPriority.low;
  TaskStatus _status = TaskStatus.pending;
  final String _updatedAt = DateTime.now().toString();

  void _addTask(BuildContext context) {
    final taskText = _taskController.text;
    final descriptionText = _descriptionController.text;
    final creationDate = _creationDate.toString();
    final dueDate = _dueDate.toString();
    final priority = _priority.name;
    final status = _status.name;
    final updatedAt = _updatedAt;

    if (taskText.isNotEmpty) {
      Provider.of<TaskProvider>(context, listen: false).addTask(Task(
        id: DateTime.now().toString(),
        title: taskText,
        description: descriptionText,
        creationDate: creationDate,
        dueDate: dueDate,
        priority: priority,
        status: status,
        updatedAt: updatedAt,
        isDone: false,
      ));
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
            child: Column(children: <Widget>[
              TextField(
                controller: _taskController,
                decoration: InputDecoration(labelText: 'Task'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2.0,
                    ),
                  ),
                ),
                maxLines: 3,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 20),
              CustomDropdown<TaskPriority>(
                label: 'Priority',
                value: _priority,
                items: TaskPriority.values.map((priority) {
                  return DropdownMenuItem(
                    value: priority,
                    child: Text(priority.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _priority = value);
                  }
                },
              ),
              SizedBox(height: 20),
              CustomDropdown<TaskStatus>(
                label: 'Status',
                value: _status,
                items: TaskStatus.values.map((status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(status.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _status = value);
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  textStyle: TextStyle(color: Colors.white),
                ),
                onPressed: () => _addTask(context),
                child: Text('Add Task'),
              )
            ])) // Implement the form to add a task here
        );
  }
}
