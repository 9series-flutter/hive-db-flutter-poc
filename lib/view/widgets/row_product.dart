import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_demo/bloc/product_list/product_list_bloc.dart';
import 'package:hive_demo/core/app_strings.dart';
import 'package:hive_demo/model/model_product.dart';

class RowProduct extends StatefulWidget {
  final Product mProduct;

  const RowProduct({Key? key, required this.mProduct}) : super(key: key);

  @override
  State<RowProduct> createState() => _RowProductState();
}

class _RowProductState extends State<RowProduct> {
  @override
  Widget build(BuildContext context) {
    Widget plusMinusWidget() {
      return Container(
        height: 37,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            color: Colors.white),
        child: (widget.mProduct.inCartQty ?? 0) > 0
            ? Row(
                children: [
                  InkWell(
                    onTap: () {
                      if ((widget.mProduct.inCartQty ?? 0) != 0) {
                        addToCart(false);
                      }
                    },
                    child: const SizedBox(
                      height: 37,
                      width: 30,
                      child: Icon(Icons.remove, color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 37,
                    width: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 47,
                    height: 37,
                    child: Center(
                      child: Text(
                        (widget.mProduct.inCartQty ?? 0).toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  if ((widget.mProduct.maxQty ?? 0) > 0)
                    Container(
                      height: 37,
                      width: 1,
                      color: Colors.grey,
                    ),
                  if ((widget.mProduct.maxQty ?? 0) > 0)
                    InkWell(
                      onTap: () {
                        addToCart(true);
                      },
                      child: const SizedBox(
                        height: 37,
                        width: 30,
                        child: Icon(Icons.add, color: Colors.black),
                      ),
                    ),
                ],
              )
            : ElevatedButton(
                onPressed: () {
                  addToCart(true);
                },
                child: const Text(AppStrings.textAddToCart)),
      );
    }

    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              deleteProduct(context);
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.black12, offset: Offset(1, 0.5))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(widget.mProduct.name ?? ''),
                  const SizedBox(height: 6),
                  Text(
                      '${AppStrings.textPriceWithColon} ${widget.mProduct.price}')
                ],
              ),
            ),
            const SizedBox(width: 20),
            plusMinusWidget()
          ],
        ),
      ),
    );
  }

  void addToCart(bool isAdd) {
    BlocProvider.of<ProductListBloc>(context)
        .add(AddToCart(mProduct: widget.mProduct, isAdd: isAdd));
  }

  void deleteProduct(BuildContext context) {
    BlocProvider.of<ProductListBloc>(context)
        .add(DeleteProduct(mProduct: widget.mProduct));
  }
}
