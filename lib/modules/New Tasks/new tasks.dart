import 'package:flutter/material.dart';

class new_tasks extends StatelessWidget {
  const new_tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: 40.0,
      child: Text('02:00 pm',style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold ),),
    );
  }
}
