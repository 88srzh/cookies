import 'package:cookie/bloc/observer.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
    }
    throw UnimplementedError();
  }

  void count() {
    Bloc.observer = SimpleBlocObserver();
    CounterBloc bloc = CounterBloc();

    for (int i = 0; i < 3; i++) {
      bloc.add(CounterEvent.increment);
    }
  }
}
