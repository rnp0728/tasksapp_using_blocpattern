import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasksapp_using_bloc/services/guid_generator.dart';

import '../blocs/tasks/tasks_bloc.dart';
import '../models/task.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('Add Task', style: TextStyle(fontSize: 23),),
            const SizedBox(height: 10,),
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: InputDecoration(
                  label: const Text('Title'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1),
                  )
              ),
            ),
            const SizedBox(height: 14,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context), icon: const Icon(Icons.cancel),
                    label: const Text('Cancel'),),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: (){
                      var task = Task(id: GUIDGenerator.generate() ,title: titleController.text);
                      context.read<TasksBloc>().add(AddTask(task: task));
                      Navigator.pop(context);
                      titleController.clear();
                    }, icon: const Icon(Icons.done_outline_rounded),
                    label: const Text('Done'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}