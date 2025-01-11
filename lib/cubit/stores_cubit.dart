import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:quick_deliver/helper/api_constants.dart';
import 'package:quick_deliver/models/product_models.dart';
import 'package:quick_deliver/models/store_models.dart';

part 'stores_state.dart';

class StoresCubit extends Cubit<StoresState> {
  StoresCubit() : super(StoresInitial());

  Future<void> getStores() async {
    emit(StoreLoading());
    try {
      final url = Uri.parse(EndPoint.storeUrl);
      final response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body) as List;
        final stores = data.map((json) => StoreModels.fromJson(json)).toList();
        emit(StoreSuccess(stores: stores));
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['message'] ?? 'Failed to load stores';
        emit(StoreFailure(errorMessage: errorMessage));
      }
    } catch (error) {
      emit(StoreFailure(errorMessage: 'Error fetching stores: $error'));
    }
  }

  Future<void> getProducts(int storeId) async {
    emit(ProductLoading());
    try {
      final url = Uri.parse(EndPoint.productUrl);
      final response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body) as List;
        final products =
            data.map((json) => ProductModels.fromJson(json)).toList();
        emit(ProductSuccess(products: products));
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['message'] ?? 'Failed to load products';
        emit(ProductFailure(errorMessage: errorMessage));
      }
    } catch (error) {
      emit(ProductFailure(errorMessage: 'Error fetching products: $error'));
    }
  }

  Future<void> searchStores(String query) async {
    emit(StoreLoading());
    try {
      final response =
          await http.get(Uri.parse('${EndPoint.searchStoreUrl}/$query'));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body) as List;
        final stores = data.map((json) => StoreModels.fromJson(json)).toList();
        emit(StoreSuccess(stores: stores));
      } else {
        emit(StoreFailure(errorMessage: 'No stores found.'));
      }
    } catch (error) {
      emit(StoreFailure(errorMessage: 'Error: $error'));
    }
  }

  Future<void> searchProducts(int storeId, String query) async {
    emit(ProductLoading());
    try {
      final response = await http
          .get(Uri.parse('${EndPoint.searchProductUrl}/$storeId/$query'));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body) as List;
        final products =
            data.map((json) => ProductModels.fromJson(json)).toList();
        emit(ProductSuccess(products: products));
      } else {
        emit(ProductFailure(errorMessage: 'No products found.'));
      }
    } catch (error) {
      emit(ProductFailure(errorMessage: 'Error: $error'));
    }
  }
}
