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

class Task {
  final String id;
  final String title;
  final String description;
  final String creationDate;
  final String dueDate;
  final TaskPriority priority;
  final TaskStatus status;
  final String updatedAt;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.dueDate,
    required this.priority,
    required this.status,
    required this.updatedAt,
    required this.isDone,
  });
}
