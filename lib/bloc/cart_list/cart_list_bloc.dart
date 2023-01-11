import 'package:hive_demo/core/common_import.dart';

part 'cart_list_event.dart';

part 'cart_list_state.dart';

/// Notifies the [CartListBloc] of a new [CartListEvent] which triggers
class CartListBloc extends Bloc<CartListEvent, CartListState> {
  CartListBloc() : super(CartListInitial()) {
    on<GetCartList>(_onGetCartList);
  }

  /// Notifies the [_onGetCartList] of a new [GetCartList] which triggers
  void _onGetCartList(
    GetCartList event,
    Emitter<CartListState> emit,
  ) async {
    emit(CartListLoading());
    List<Product> mAllProductList = [];
    List<Product> mCartList = [];
    try {
      List tmp = box.get(AppConfigs.products) ?? [];
      if (tmp.isNotEmpty) {
        try {
          for (Product element in tmp) {
            mAllProductList.add(element);
          }
        } catch (e) {
          mAllProductList = [];
        }
      }

      if (mAllProductList.isNotEmpty) {
        for (Product element in mAllProductList) {
          if ((element.inCartQty ?? 0) > 0) {
            mCartList.add(element);
          }
        }
      }

      emit(CartListResponse(
        mCartList: mCartList,
      ));
    } catch (e) {
      emit(CartListFailure(mError: e.toString()));
    }
  }
}
