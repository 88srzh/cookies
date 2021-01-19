import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cookie/models/sweets.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  // CartBloc() : super(CartInitial());
  Sweets postSweets;

  @override
  CartState get initialState => CartInitial();

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is LoadCart) {
      yield CartInitial();
      postSweets = await _fetch(event.id);
      yield CartLoaded(postSweets);
    }
  }
}
