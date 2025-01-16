import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:quick_deliver/helper/api_constants.dart';
import 'package:quick_deliver/models/order_model.dart';
import 'package:quick_deliver/models/product_models.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<Map<String, dynamic>> _productsInCart = [];
  List<Map<String, dynamic>> get productsInCart =>
      List.unmodifiable(_productsInCart);

  Future<void> addProductToCart({
    required String token,
    required ProductModels product,
    required int quantity,
  }) async {
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
          'product_id': product.id,
          'quantity': quantity,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        _productsInCart.add({
          'product': product,
          'quantity': data['quantity'],
          'totalPrice': data['total_price'],
          'id': data['id']
        });
        emit(CartSuccess(
          message: 'Product added to cart successfully!',
          products: _productsInCart,
        ));
      } else {
        emit(CartFailure(errorMessage: 'Failed to add product to cart.'));
      }
    } catch (e) {
      emit(CartFailure(errorMessage: 'Error: $e'));
    }
  }

  Future<void> updateProductQuantity({
    required String token,
    required int cartItemId,
    required int newQuantity,
  }) async {
    emit(CartLoading());
    try {
      final response = await http.post(
        Uri.parse('${EndPoint.updateOrderUrl}/$cartItemId'),
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
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final index =
            _productsInCart.indexWhere((item) => item['id'] == cartItemId);
        if (index != -1) {
          _productsInCart[index]['quantity'] = data['quantity'];
          _productsInCart[index]['totalPrice'] = data['total_price'];
          // _productsInCart[index]['id'] = data['id'];
        }
        emit(CartSuccess(
          message: 'Product quantity updated successfully!',
          products: _productsInCart,
        ));
      } else {
        emit(CartFailure(errorMessage: 'Failed to update product quantity.'));
      }
    } catch (e) {
      emit(CartFailure(errorMessage: 'Error: $e'));
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
}
