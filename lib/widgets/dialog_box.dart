import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  DialogBox({super.key, required this.controller,
  required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        backgroundColor: Colors.yellow,
        content: Container(
          padding: const EdgeInsets.all(10),
          height: 150,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add new task"
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  },
                      child: const Text("cancel",
                      style: TextStyle(
                        color: Colors.black
                      ),)),
                  const SizedBox(width: 10,),
                  ElevatedButton(onPressed: onSave,
                      child: const Text("Save",
                          style: TextStyle(
                              color: Colors.black
                          )))
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

