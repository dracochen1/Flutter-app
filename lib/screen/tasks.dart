import 'package:flutter/material.dart';
import '../model/task.dart';
import 'details.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key, required this.tasks}) : super(key: key);
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
      itemCount: tasks.length,
      // Add container ici pour afficher les détails, surement passer statefull.
      itemBuilder: (context, index)
      => ListTile(
              title: Text(tasks[index].title),
              subtitle: Text(tasks[index].description),
              trailing: tasks[index].complete != true ? const Icon(Icons.access_alarms) : const Icon(Icons.visibility_off),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(task: tasks[index]),
                ),
              );
            }),
      ),
    );
  }
}