import 'package:flutter/material.dart';

Widget default_button({
   required double width,
   required Color background,
   required Function function,
   required String text ,
}) =>Container(
   width: width,
   color:background,
child: MaterialButton(
onPressed: function() ,
child: Text(text),
textColor: Colors.white,
),
);
//************************* TextFormFaild ******************************
Widget default_Form({
   required TextEditingController CONTROOL,
   required TextInputType KEYBOARD,
   Function? change,
   required Function validate,
   required String text,
   required String hinttext,
   required Widget icon ,
}) => Container(
child: TextFormField(
 controller: CONTROOL,
onFieldSubmitted: (val) {
print(val);
},
onChanged:change!(),
   validator:validate() ,
keyboardType: KEYBOARD,
decoration:  InputDecoration(
prefixIcon: icon,
label: Text(text),
labelStyle: TextStyle(
color: Colors.black,
fontSize: 20,
fontWeight: FontWeight.w800),
hintText: hinttext,
hintStyle: TextStyle(backgroundColor: Colors.white10),
border: OutlineInputBorder(),
),
),
);