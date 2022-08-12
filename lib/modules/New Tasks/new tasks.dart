import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/shared/components/components.dart';
import 'package:login/shared/components/constans.dart';
import 'package:login/shared/cubit/cubit.dart';
import 'package:login/shared/cubit/states.dart';

class new_tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     var listtasks =AppCubit.get(context).tasks;

    return  BlocConsumer<AppCubit,AppState>(
      listener: (context,state)=>{},
      builder:(context,state)=>ListView.separated(
        itemBuilder: (context,index)=> BUILDITEMTASKS(listtasks,index),
        separatorBuilder: (context,index)=>Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey,
        ),
      ), itemCount:listtasks.length,
      ) ,
    );
  }
}

