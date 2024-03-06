import 'package:beymen_testcase/constants/enums.dart';
import 'package:beymen_testcase/constants/texts.dart';
import 'package:beymen_testcase/constants/typedefs.dart';
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
      emit(ProductsSuccess(products, const [], StatusEnums.initial));
    });
    on<ScanBarcode>((event, emit) async {
      String barcode = await ScannerServices.scanBarcode();
      if (barcode == "-1") {
        return;
      }

      int indexNumber = ProductsServices.isProductExist(
          products: event.productList, barcode: barcode);

      if (indexNumber != -1) {
        ProductList scannedList = event.scannedList;

        if (ProductsServices.checkIsScannedBefore(
                scannedList: scannedList, barcode: barcode) ==
            false) {
          scannedList = List.from(scannedList)
            ..add(event.productList[indexNumber]);
          emit(ProductsSuccess(
              event.productList, scannedList, StatusEnums.success));
          return;

          // for (ProductModel product in event.productList) {
          //   if (product.barcodeNumber == barcode) {
          //     scannedList = List.from(scannedList)..add(product);
          //     emit(ProductsSuccess(event.productList, scannedList, 1));
          //     return;
          //   }
          // }
        }

        emit(ProductsSuccess(
            event.productList, scannedList, StatusEnums.scannedBefore));
        return;
      } else {
        emit(ProductsSuccess(
            event.productList, event.scannedList, StatusEnums.failed));
      }
    });
    on<ClearStatus>((event, emit) async {
      emit(ProductsSuccess(
          event.productList, event.scannedList, StatusEnums.initial));
    });
  }
}
