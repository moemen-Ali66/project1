import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../result/BMIresualt.dart';
class calc extends StatefulWidget {
  const calc({Key? key}) : super(key: key);

  @override
  State<calc> createState() => _calcState();
}

class _calcState extends State<calc> {
  bool ismale=true;
  var weight=120;
  var age=20;
  double height=120;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('calculte'),
      ),
      body:
      Column(
        children: [
          Expanded(
            child: Padding(
              padding:  const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        ismale=true;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children:
                      const [
                        Icon( Icons.male,size: 75,),
                        SizedBox(height: 15.0,),
                        Text('MALE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),

                      ],),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: ismale?Colors.blue:Colors.grey),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                    child: GestureDetector(
                      child: Container(

                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children:
                          const [
                            Icon( Icons.female,size: 75,),
                            SizedBox(height: 15.0,),
                            Text('FEMALE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),

                          ],),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            color: !ismale?Colors.blue:Colors.grey),
                      ),
                      onTap: (){
                        setState(( ) {
                          ismale = false;
                        });
                      }
                      ,
                    ),
                  ),            ],),
            ),

          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: Colors.grey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT',style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,

                    children: [
                      Text('${height.round()}',style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold),),
                      Text('Cm',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),


                    ],
                  ),
                  Slider(
                      value: height,
                      max:220.0,
                      min: 80.0,
                      onChanged: (value){
                        setState(() {
                          height=value;
                        });
                       })
                ],
              ),
            ),
          ),),
          Expanded(child:
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(

                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey),
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [

                        Text('WEIGHT',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25),),
                        Text('$weight',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 40),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          FloatingActionButton(onPressed: (){weight--;setState(() {

                          });},child:Icon(Icons.remove),mini: true,),
                          FloatingActionButton(onPressed: (){weight++;setState(() {

                          });},child:Icon(Icons.add),mini: true,)
                        ],),


                      ],),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Container(

                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey),
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [

                        Text('AGE',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25),),
                        Text('$age',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 40),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            FloatingActionButton(onPressed: (){setState(() {
                              age--;
                            });},child:Icon(Icons.remove),mini: true,),
                            FloatingActionButton(onPressed: (){setState(() {
                              age++;
                            });},child:Icon(Icons.add),mini: true,)
                          ],),


                      ],),
                  ),
                ),
              ],
            ),
          ), ),
          Container(color: Colors.blue,
             width: double.infinity,

             child:
          MaterialButton(

            onPressed: (){
              double result = weight/ pow(height/100,2);
              Navigator.push(context,MaterialPageRoute(builder:( context)=>BMIRESULT(age: age,isMale: ismale,result:result.round() ,)));
            },
            child: Text('submit',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),)),
        ],
      ),
    );
}}
