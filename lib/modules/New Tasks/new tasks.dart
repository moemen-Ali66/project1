import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login/shared/components/components.dart';
import 'package:login/shared/components/constans.dart';

class new_tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        itemBuilder: (context,index)=> BUILDITEMTASKS(tasks,index), separatorBuilder: (context,index)=>Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey,
    ),
        ), itemCount: tasks.length,
    );
  }
}

