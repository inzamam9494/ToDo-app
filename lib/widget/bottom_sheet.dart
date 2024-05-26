import 'package:flutter/material.dart';

import 'color_choosing.dart';

class MyBottomSheet extends StatelessWidget {
   MyBottomSheet({super.key});

   TextEditingController textEditingController = TextEditingController();

   final List todoList = [];

   void saveNewTask(){
     todoList.add([textEditingController, Color]);
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              hintText: "Enter the Task"
            ),
          ),
          // ColorChooser(),
          Card(
            elevation: 2,
            shape: const CircleBorder(),
            child: IconButton(
              onPressed: () {
                saveNewTask();
              },
              icon: const Icon(Icons.check),
            ),
          )
        ],
      ),
    );
  }
}
