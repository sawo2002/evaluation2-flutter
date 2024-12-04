import 'package:flutter/material.dart';

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Map<String, dynamic>> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des tâches'),
      ),
      body: tasks.isEmpty
          ? Center(
              child: Text(
                'Aucune tâche disponible. Cliquez sur le bouton pour en ajouter.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(task['title']),
                    subtitle: Text(
                      'Description: ${task['description']}\n'
                      'Début: ${task['startDate']}\n'
                      'Fin: ${task['endDate']}',
                    ),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/taskDetails',
                        arguments: task,
                      );
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          tasks.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/taskForm');
          if (result != null && result is Map<String, dynamic>) {
            setState(() {
              tasks.add(result);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
