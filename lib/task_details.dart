import 'package:flutter/material.dart';

class TaskDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> task =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la tâche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Titre: ${task['title']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Description: ${task['description']}'),
            SizedBox(height: 10),
            Text('Début: ${task['startDate']}'),
            SizedBox(height: 10),
            Text('Fin: ${task['endDate']}'),
          ],
        ),
      ),
    );
  }
}
