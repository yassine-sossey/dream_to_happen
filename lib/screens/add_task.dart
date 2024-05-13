import 'package:dream_to_happen/screens/principale_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dream_to_happen/constants.dart';
import 'package:dream_to_happen/widgets/task_list.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    String newTask = '';
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 191, 248, 191),
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('ADD A NEW TASK '),
                    TextField(
                      decoration: kNexTaskDec,
                      onChanged: (value) {
                        newTask = value;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<RemainedTasksNumber>(context, listen: false)
                            .detailedTaskList
                            .add(TaskTile(
                              taskContent: newTask,
                            ));
                        Provider.of<RemainedTasksNumber>(context, listen: false)
                            .newTaskAdded();
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                      },
                      child: const Text('confirm'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
