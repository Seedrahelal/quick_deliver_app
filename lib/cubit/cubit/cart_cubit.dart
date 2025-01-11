import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:quick_deliver/helper/api_constants.dart';
import 'package:quick_deliver/models/order_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> addProductToCart(
      {required String token,
      required int productId,
      required int quantity}) async {
    emit(CartLoading());
    final url = Uri.parse(EndPoint.storeOrderUrl);
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'product_id': productId,
          'quantity': quantity,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        emit(CartSuccess(message: 'Product added to cart successfully!'));
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Unknown error';
        emit(CartFailure(errorMessage: error));
      }
    } catch (e) {
      emit(CartFailure(errorMessage: 'Error: $e'));
    }
  }

  Future<void> confirmOrder({
    required String token,
    required int orderId,
  }) async {
    emit(ConfirmOrderLoading());
    final url = Uri.parse('${EndPoint.confirmOrderUrl}$orderId');
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(ConfirmOrderSuccess(message: data['message']));
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Unknown error';
        emit(ConfirmOrderFailure(errorMessage: error));
      }
    } catch (e) {
      emit(ConfirmOrderFailure(errorMessage: 'Error: $e'));
    }
  }

  Future<void> updateOrder({
    required String token,
    required int orderId,
    required int newQuantity,
  }) async {
    emit(UpdateOrderLoading());
    final url = Uri.parse('${EndPoint.updateOrderUrl}$orderId');
    try {
      final response = await http.put(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'quantity': newQuantity,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(UpdateOrderSuccess(message: 'Order updated successfully.'));
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Unknown error';
        emit(UpdateOrderFailure(errorMessage: error));
      }
    } catch (e) {
      emit(UpdateOrderFailure(errorMessage: 'Error: $e'));
    }
  }

  Future<void> getOrders(String token) async {
    emit(OrdersLoading());
    final url = Uri.parse(EndPoint.getOrderUrl);
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        final orders = data.map((json) => OrderModel.fromJson(json)).toList();
        emit(OrdersSuccess(orders: orders));
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Unknown error';
        emit(OrdersFailure(errorMessage: error));
      }
    } catch (e) {
      emit(OrdersFailure(errorMessage: 'Error: $e'));
    }
  }

  Future<void> cancelOrder(String token, int orderId) async {
    emit(CancelOrderLoading());
    final url = Uri.parse('${EndPoint.cancelOrderUrl}$orderId');
    try {
      final response = await http.delete(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final message = jsonDecode(response.body)['message'];
        emit(CancelOrderSuccess(message: message));
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Unknown error';
        emit(CancelOrderFailure(errorMessage: error));
      }
    } catch (e) {
      emit(CancelOrderFailure(errorMessage: 'Error: $e'));
    }
  }
}
