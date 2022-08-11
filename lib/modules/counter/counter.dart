import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/modules/counter/cubit/States.dart';
import 'package:login/modules/counter/cubit/cubit.dart';

class counter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){
          {
            if(state is CounterMinusStates){
              print('minus state ${state.count}');
            }
            if(state is CounterPlusStates){
              print('plus state ${state.count}');
            }
          }
        },
        builder: (context,state)=>Scaffold(

            appBar: AppBar(

              title: Text('counter'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      CounterCubit.get(context).minus();
                    }, child: Text('MINUS',style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 20.0,),
                    Text('${CounterCubit.get(context).count}',style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold),),
                    SizedBox(width: 20.0,),
                    TextButton(onPressed: (){
                      CounterCubit.get(context).add();
                    }, child: Text('ADD',style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold),)),
                  ],
                )
              ],
            ),
          ),
      ),


    );
  }
}
