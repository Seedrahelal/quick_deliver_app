part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final String message;
  final List<Map<String, dynamic>> products;

  CartSuccess({required this.message, required this.products});
}

class CartFailure extends CartState {
  final String errorMessage;
  CartFailure({required this.errorMessage});
}

class ConfirmOrderLoading extends CartState {}

class ConfirmOrderSuccess extends CartState {
  final String message;
  ConfirmOrderSuccess({required this.message});
}

class ConfirmOrderFailure extends CartState {
  final String errorMessage;
  ConfirmOrderFailure({required this.errorMessage});
}

class OrdersLoading extends CartState {}

class OrdersSuccess extends CartState {
  final List<OrderModel> orders;
  OrdersSuccess({required this.orders});
}

class OrdersFailure extends CartState {
  final String errorMessage;
  OrdersFailure({required this.errorMessage});
}

class CancelOrderLoading extends CartState {}

class CancelOrderSuccess extends CartState {
  final String message;
  CancelOrderSuccess({required this.message});
}

class CancelOrderFailure extends CartState {
  final String errorMessage;
  CancelOrderFailure({required this.errorMessage});
}
