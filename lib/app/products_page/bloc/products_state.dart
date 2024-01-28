part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final ProductList products;
  final ProductList scannedProducts;
  final int statusCode;
  // 0 => Initial
  // 1 => Scanned Success
  // 2 => Scanned Failed
  // 3 => Scanned Before

  const ProductsSuccess(this.products, this.scannedProducts, this.statusCode);

  @override
  List<Object> get props => [products, scannedProducts, statusCode];
}

class ProductsFailure extends ProductsState {
  final String failureString;

  const ProductsFailure(this.failureString);

  @override
  List<Object> get props => [failureString];
}
