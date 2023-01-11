import 'package:flutter/rendering.dart';
import 'package:hive_demo/core/common_import.dart';
import 'package:hive_demo/view/widgets/bottomsheeet_cart_list.dart';
import 'package:hive_demo/view/widgets/bottomsheet_add_product.dart';
import 'package:hive_demo/view/widgets/row_product.dart';

class ScreenProductList extends StatefulWidget {
  const ScreenProductList({Key? key}) : super(key: key);

  @override
  State<ScreenProductList> createState() => _ScreenProductListState();
}

class _ScreenProductListState extends State<ScreenProductList> {
  List<Product> mProductsList = [];
  Product mProduct = Product();
  ValueNotifier<bool> showFullButton = ValueNotifier(true);
  ScrollController mScrollController = ScrollController();

  @override
  void initState() {
    mScrollController.addListener(() {
      showFullButton.value = mScrollController.position.userScrollDirection ==
          ScrollDirection.forward;
    });
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget addButton() {
      return ValueListenableBuilder(
          valueListenable: showFullButton,
          builder: (context, value, child) {
            return showFullButton.value
                ? FloatingActionButton.extended(
                    onPressed: () {
                      showAddProductSheet(context);
                    },
                    tooltip: AppStrings.textAddProduct,
                    label: const Text(AppStrings.textAddProduct),
                    icon: const Icon(Icons.add),
                  )
                : FloatingActionButton(
                    onPressed: () {
                      showAddProductSheet(context);
                    },
                    tooltip: AppStrings.textAddProduct,
                    child: const Icon(Icons.add),
                  );
          });
    }

    Widget noProductAdded() {
      return const Text(
        AppStrings.textNoProductsAdded,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      );
    }

    Widget getBody() {
      return BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          if (state is ProductListResponse) {
            return state.mProductList.isNotEmpty
                ? ListView.separated(
                    controller: mScrollController,
                    itemCount: state.mProductList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          RowProduct(
                            mProduct: state.mProductList[index],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20);
                    },
                  )
                : noProductAdded();
          } else {
            return noProductAdded();
          }
        },
      );
    }

    AppBar getAppBar() {
      return AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          BlocBuilder<CartListBloc, CartListState>(
            builder: (context, state) {
              if (state is CartListResponse && state.mCartList.isNotEmpty) {
                return IconButton(
                    onPressed: () {
                      showCartListSheet(context);
                    },
                    icon: const Icon(Icons.shopping_cart));
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      );
    }

    return SafeArea(
        child: Scaffold(
      appBar: getAppBar(),
      floatingActionButton: addButton(),
      body: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: getBody()),
    ));
  }

  void showAddProductSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return const BottomSheetAddProduct();
        });
  }

  void showCartListSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const BottomSheetCartList();
        });
  }

  void initData() {
    BlocProvider.of<ProductListBloc>(context).add(const GetProductList());
  }
}
