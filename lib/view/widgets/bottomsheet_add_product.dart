import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_demo/bloc/product_list/product_list_bloc.dart';
import 'package:hive_demo/core/app_config.dart';
import 'package:hive_demo/core/app_strings.dart';
import 'package:hive_demo/core/toast_controller.dart';
import 'package:hive_demo/model/model_product.dart';

class BottomSheetAddProduct extends StatefulWidget {
  const BottomSheetAddProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSheetAddProduct> createState() => _BottomSheetAddProductState();
}

class _BottomSheetAddProductState extends State<BottomSheetAddProduct> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController qtyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: productNameController,
            autofocus: true,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            decoration:
                const InputDecoration(hintText: AppStrings.textProductName),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: priceController,
            textInputAction: TextInputAction.next,
            inputFormatters: [
              FilteringTextInputFormatter.allow(AppConfigs.regExpAllowDouble)
            ],
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true, signed: false),
            decoration: const InputDecoration(hintText: AppStrings.textPrice),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: qtyController,
            textInputAction: TextInputAction.done,
            keyboardType: const TextInputType.numberWithOptions(
                signed: false, decimal: false),
            onFieldSubmitted: (value) {
              validateAddProduct(context);
            },
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(hintText: AppStrings.textQty),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              validateAddProduct(context);
            },
            child: const Text(AppStrings.textAdd),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
        ],
      ),
    );
  }

  void validateAddProduct(BuildContext context) {
    if (productNameController.text.trim().isEmpty) {
      ToastController.showToast(
          AppStrings.textPleaseAddProductName, context, false);
      return;
    } else if (priceController.text.trim().isEmpty) {
      ToastController.showToast(AppStrings.textPleaseAddPrice, context, false);
      return;
    } else if (qtyController.text.trim().isEmpty) {
      ToastController.showToast(AppStrings.textPleaseAddQty, context, false);
      return;
    } else {
      BlocProvider.of<ProductListBloc>(context).add(AddProduct(
        mProduct: Product(
            name: productNameController.text,
            price: double.parse(priceController.text),
            maxQty: int.parse(qtyController.text),
            timeId: DateTime.now().millisecondsSinceEpoch.toString()),
      ));
      Navigator.pop(context);
    }
  }
}
