import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class ToDoTile extends StatelessWidget {
  final String myText;
  final Color color;
  Function(BuildContext) deleteFunction;
   ToDoTile({super.key, required this.myText, required this.color, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade400,
                  borderRadius: BorderRadius.circular(50),
                ),
              ],
            ),
        child: Container(
          padding: const EdgeInsets.only(left: 15),
          height: 70,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.black
            ),
            color: color
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: RoundCheckBox(
                  onTap: (selected){},
                  size: 50,
                  checkedColor: Colors.black,
                  borderColor: Colors.black,
                ),
              ),
               Text(myText,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
