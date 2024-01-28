part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetProducts extends ProductsEvent {}

class ScanBarcode extends ProductsEvent {
  final ProductList productList;
  final ProductList scannedList;

  const ScanBarcode({required this.productList, required this.scannedList});
}

class ClearStatus extends ProductsEvent {
  final ProductList productList;
  final ProductList scannedList;

  const ClearStatus({required this.productList, required this.scannedList});
}
