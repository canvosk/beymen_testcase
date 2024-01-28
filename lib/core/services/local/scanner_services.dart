import 'package:beymen_testcase/constants/texts.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannerServices {
  static Future<String> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#FFFFFF", AppTexts.cancel, false, ScanMode.BARCODE);
    return barcodeScanRes;
  }
}
