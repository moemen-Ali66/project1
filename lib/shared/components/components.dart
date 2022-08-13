import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:login/shared/cubit/cubit.dart';
Widget default_button({
  double width=double.infinity,
    Color background=Colors.blue,
   required  function,
   required String text ,
}) =>Container(
   width: width,
   color:background,
child: MaterialButton(
onPressed: function ,
child: Text(text.toUpperCase()),
textColor: Colors.white,
),
);
//************************* TextFormFaild ******************************
Widget default_Form({
   required TextEditingController control,
   required TextInputType keyboard,
     change,
   onTap,
   required  validate,
   required String label,
   required String hinttext,
   required Widget icon,
   IconData? suficon ,
   suffexpressed,
   bool ispassword= false ,
}) => Container(
   child: TextFormField(
      onTap: onTap,
      validator: validate,
      controller: control,
      keyboardType: keyboard,
      onChanged:change,
      obscureText:ispassword,
      decoration:   InputDecoration(
         prefixIcon: icon,
         suffixIcon: suficon !=null ? IconButton(icon:Icon(suficon,) ,onPressed: suffexpressed,):null,
         label: Text(label),
         labelStyle:const TextStyle(
             color: Colors.black,
             fontSize: 20,
             fontWeight: FontWeight.w800),
         hintText: hinttext ,
         hintStyle: TextStyle(backgroundColor: Colors.white10),
         border: OutlineInputBorder(),
      ),
   ),);
   Widget BUILDITEMTASKS(tasks,index,context)=>Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
         children: [
            Row(
               children: [
                  CircleAvatar(
                     radius: 40.0,
                     child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(tasks[index]['date'],style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold ),),
                     ),
                  ),
                  SizedBox(width: 20.0,),
                  Column(children: [
                     Text(tasks[index]['title'],style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20.0),),
                     Text(tasks[index]['time'],style: TextStyle(fontSize: 20.0,color: Colors.grey),),

                  ],),
                  SizedBox(width: 10.0,),
                  IconButton(onPressed: (){
                     AppCubit.get(context).updatedatabase(status: 'done', id: tasks['id']);

                  },
                     icon:Icon(Icons.check_box),
                     color: Colors.green,),
                  SizedBox(width: 10,),
                  IconButton(onPressed: (){
                     AppCubit.get(context).updatedatabase(status: 'archive', id: tasks['id']);

                  },
                     icon:Icon(Icons.archive),
                     color: Colors.grey,),
               ],
            ),
         ],
      ),
   );