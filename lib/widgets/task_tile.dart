import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function(bool?) onChanged;
  final void Function() onDeleted;
  final void Function() onEdited;

  const TaskTile({
    required this.title,
    required this.isDone,
    required this.onChanged,
    required this.onDeleted,
    required this.onEdited,

  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: isDone,
        onChanged: onChanged,
      ),
      trailing: CloseButton(
        onPressed: onDeleted,
      ),
      onTap: onEdited,
    );
  }
}