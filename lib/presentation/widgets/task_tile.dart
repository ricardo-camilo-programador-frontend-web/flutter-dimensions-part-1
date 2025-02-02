import 'package:flutter/material.dart';

enum TaskPriority {
  low,
  medium,
  high,
}

enum TaskStatus {
  pending,
  completed,
}

class TaskTile extends StatelessWidget {

  final String title;
  final String description;
  final String creationDate;
  final String dueDate;
  final TaskPriority priority;
  final TaskStatus status;
  final String updatedAt;
  final bool isDone;
  final Function(bool?) onToggle;
  final Function() onEdit;
  final Function() onDelete;


  final Function() onDetail;
  final Function(TaskPriority) onChancePriority;
  final Function(bool) onChanceStatus;


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
    required this.onDetail,
    required this.onChancePriority,
    required this.onChanceStatus,
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
          ),
          IconButton(
            onPressed: onDetail,
            icon: Icon(Icons.info),
          ),
          IconButton(
            onPressed: () => onChancePriority(priority),
            icon: Icon(Icons.priority_high),
          ),
          IconButton(
            onPressed: () => onChanceStatus(status == TaskStatus.pending),
            icon: Icon(Icons.pending_actions),
          )
        ]
      )

    );
  }


}
