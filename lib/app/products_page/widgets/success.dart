part of products_page;

class ProductSuccessWidget extends StatelessWidget {
  final bool showScanned;
  const ProductSuccessWidget({
    super.key,
    required this.showScanned,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              itemCount: showScanned
                  ? state.scannedProducts.length
                  : state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 350,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (_, index) {
                final ProductModel product = showScanned
                    ? state.scannedProducts[index]
                    : state.products[index];

                return Column(
                  children: [
                    CachedNetworkImage(
                      placeholder: (_, __) =>
                          const CupertinoActivityIndicator(),
                      errorWidget: (_, __, ___) {
                        debugPrint(__);
                        debugPrint(___.toString());
                        return const Icon(Icons.error_outline);
                      },
                      imageUrl: product.imageUrl,
                      imageBuilder: (context, imageProvider) => Stack(
                        children: [
                          Container(
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 3,
                            right: 3,
                            child: Container(
                              width: 50,
                              height: 25,
                              color: AppColor.bgColor.withOpacity(0.8),
                              child: Center(
                                child: Text(
                                  product.serialNumber,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  style: serialNumberText(context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: Text(
                        product.productName,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                        style: productNameText(context),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
