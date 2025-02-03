import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/add_task_screen.dart';
import 'presentation/screens/edit_task_screen.dart';
import 'presentation/screens/task_detail_screen.dart';
import 'logic/providers/task_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/models/task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializa o Hive com suporte a Flutter
  await Hive.initFlutter();

  // Registra o adapter para objetos do tipo Todo (caso utilize modelos customizados)
  Hive.registerAdapter<Task>(TaskAdapter());

  // Abre a caixa onde os dados serão armazenados
  await Hive.openBox<Task>('taskBox');

  runApp(ChangeNotifierProvider(
      create: (context) => TaskProvider(), child: const MyTodoApp()));
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TaskProvider(),
        child: MaterialApp(
            title: '⌛ Time Forge - Dimensions Part 1',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: '/',
            routes: {
              '/': (ctx) => HomeScreen(),
              '/add-task': (ctx) => AddTaskScreen(),
              '/edit-task': (ctx) => EditTaskScreen(),
              '/task-detail': (ctx) => TaskDetailScreen(),
            }));
  }
}
