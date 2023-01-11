part of 'cart_list_bloc.dart';

/// [CartListState] abstract class is used Auth State
abstract class CartListState extends Equatable {
  const CartListState();

  @override
  List<Object> get props => [];
}

/// [CartListInitial] class is used Auth State Initial
class CartListInitial extends CartListState {}

/// [CartListLoading] class is used Auth State Loading
class CartListLoading extends CartListState {}

/// [CartListResponse] class is used Auth State Response
class CartListResponse extends CartListState {
  final List<Product> mCartList;

  const CartListResponse({
    required this.mCartList,
  });

  @override
  List<Object> get props => [
        mCartList,
      ];
}

/// [CartListFailure] class is used Auth State Failure
class CartListFailure extends CartListState {
  final String mError;

  const CartListFailure({required this.mError});

  @override
  List<Object> get props => [mError];
}
