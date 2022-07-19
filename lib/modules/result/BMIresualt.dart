import 'package:flutter/material.dart';
class BMIRESULT extends StatelessWidget {
  final int result;
  final bool isMale;
  final int age;

  BMIRESULT({
    required this.result,
    required this.isMale,
    required this.age,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title:  Text('RESULT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('RESULT : {$result}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Text('GENDRE : ${isMale? 'male' : 'female'}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text('AGE : {$age}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ],),
      ),
    );
  }
}
