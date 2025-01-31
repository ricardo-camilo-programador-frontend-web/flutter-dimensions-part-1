import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return Scaffold(
      appBar: AppBar(
        title: Text('📝 Forge List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (ctx, index) {
          final task = tasks[index];
          return TaskTile(
            title: task.title,
            description: task.description,
            creationDate: task.creationDate,
            dueDate: task.dueDate,
            priority: task.priority,
            status: task.status,
            updatedAt: task.updatedAt,
            isDone: task.isDone,
            onToggle: (value) {
              Provider.of<TaskProvider>(context, listen: false).updateTaskStatus(task);
            },
            onEdit: () {
              Navigator.of(context).pushNamed('/edit-task', arguments: task);
            },
            onDelete: () {
              Provider.of<TaskProvider>(context, listen: false).deleteTask(task);
            },

          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-task');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
