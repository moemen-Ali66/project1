import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:login/modules/Archive%20Tasks/archive%20tasks.dart';
import 'package:login/modules/Done%20Tasks/done%20tasks.dart';
import 'package:login/modules/New%20Tasks/new%20tasks.dart';
import 'package:login/shared/components/components.dart';
import 'package:login/shared/components/constans.dart';
import 'package:login/shared/cubit/cubit.dart';
import 'package:login/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class home_layout extends StatelessWidget {

  var scaffoldkey = GlobalKey<ScaffoldState>();
  var Formkey = GlobalKey<FormState>();
  var titlecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var Datecontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create:(context)=>AppCubit()..createdatabase(),
    child: BlocConsumer<AppCubit,AppState>(
      listener: (context,state)=>{
        if(state is AppInsertDataBaseStates){
        Navigator.pop(context),
        }
      },
      builder: (context,state)
      {
        AppCubit Cubit=AppCubit.get(context);
        return Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              title: Text(Cubit.title[Cubit.curentindex]),
            ),
         body:ConditionalBuilder(
          condition: state is! AppGetDataBaseLoadingStates,
          fallback:(context)=>Center(child: CircularProgressIndicator(),) ,
          builder:(context)=>Cubit.screens[Cubit.curentindex],),
          //Cubit.tasks.length == 0
            //  ? Center(child: CircularProgressIndicator())
              //: Cubit.screens[Cubit.curentindex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (Cubit.isbottomsheet) {
                  if (Formkey.currentState!.validate()) {
                    Cubit.insertdatabase(
                            title: titlecontroller.text,
                            time: timecontroller.text,
                            date: Datecontroller.text,);
                    Cubit.changebottomsheet(isShow: false, icon: Icons.edit);
                  }
                } else {
                  scaffoldkey.currentState!.showBottomSheet((context) => Container(
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
                                        timecontroller.text = TimeOfDay.now().format(context).toString();
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
                                        //خلي بالك اما تحط الشهر او اليوم لازم يكون رقمين
                                        //     lastDate: DateTime.parse('2022-8-30')).
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse('2022-11-07'),
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
                    titlecontroller.clear();
                    timecontroller.clear();
                    Datecontroller.clear();
                    Cubit.changebottomsheet(isShow: false, icon: Icons.edit);

                  });
                  Cubit.changebottomsheet(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(Cubit.fapicon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: Cubit.curentindex,
              items:  [
                BottomNavigationBarItem(
                    icon: Icon(Icons.task_alt_outlined), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archive'),
              ],
              onTap: (index) {
                Cubit.ChangeIndex(index);
              },
            ),


          );
        },
    )

  ,);
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
