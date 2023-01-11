part of 'product_list_bloc.dart';

/// [ProductListEvent] abstract class is used Event of bloc.
abstract class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

/// [AddToCart] abstract class is used Auth Event
class AddToCart extends ProductListEvent {
  const AddToCart({
    required this.mProduct,
    required this.isAdd,
  });

  final Product mProduct;
  final bool isAdd;

  @override
  List<Object> get props => [
        mProduct,
        isAdd,
      ];
}

/// [AddToCart] abstract class is used Auth Event
class GetProductList extends ProductListEvent {
  const GetProductList();

  @override
  List<Object> get props => [];
}

/// [AddToCart] abstract class is used Auth Event
class AddProduct extends ProductListEvent {
  const AddProduct({
    required this.mProduct,
  });

  final Product mProduct;

  @override
  List<Object> get props => [
        mProduct,
      ];
}

/// [AddToCart] abstract class is used Auth Event
class DeleteProduct extends ProductListEvent {
  const DeleteProduct({
    required this.mProduct,
  });

  final Product mProduct;

  @override
  List<Object> get props => [
        mProduct,
      ];
}
