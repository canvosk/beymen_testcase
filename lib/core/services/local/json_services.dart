import 'dart:convert';

import 'package:beymen_testcase/constants/assets.dart';
import 'package:beymen_testcase/constants/typedefs.dart';
import 'package:beymen_testcase/core/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JsonServices {
  static Future<ProductList> readJson() async {
    try {
      final String response = await rootBundle.loadString(AssetsRoute.jsonDoc);
      final data = await json.decode(response);

      ProductList products = [];

      for (var product in data['products']) {
        products.add(ProductModel.fromMap(product));
      }

      return products;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
