import 'package:flutter/material.dart';
import '../widgets/task_list.dart';
import 'add_task.dart';
import '../widgets/main_menu_display.dart';

class DreamToHappenApp extends StatelessWidget {
  const DreamToHappenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //add a new task button
        floatingActionButton: const AddTask(),
        backgroundColor: const Color.fromARGB(255, 191, 248, 191),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //settings, numer of task amd main title
            mainMenuDisplay(context),
            const SizedBox(
              height: 30,
            ),
            //list of tasks
            const TaskList(),
          ],
        ),
      ),
    );
  }
}

class RemainedTasksNumber extends ChangeNotifier {
  int remainedTasksNumber = 0;
  List<TaskTile> detailedTaskList = [];

  void taskDone() {
    remainedTasksNumber--;
    notifyListeners();
  }

  void newTaskDone() {
    remainedTasksNumber++;
    notifyListeners();
  }

  void taskDelete(String itemtotremove) {
    debugPrint(detailedTaskList.length.toString());
    detailedTaskList.removeWhere((task) => task.taskContent == itemtotremove);
    debugPrint(detailedTaskList.length.toString());
    notifyListeners();
  }

  void newTaskAdded() {
    remainedTasksNumber++;
    debugPrint([...detailedTaskList].toString());
    notifyListeners();
  }
}
