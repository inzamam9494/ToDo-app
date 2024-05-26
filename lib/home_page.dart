import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/widget/bottom_sheet.dart';
import 'package:to_do_app/widget/color_choosing.dart';
import 'package:to_do_app/widget/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List todoList = [
    ["Read Daily UI Article", Colors.amber],
    ["Course work", Colors.blue.shade200],
    ["Workout", Colors.pink.shade200],
    ["Grocery Shopping", Colors.greenAccent.shade200],
    ["Course Work", Colors.red.shade200],
  ];



  TextEditingController textEditingController = TextEditingController();
  Color selectedColor = Colors.amber;

  void saveNewTask(){
    setState(() {
      todoList.add([textEditingController.text, selectedColor]);
    });
    textEditingController.clear();
  }

  void updateSelectColor(Color color){
    setState(() {
      selectedColor = color;
    });
  }

  void deleteToDoList(int index){
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
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
                        ColorChooser(onColorSelected: updateSelectColor),
                        Card(
                          elevation: 2,
                          shape: const CircleBorder(),
                          child: IconButton(
                            onPressed: () {
                              saveNewTask();
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                            icon: const Icon(Icons.check),
                          ),
                        )
                      ],
                    ),
                  );;
                });
          },
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          label: const Icon(Icons.add),
          // child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Container(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "23 MAY 2023",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  "TUESDAY",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                )
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: PhysicalModel(
                color: Colors.white,
                elevation: 3,
                borderRadius: BorderRadius.circular(30),
                child: IconButton(
                  onPressed: () {},
                  icon: Transform.flip(
                      flipX: true, child: const Icon(Icons.dark_mode_outlined)),
                ),
              ),
            )
          ],
        ),

        body: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          height: double.maxFinite,
          child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                String todoText = todoList[index][0];
                Color todoColor = todoList[index][1];
                return Container(
                    child: ToDoTile(
                      myText: todoText,
                      color: todoColor,
                      deleteFunction: (p0) => deleteToDoList(index)),
                    );
              }),
        ));
  }
}
