import 'package:flutter/material.dart';
import 'task_list.dart';
import 'task_form.dart';
import 'task_details.dart';

void main() {
  runApp(TaskManagementApp());
}

class TaskManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des Tâches',
      initialRoute: '/',
      routes: {
        '/': (context) => TaskListPage(),
        '/taskForm': (context) => TaskFormPage(),
        '/taskDetails': (context) => TaskDetailsPage(),
      },
    );
  }
}
