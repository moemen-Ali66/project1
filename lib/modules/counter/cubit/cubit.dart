import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/modules/counter/counter.dart';
import 'package:login/modules/counter/cubit/States.dart';
class CounterCubit extends Cubit<CounterStates>{
  CounterCubit( ) : super(CounterInitialStates());
  static CounterCubit get(context)=>BlocProvider.of(context);
  int count =1;

  void minus(){
    count--;
    emit(CounterMinusStates(count: count));
  }
  void add(){
    count++;
    emit(CounterPlusStates(count: count));

  }
}