import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_demo/bloc/cart_list/cart_list_bloc.dart';
import 'package:hive_demo/core/app_strings.dart';
import 'package:hive_demo/view/widgets/row_product.dart';

class BottomSheetCartList extends StatefulWidget {
  const BottomSheetCartList({Key? key}) : super(key: key);

  @override
  State<BottomSheetCartList> createState() => _BottomSheetCartListState();
}

class _BottomSheetCartListState extends State<BottomSheetCartList> {
  @override
  void initState() {
    BlocProvider.of<CartListBloc>(context).add(const GetCartList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget noProductAdded() {
      return const Text(
        AppStrings.textNoProductsAddedInCart,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      );
    }

    return BlocListener<CartListBloc, CartListState>(
      listener: (context, state) {
        if (state is CartListResponse && state.mCartList.isEmpty) {
          Navigator.pop(context);
        } else if (state is CartListFailure) {
          Navigator.pop(context);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<CartListBloc, CartListState>(
          builder: (context, state) {
            if (state is CartListResponse) {
              return state.mCartList.isNotEmpty
                  ? ListView.separated(
                      itemCount: state.mCartList.length,
                      itemBuilder: (context, index) {
                        return RowProduct(
                          mProduct: state.mCartList[index],
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
        ),
      ),
    );
  }
}
