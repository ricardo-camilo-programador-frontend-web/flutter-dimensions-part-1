import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function(bool?) onToggle;
  final Function() onDelete;

  TaskTile({
    required this.title,
    required this.isDone,
    required this.onToggle,
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
      trailing: IconButton(
        onPressed: onDelete,
        icon: Icon(Icons.delete),
      ),
    );
  }


}
