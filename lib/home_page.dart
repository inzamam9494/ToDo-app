import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/widget/color_choosing.dart';
import 'package:to_do_app/widget/todo_tile.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;
  const HomePage({super.key,required this.toggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

DateTime now = DateTime.now();

class _HomePageState extends State<HomePage> {

  // reference the hive box
  final _myBox = Hive.box('mybox');

  bool isDarkMode = false;

  // void toggleTheme() {
  //   setState(() {
  //     isDarkMode = !isDarkMode;
  //   });
  // }

  ToDoDataBase db = ToDoDataBase();
  
  TextEditingController textEditingController = TextEditingController();
  Color selectedColor = Colors.amber;

  void saveNewTask(){
    setState(() {
      db.todoList.add([textEditingController.text, selectedColor]);
    });
    textEditingController.clear();
    db.updateDataBase();
  }

  void updateSelectColor(Color color){
    setState(() {
      selectedColor = color;
    });
    db.updateDataBase();
  }

  void deleteToDoList(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  void initState() {
    // TODO: implement initState
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }else{
      db.loadData();
    };
    super.initState();
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
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${now.day} ${DateFormat.LLLL().format(now)} ${now.year}",
                  // now.copyWith(day: now.day + now.month + now.year, ).toString(),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  DateFormat.EEEE().format(now),
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
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
                  onPressed: widget.toggleTheme,
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
              itemCount: db.todoList.length,
              itemBuilder: (context, index) {
                String todoText = db.todoList[index][0];
                Color todoColor = db.todoList[index][1];
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
