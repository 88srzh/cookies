part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final Sweets postSweets;
  CartLoaded(this.postSweets);
}
