import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TaskProvider>(context);
    final taskController = TextEditingController();

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
                onDeleted: () {
                  tasksProvider.deleteTask(index);
                },
                onEdited: () async {
                  await showDialog<void>(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Column(
                              //clipBehavior: Clip.none,
                              children: <Widget>[
                                CloseButton(onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                                const Text(
                                  "Edit Task",
                                ),
                                TextField(
                                  controller: taskController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter new task',
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                                  onPressed: () {
                                    tasksProvider.editTask(index, taskController.text);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Update Task'),
                                ),
                              ],
                            ),
                          ));
                });
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
