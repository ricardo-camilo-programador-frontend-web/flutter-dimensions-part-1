class Task {
  final String id;
  final String title;
  final String description;
  final String creationDate;
  final String priority;
  final String status;
  final String updatedAt;
  final String dueDate;
  bool isDone;



  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.priority,
    required this.status,
    required this.updatedAt,
    required this.dueDate,
    this.isDone = false,
  });


}
