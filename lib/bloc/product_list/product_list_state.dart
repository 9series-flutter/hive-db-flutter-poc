part of 'product_list_bloc.dart';

/// [ProductListState] abstract class is used Auth State
abstract class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object> get props => [];
}

/// [ProductListInitial] class is used Auth State Initial
class ProductListInitial extends ProductListState {}

/// [ProductListLoading] class is used Auth State Loading
class ProductListLoading extends ProductListState {}

/// [ProductListResponse] class is used Auth State Response
class ProductListResponse extends ProductListState {
  final List<Product> mProductList;

  const ProductListResponse({
    required this.mProductList,
  });

  @override
  List<Object> get props => [
        mProductList,
      ];
}

/// [ProductListFailure] class is used Auth State Failure
class ProductListFailure extends ProductListState {
  final String mError;

  const ProductListFailure({required this.mError});

  @override
  List<Object> get props => [mError];
}
