import 'package:flutter/material.dart';
import 'package:login/modules/Archive%20Tasks/archive%20tasks.dart';
import 'package:login/modules/Done%20Tasks/done%20tasks.dart';
import 'package:login/modules/New%20Tasks/new%20tasks.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title[curentindex]),
      ),
       floatingActionButton:FloatingActionButton(
         child:Icon(Icons.eleven_mp),
          onPressed: (){},) ,
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
}
