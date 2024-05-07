import 'package:hive/hive.dart';

class LocalDatabase {
  List listTODO = [];

//   reference
  final _myBox = Hive.box('myBox');

  void createInitialData(){
    listTODO = [
      ["Make Tutorial", false],
      ["Read The BOOK", false]
    ];
  }

  void loadData(){
    listTODO = _myBox.get("TODOLIST");
  }

  void updateDatabase(){
    _myBox.put("TODOLIST", listTODO);
  }

}