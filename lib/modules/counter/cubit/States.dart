abstract class CounterStates{

}
class CounterInitialStates extends CounterStates{

}
class CounterMinusStates extends CounterStates{

  final int count;
  CounterMinusStates({required this.count});
}
class CounterPlusStates extends CounterStates{
  final int count;
  CounterPlusStates({required this.count});
}
