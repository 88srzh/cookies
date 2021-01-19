part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class LoadCart extends CartEvent {
  final int id;

  LoadCart(this.id);
}
