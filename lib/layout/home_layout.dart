import 'package:flutter/material.dart';
import 'package:login/modules/Archive%20Tasks/archive%20tasks.dart';
import 'package:login/modules/Done%20Tasks/done%20tasks.dart';
import 'package:login/modules/New%20Tasks/new%20tasks.dart';
// import 'package:sqflite/sqflite.dart';

class home_layout extends StatefulWidget {
  const home_layout({Key? key}) : super(key: key);

  @override
  State<home_layout> createState() => _home_layoutState();
}

class _home_layoutState extends State<home_layout> {
  int curentindex=0;
  List<Widget>screens=[
    new_tasks(),
    done_tasks(),
    archive_tasks(),
  ];
  List<String>title=[
    'New_Tasks',
    'Done_Tasks',
    'archive_Tasks',
  ];
  var scaffoldkey=GlobalKey<ScaffoldState>();
  bool? isbottomsheet=false;
//.  Database? database;
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text(title[curentindex]),
      ),
       floatingActionButton:FloatingActionButton(
         child:Icon(Icons.eleven_mp),
          onPressed: ()
          {
            if(isbottomsheet!){
              scaffoldkey.currentState?.showBottomSheet((context) => Container(
                width: double.infinity,
                height: 120,
                color: Colors.red,
              ));
            }
            else{
              Navigator.pop(context);
              isbottomsheet=false;
            }

          },) ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curentindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.task_alt_outlined),label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline),label: 'Done'),
          BottomNavigationBarItem(icon: Icon(Icons.archive_outlined),label: 'Archive'),
        ],
        onTap: (index){
          setState(() {
            curentindex=index;
          });
        },
      ),
      body:screens[curentindex],
    );
  }

  Future<String> getName() async
  {
    return  'ahmed ali';
  }

 //  void createdatabase()async
 //  {
 //      database=await openDatabase(
 //    'todo.db',
 //   version: 1,
 //   onCreate: (database,version){
 //      print('database created');
 //      database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT ) ').then((value){
 //        print('table is creating');
 //      }).catchError((error){
 //        print('error in creating table${error.toString()}');
 //      });
 //   },
 //   onOpen: (database){
 //     print('database opened');
 //
 //   },
 //
 // );
 //
 //  }
 //  void insertdatabase(){
 //    database!.transaction((txn) {
 //      txn.rawInsert('INSERT INTO tasks(title,date,time,status) values("first task","2202","12:00","new",)').then((value){
 //        print('table is inserting');
 //      }).catchError((error){print('error ${error.toString()}');});
 //      return null;
 //    });
 //  }
}
// HADLING ERROR
// try{
//   var NAME=await getName();
//   print (NAME);
//   print ('NAME');
//   throw('error !!!!!!!');
//
// } catch(error){
//   print('error ${error.toString()}');
// }
//       getName().then((value)
//       {
//      print (value);
//      print ('NAME');
//      // throw('error !!!!!!!');
//       }
//       ).catchError((error){
//         print('error ${error.toString()}');
//       });