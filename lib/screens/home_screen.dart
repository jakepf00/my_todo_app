import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) => ListView.builder(
          itemCount: taskProvider.tasks.length,
          itemBuilder: (ctx, index) {
            final task = taskProvider.tasks[index];
            return TaskTile(
              title: task.title,
              isDone: task.isDone,
              onChanged: (value) {
                tasksProvider.toggleTaskCompletion(index);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-task');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
