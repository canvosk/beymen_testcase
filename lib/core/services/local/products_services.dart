import 'package:beymen_testcase/constants/typedefs.dart';
import 'package:beymen_testcase/core/model/product_model.dart';

class ProductsServices {
  static int isProductExist(
      {required ProductList products, required String barcode}) {
    return products.indexWhere((element) => element.barcodeNumber == barcode);

    // ProductModel model = products.firstWhere((element){
    //   element.barcodeNumber == barcode;

    // }, orElse: () => ProductModel.empty);

    // for (ProductModel product in products) {
    //   if (product.barcodeNumber == barcode) {
    //     return true;
    //   }
    // }
    // return false;
  }

  static bool checkIsScannedBefore(
      {required ProductList scannedList, required String barcode}) {
    for (ProductModel product in scannedList) {
      if (product.barcodeNumber == barcode) {
        return true;
      }
    }
    return false;
  }
}
