import 'package:beymen_testcase/constants/texts.dart';
import 'package:beymen_testcase/constants/typedefs.dart';
import 'package:beymen_testcase/core/model/product_model.dart';
import 'package:beymen_testcase/core/services/local/json_services.dart';
import 'package:beymen_testcase/core/services/local/products_services.dart';
import 'package:beymen_testcase/core/services/local/scanner_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsLoading()) {
    on<GetProducts>((event, emit) async {
      emit(ProductsLoading());

      ProductList products = await JsonServices.readJson();

      if (products.isEmpty) {
        emit(const ProductsFailure(AppTexts.failedProducts));
        return;
      }
      emit(ProductsSuccess(products, const [], 0));
    });
    on<ScanBarcode>((event, emit) async {
      String barcode = await ScannerServices.scanBarcode();
      if (barcode == "-1") {
        return;
      }
      if (ProductsServices.isProductExist(
          products: event.productList, barcode: barcode)) {
        ProductList scannedList = event.scannedList;

        if (ProductsServices.checkIsScannedBefore(
                scannedList: scannedList, barcode: barcode) ==
            false) {
          for (ProductModel product in event.productList) {
            if (product.barcodeNumber == barcode) {
              scannedList = List.from(scannedList)..add(product);
              emit(ProductsSuccess(event.productList, scannedList, 1));
              return;
            }
          }
        }

        emit(ProductsSuccess(event.productList, scannedList, 3));
        return;
      } else {
        emit(ProductsSuccess(event.productList, event.scannedList, 2));
      }
    });
    on<ClearStatus>((event, emit) async {
      emit(ProductsSuccess(event.productList, event.scannedList, 0));
    });
  }
}
