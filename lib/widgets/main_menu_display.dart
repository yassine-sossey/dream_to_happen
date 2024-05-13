import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dream_to_happen/screens/principale_screen.dart';

Padding mainMenuDisplay(BuildContext context) {
  //RemainedTasksNumber tasksNumber = RemainedTasksNumber();
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 40,
          child: Icon(
            Icons.list,
            size: 70,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Dreams to Happen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 114, 106, 37),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
            'remained tasks : ${Provider.of<RemainedTasksNumber>(context).remainedTasksNumber}'),
      ],
    ),
  );
}
