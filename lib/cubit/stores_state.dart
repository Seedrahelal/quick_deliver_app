part of 'stores_cubit.dart';

@immutable
sealed class StoresState {}

class StoresInitial extends StoresState {}

class StoreLoading extends StoresState {}

class StoreSuccess extends StoresState {
  final List<StoreModels> stores;
  StoreSuccess({required this.stores});
}

class StoreFailure extends StoresState {
  final String errorMessage;
  StoreFailure({required this.errorMessage});
}

class ProductLoading extends StoresState {}

class ProductSuccess extends StoresState {
  final List<ProductModels> products;
  ProductSuccess({required this.products});
}

class ProductFailure extends StoresState {
  final String errorMessage;
  ProductFailure({required this.errorMessage});
}
