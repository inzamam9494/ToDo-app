import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  String taskName;
  bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
   ToDoTile({
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
     required this.deleteFunction,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(10),)
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.yellow
          ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged,
              activeColor: Colors.black,),
              Text(taskName,
              style: TextStyle(decoration: taskCompleted?
              TextDecoration.lineThrough : TextDecoration.none),)
            ],
          ),
        ),
      ),
    );
  }
}
