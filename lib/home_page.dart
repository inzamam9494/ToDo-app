import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/core/database/local_database.dart';
import 'package:to_do_app/widgets/ToDo_tile.dart';
import 'package:to_do_app/widgets/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  // reference
  final _myBox = Hive.box('myBox');

  LocalDatabase db = LocalDatabase();

  void checkBoxChanged(bool value, int index){
    setState(() {
      db.listTODO[index][1] = !db.listTODO[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask(){
    setState(() {
      db.listTODO.add([_controller.text, false]);
      _controller.clear();
      Navigator.pop(context);
    });
    db.updateDatabase();
  }

  void createNewTask(){
    showDialog(context: context,
        builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
      );
        });
  }

  void deleteTask(int index){
    setState(() {
      db.listTODO.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  void initState() {
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TO DO'),
        shadowColor: Colors.black,
        elevation: 2,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: db.listTODO.length,
            itemBuilder: (context,index){
            return ToDoTile(
              taskName: db.listTODO[index][0],
              taskCompleted: db.listTODO[index][1],
              onChanged: (value) => checkBoxChanged(value!, index),
              deleteFunction: (context) => deleteTask(index),
            );
            }),
      ),
    );
  }
}
