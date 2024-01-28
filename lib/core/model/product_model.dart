import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String barcodeNumber;
  final String productName;
  final String imageUrl;
  final String serialNumber;

  const ProductModel({
    required this.barcodeNumber,
    required this.productName,
    required this.imageUrl,
    required this.serialNumber,
  });

  static const empty = ProductModel(
    barcodeNumber: "",
    productName: "",
    imageUrl: "",
    serialNumber: "",
  );

  ProductModel copyWith({
    String? barcodeNumber,
    String? productName,
    String? imageUrl,
    String? serialNumber,
  }) {
    return ProductModel(
      barcodeNumber: barcodeNumber ?? this.barcodeNumber,
      productName: productName ?? this.productName,
      imageUrl: imageUrl ?? this.imageUrl,
      serialNumber: serialNumber ?? this.serialNumber,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'barcodeNumber': barcodeNumber,
      'productName': productName,
      'imageUrl': imageUrl,
      'serialNumber': serialNumber,
    };
  }

  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
      barcodeNumber: map['barcodeNumber'],
      productName: map['productName'],
      imageUrl: map['imageUrl'],
      serialNumber: map['serialNumber'],
    );
  }

  @override
  List<Object?> get props =>
      [barcodeNumber, productName, imageUrl, serialNumber];
}
