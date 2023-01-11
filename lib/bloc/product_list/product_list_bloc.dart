import 'package:hive_demo/core/common_import.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

/// Notifies the [ProductListBloc] of a new [ProductListEvent] which triggers
class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(ProductListInitial()) {
    on<AddToCart>(_onAddToCart);
    on<AddProduct>(_onAddProduct);
    on<DeleteProduct>(_onDeleteProduct);
    on<GetProductList>(_onGetProductList);
  }

  /// Notifies the [_onAddToCart] of a new [AddToCart] which triggers
  void _onAddToCart(
    AddToCart event,
    Emitter<ProductListState> emit,
  ) async {
    emit(ProductListLoading());
    List<Product> mCartList = [];
    List tmp = box.get(AppConfigs.products) ?? [];

    if (tmp.isNotEmpty) {
      try {
        for (Product element in tmp) {
          mCartList.add(element);
        }
      } catch (e) {
        mCartList = [];
      }
    }

    if (mCartList.isNotEmpty) {
      Product mTmpProduct = mCartList
          .firstWhere((element) => element.timeId == event.mProduct.timeId);
      int index = mCartList.indexOf(mTmpProduct);

      if (event.isAdd) {
        mCartList[index].inCartQty = (mCartList[index].inCartQty ?? 0) + 1;
        mCartList[index].maxQty = (mCartList[index].maxQty ?? 0) - 1;
      } else {
        mCartList[index].inCartQty = (mCartList[index].inCartQty ?? 0) - 1;
        mCartList[index].maxQty = (mCartList[index].maxQty ?? 0) + 1;
      }

      ToastController.removeToast(NavigatorKey.navigatorKey.currentContext!);

      ToastController.showToast(
          event.isAdd ? 'Added to cart' : 'Removed from cart',
          NavigatorKey.navigatorKey.currentContext!,
          event.isAdd);
    }
    BlocProvider.of<CartListBloc>(NavigatorKey.navigatorKey.currentContext!)
        .add(const GetCartList());

    box.put(AppConfigs.products, mCartList);

    emit(ProductListResponse(
      mProductList: mCartList,
    ));
  }

  /// Notifies the [_onAddProduct] of a new [AddProduct] which triggers
  void _onAddProduct(
    AddProduct event,
    Emitter<ProductListState> emit,
  ) async {
    emit(ProductListLoading());
    List<Product> mProductsList = [];
    List tmp = box.get(AppConfigs.products) ?? [];

    if (tmp.isNotEmpty) {
      try {
        for (Product element in tmp) {
          mProductsList.add(element);
        }
      } catch (e) {
        mProductsList = [];
      }
    }

    mProductsList.add(event.mProduct);

    box.put(AppConfigs.products, mProductsList);

    emit(ProductListResponse(
      mProductList: mProductsList,
    ));
  }

  /// Notifies the [_onDeleteProduct] of a new [DeleteProduct] which triggers
  void _onDeleteProduct(
    DeleteProduct event,
    Emitter<ProductListState> emit,
  ) async {
    emit(ProductListLoading());
    List<Product> mProductsList = [];
    List tmp = box.get(AppConfigs.products) ?? [];

    if (tmp.isNotEmpty) {
      try {
        for (Product element in tmp) {
          mProductsList.add(element);
        }
      } catch (e) {
        mProductsList = [];
      }
    }

    mProductsList
        .removeWhere((element) => element.timeId == event.mProduct.timeId);

    box.put(AppConfigs.products, mProductsList);
    BlocProvider.of<CartListBloc>(NavigatorKey.navigatorKey.currentContext!)
        .add(const GetCartList());
    emit(ProductListResponse(
      mProductList: mProductsList,
    ));
  }

  /// Notifies the [_onGetProductList] of a new [GetProductList] which triggers
  void _onGetProductList(
    GetProductList event,
    Emitter<ProductListState> emit,
  ) async {
    emit(ProductListLoading());
    List<Product> mCartList = [];
    try {
      List tmp = box.get(AppConfigs.products) ?? [];

      if (tmp.isNotEmpty) {
        try {
          for (Product element in tmp) {
            mCartList.add(element);
          }
        } catch (e) {
          mCartList = [];
        }
      }

      emit(ProductListResponse(
        mProductList: mCartList,
      ));
    } catch (e) {
      emit(ProductListFailure(mError: e.toString()));
    }
  }
}
