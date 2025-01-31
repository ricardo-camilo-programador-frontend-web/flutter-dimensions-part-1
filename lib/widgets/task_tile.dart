import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String description;
  final String creationDate;
  final String dueDate;
  final String priority;
  final String status;
  final String updatedAt;
  final bool isDone;
  final Function(bool?) onToggle;
  final Function() onEdit;
  final Function() onDelete;


  TaskTile({
    required this.title,
    required this.description,
    required this.creationDate,
    required this.dueDate,
    required this.priority,
    required this.status,
    required this.updatedAt,
    required this.isDone,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,

  });



  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: isDone,
        onChanged: onToggle,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onEdit,
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete),
          )
        ]
      )

    );
  }


}
