import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/shared/components/components.dart';
import 'package:login/shared/cubit/cubit.dart';
import 'package:login/shared/cubit/states.dart';

class new_tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppState>(

    listener: (context,state)=>{},
      builder:(context,state) {
        var tasks = AppCubit.get(context).newTasks;
        return ListView.separated(
          itemBuilder: (context, index) => BUILDITEMTASKS(tasks[index],context),
          separatorBuilder: (context, index) =>
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(

                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey,
                ),
              ), itemCount: tasks.length,

        );
      }
    );
  }
}

