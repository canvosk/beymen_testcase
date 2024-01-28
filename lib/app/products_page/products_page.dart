library products_page;

import 'package:beymen_testcase/app/products_page/bloc/products_bloc.dart';
import 'package:beymen_testcase/constants/assets.dart';
import 'package:beymen_testcase/constants/texts.dart';
import 'package:beymen_testcase/constants/theme/app_colors.dart';
import 'package:beymen_testcase/constants/theme/text_styles.dart';
import 'package:beymen_testcase/core/helpers/popups.dart';
import 'package:beymen_testcase/core/model/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'view/products.dart';
part 'widgets/success.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc()..add(GetProducts()),
      child: const Products(),
    );
  }
}
