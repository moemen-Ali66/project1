import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login/modules/Archive%20Tasks/archive%20tasks.dart';
import 'package:login/modules/Done%20Tasks/done%20tasks.dart';
import 'package:login/modules/New%20Tasks/new%20tasks.dart';
import 'package:login/shared/components/components.dart';
import 'package:sqflite/sqflite.dart';

class home_layout extends StatefulWidget {
  const home_layout({Key? key}) : super(key: key);

  @override
  State<home_layout> createState() => _home_layoutState();
}

class _home_layoutState extends State<home_layout> {
  int curentindex = 0;
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
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var Formkey = GlobalKey<FormState>();
  bool isbottomsheet = false;
  IconData? fapicon = Icons.edit;
  var titlecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var Datecontroller = TextEditingController();
  Database? database;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text(title[curentindex]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isbottomsheet) {
            if (Formkey.currentState!.validate()) {
              insertdatabase(
                      title: titlecontroller.text,
                      time: timecontroller.text,
                      date: Datecontroller.text)
                  .then((value) {
                isbottomsheet = false;
                setState(() {
                  Navigator.pop(context);
                  isbottomsheet = false;
                  fapicon = Icons.edit;
                });
              });
            }
          } else {
            scaffoldkey.currentState!
                .showBottomSheet((context) => Container(
                      color: Colors.grey,
                      padding: EdgeInsets.all(20.0),
                      child: Form(
                        key: Formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            default_Form(
                                onTap: () {},
                                control: titlecontroller,
                                keyboard: TextInputType.text,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'must not be empty';
                                  }
                                  return null;
                                },
                                label: 'Task title',
                                hinttext: 'Entre your Tasks',
                                icon: Icon(Icons.title)),
                            SizedBox(
                              height: 15.0,
                            ),
                            default_Form(
                                onTap: () {
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now());
                                  timecontroller.text = TimeOfDay.now()
                                      .format(context)
                                      .toString();
                                },
                                control: timecontroller,
                                keyboard: TextInputType.datetime,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'must not be empty';
                                  }
                                  return null;
                                },
                                label: 'Task time',
                                hinttext: 'Entre the time',
                                icon: Icon(Icons.timer)),
                            SizedBox(
                              height: 15.0,
                            ),
                            default_Form(
                                onTap: () {
                                  // showDatePicker(context: context,
                                  //     initialDate: DateTime.now(),
                                  //     firstDate: DateTime.now(),

                                  //     then((value) {
                                  //   Datecontroller.text = DateFormat.yMMMd().format(value!).toString();
                                  // }).catchError((error) {
                                  //   print('DateTime is error${error.toString()}');
                                  // });
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2022-11-07'),
                                    //     lastDate: DateTime.parse('2022-8-30')).
                                  ).then((value) {
                                    Datecontroller.text =
                                        DateFormat.yMMMd().format(value!);
                                  }).catchError((error) {
                                    print(
                                        'DateTime is error${error.toString()}');
                                  });
                                },
                                control: Datecontroller,
                                keyboard: TextInputType.datetime,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'must not be empty';
                                  }
                                  return null;
                                },
                                label: 'Task date',
                                hinttext: 'Entre the date',
                                icon: Icon(Icons.date_range_outlined)),
                          ],
                        ),
                      ),
                    ))
                .closed
                .then((value) {
              isbottomsheet = false;
              setState(() {
                Navigator.pop(context);
                fapicon = Icons.edit;
              });
            });
            isbottomsheet = true;
            setState(() {
              fapicon = Icons.add;
            });
          }
        },
        child: Icon(fapicon),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curentindex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_outlined), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline), label: 'Done'),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined), label: 'Archive'),
        ],
        onTap: (index) {
          setState(() {
            curentindex = index;
          });
        },
      ),
      body: screens[curentindex],
    );
  }

  Future createdatabase() async {
    database !=
        await openDatabase(
          'todo.db',
          version: 1,
          onCreate: (database, version) {
            print('database created');
            database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT ) ').then((value) {
              print('table is creating');
            }).catchError((error) {
              print('error in creating table${error.toString()}');
            });
          },
          onOpen: (database) {
            print('database opened');
          },
        );
  }

  Future insertdatabase({required title, required time, required date}) async {
    return await database!.transaction((txn) async {
      txn.rawInsert('INSERT INTO tasks(title,date,time,status) values("$title","$time","$date","new",)').then((value) {
        print('values is inserting');
      }).catchError((error) {
        print('error in database for insert${error.toString()}');
      });
      return null;
    });
  }
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
// DateFormat.yMMMd().format(value!);
