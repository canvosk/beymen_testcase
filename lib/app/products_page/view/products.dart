part of products_page;

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(AppTexts.appTitle),
              centerTitle: true,
              bottom: state is ProductsSuccess
                  ? TabBar(
                      indicatorColor: AppColor.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: AppColor.black,
                      tabs: const [
                        Tab(
                          text: AppTexts.allProducts,
                        ),
                        Tab(
                          text: AppTexts.scannedProducts,
                        ),
                      ],
                    )
                  : null,
            ),
            body: state is ProductsLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state is ProductsSuccess
                    ? BlocListener<ProductsBloc, ProductsState>(
                        listener: (listenerContext, listenerState) {
                          if (listenerState is ProductsSuccess) {
                            switch (listenerState.statusCode) {
                              case 0:
                                break;
                              case 1:
                                ShowPopups.showpopup(
                                  context: context,
                                  titleIcon: Icon(
                                    Icons.check_circle_outline_outlined,
                                    color: AppColor.successColor,
                                    size: 48,
                                  ),
                                  content: AppTexts.scannedSuccess,
                                ).then((value) {
                                  context.read<ProductsBloc>().add(
                                        ClearStatus(
                                          productList: listenerState.products,
                                          scannedList:
                                              listenerState.scannedProducts,
                                        ),
                                      );
                                });
                                break;
                              case 2:
                                ShowPopups.showpopup(
                                  context: context,
                                  titleIcon: Icon(
                                    Icons.cancel_outlined,
                                    color: AppColor.errorColor,
                                    size: 48,
                                  ),
                                  content: AppTexts.scannedFailed,
                                ).then((value) {
                                  context.read<ProductsBloc>().add(
                                        ClearStatus(
                                          productList: listenerState.products,
                                          scannedList:
                                              listenerState.scannedProducts,
                                        ),
                                      );
                                });
                                break;
                              case 3:
                                ShowPopups.showpopup(
                                  context: context,
                                  titleIcon: Icon(
                                    Icons.cancel_outlined,
                                    color: AppColor.errorColor,
                                    size: 48,
                                  ),
                                  content: AppTexts.scannedBefore,
                                ).then((value) {
                                  context.read<ProductsBloc>().add(
                                        ClearStatus(
                                          productList: listenerState.products,
                                          scannedList:
                                              listenerState.scannedProducts,
                                        ),
                                      );
                                });
                                break;
                              default:
                                break;
                            }
                          }
                        },
                        child: const TabBarView(
                          children: [
                            ProductSuccessWidget(
                              showScanned: false,
                            ),
                            ProductSuccessWidget(
                              showScanned: true,
                            ),
                          ],
                        ),
                      )
                    : state is ProductsFailure
                        ? Center(
                            child: Text(state.failureString),
                          )
                        : Container(),
            floatingActionButton: state is ProductsSuccess
                ? FloatingActionButton(
                    onPressed: () {
                      context.read<ProductsBloc>().add(ScanBarcode(
                          productList: state.products,
                          scannedList: state.scannedProducts));
                    },
                    child: Image.asset(AssetsRoute.barcodeScannerImage),
                  )
                : Container(),
          ),
        );
      },
    );
  }
}
