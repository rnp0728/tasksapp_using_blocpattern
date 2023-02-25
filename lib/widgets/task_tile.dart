import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';
import '../models/task.dart';
class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () => context.read<TasksBloc>().add(DeleteTask(task: task)),
      title: Text(task.title, style: TextStyle(
          decoration: task.isDone! ? TextDecoration.lineThrough : TextDecoration
              .none),),
      trailing: Checkbox(
        onChanged: (value) {
          context.read<TasksBloc>().add(UpdateTask(task: task));
        },
        value: task.isDone,
      ),
    );
  }
}