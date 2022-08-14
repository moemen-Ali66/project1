import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/moduels/archived_tasks/archived_tasks.dart';
import 'package:todo_app/moduels/done_tasks/done_tasks.dart';
import 'package:todo_app/moduels/new_tasks/new_tasks.dart';
import 'package:todo_app/shared/cubit/states.dart';


class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppInitialStates());
  static AppCubit get(context)=>BlocProvider.of(context);
  int curentindex = 0;
  List tasks=[];
  late Database database;

  List<Widget> screens = [
    new_tasks(),
    done_tasks(),
    archive_tasks(),
  ];
  List<String> title = [
    'New_Tasks',
    'Done_Tasks',
    'archive_Tasks',
  ];
  List<Map>newTasks=[];
  List<Map>doneTasks=[];
  List<Map>archiveTasks=[];

  void ChangeIndex(int index){
    curentindex=index;
    emit(AppChangeNavBarStates());
  }
  void createdatabase()  {
    openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database, version) {
          print('database created');
          database
              .execute(
              'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT ) ')
              .then((value) {
            print('table is creating');
          }).catchError((error) {
            print('error in creating table${error.toString()}');
          });
        },
        onOpen: (database) {
          print('database opened');
          getdatabase(database);
        }).then((value) {
      database=value;
      emit(AppCreateDataBaseStates());
    });
  }

  insertdatabase({required title, required time, required date}) async {
    await database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO tasks(title,date,time,status) values("$title","$time","$date","new")')
          .then((value) {
        print('values is inserting');
        emit(AppInsertDataBaseStates());

      }).catchError((error) {
        print('error in database for insert${error.toString()}');
      });
      return null;
    });
    getdatabase(database);
  }

  void getdatabase(database)   {
    newTasks=[];
    doneTasks=[];
    archiveTasks=[];

    emit(AppGetDataBaseLoadingStates());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if(element['status']=='new')
          newTasks.add(element);

        else if(element['status']=='done')
          doneTasks.add(element);

        else archiveTasks.add(element);

      });
      emit(AppGetDataBaseStates());

    });
  }
  void updatedatabase({
    required String status,
    required int id,
  })async{
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getdatabase(database);
      emit(AppUpDateDataBaseStates());
    });
  }
  void deletedatabase({
    required int id,
  })async{
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getdatabase(database);
      emit(AppDeleteDataBaseStates());
    });
  }

  bool isbottomsheet = false;
  IconData? fapicon = Icons.edit;
  void changebottomsheet({required isShow,required icon}){
    isbottomsheet=isShow;
    fapicon=icon;
    emit(AppChangeBottomSheetStates());
  }
}
