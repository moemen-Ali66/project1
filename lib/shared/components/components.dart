import 'package:flutter/material.dart';

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
   required  validate,
   required String label,
   required String hinttext,
   required Widget icon,
   Widget? suficon ,
   bool boolen= false ,
}) => Container(
   child: TextFormField(
      validator: validate,
      controller: control,
      keyboardType: keyboard,
      onChanged:change,
      obscureText:boolen,
      decoration:   InputDecoration(
         prefixIcon: icon,
         suffixIcon: suficon,
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