import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dream_to_happen/screens/principale_screen.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: ListView.builder(
          itemCount:
              Provider.of<RemainedTasksNumber>(context).detailedTaskList.length,
          itemBuilder: (context, index) =>
              Provider.of<RemainedTasksNumber>(context).detailedTaskList[index],
        ),
      ),
    );
  }
}

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
    required this.taskContent,
  });
  final String taskContent;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<RemainedTasksNumber>(
      builder: (context, taskData, child) => ListTile(
        title: Text(
          widget.taskContent,
          style: TextStyle(
              decoration: ischecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: ischecked,
          onChanged: (value) {
            setState(() {
              ischecked = (value == null) ? false : value;
              ischecked ? taskData.taskDone() : taskData.newTaskDone();
            });
          },
        ),
        onLongPress: () {
          taskData.taskDelete(widget.taskContent);
          ischecked ? null : taskData.taskDone();
        },
      ),
    );
  }
}
