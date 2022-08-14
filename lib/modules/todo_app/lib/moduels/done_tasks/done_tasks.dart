import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/components/components.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class done_tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppState>(

        listener: (context,state)=>{},
        builder:(context,state) {
          var tasks = AppCubit.get(context).doneTasks;
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

