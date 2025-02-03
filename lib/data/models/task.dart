import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
enum TaskPriority {
  @HiveField(0)
  low,
  @HiveField(1)
  medium,
  @HiveField(2)
  high,
}


@HiveType(typeId: 2)
enum TaskStatus {
  @HiveField(0)
  pending,
  @HiveField(1)
  completed,
}

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String creationDate;

  @HiveField(4)
  final String dueDate;

  @HiveField(5)
  TaskPriority priority;

  @HiveField(6)
  TaskStatus status;

  @HiveField(7)
  final String updatedAt;

  @HiveField(8)
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
