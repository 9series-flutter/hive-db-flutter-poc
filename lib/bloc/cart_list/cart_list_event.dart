part of 'cart_list_bloc.dart';

/// [CartListEvent] abstract class is used Event of bloc.
abstract class CartListEvent extends Equatable {
  const CartListEvent();

  @override
  List<Object> get props => [];
}

/// [GetCartList] abstract class is used Auth Event
class GetCartList extends CartListEvent {
  const GetCartList();

  @override
  List<Object> get props => [];
}
