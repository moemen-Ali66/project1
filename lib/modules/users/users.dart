 import 'package:flutter/material.dart';
import 'package:login/models/user/user_model.dart';
class users extends StatelessWidget{
  List<usermodel> user=[
    usermodel(1, 'moemen', '012568426'),
    usermodel(2, 'ali', '0125486339'),
    usermodel(3, 'ahmed', '012568426'),
    usermodel(4, 'abdelrhman', '65432314806'),
    usermodel(5, 'moemen', '01206952058'),
    usermodel(1, 'moemen', '012568426'),
    usermodel(2, 'ali', '0125486339'),
    usermodel(3, 'ahmed', '012568426'),
    usermodel(4, 'abdelrhman', '65432314806'),
    usermodel(5, 'moemen', '01206952058'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('users'),
      ),
      body:ListView.separated(
          itemBuilder: (context,index)=>usersscreen(user[index]),
          separatorBuilder: (context,index)=>Container(width: double.infinity,height: 1.0,color: Colors.grey),
          itemCount: user.length),
    );
  }

}
Widget usersscreen(usermodel user)=> Padding(
padding: const EdgeInsets.all(8.0),
child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
CircleAvatar(
backgroundColor: Colors.blue,
radius: 25.0,
child: Text('${user.id}',style:TextStyle(fontWeight:FontWeight.bold ,fontSize: 30),),
),
SizedBox(width: 10,),
Column(
crossAxisAlignment:CrossAxisAlignment.start ,
children: [
Text('${user.name}',style:TextStyle(fontSize: 20),),
Text('${user.phone}',style:TextStyle(fontSize: 20),),

],),
],
),
);