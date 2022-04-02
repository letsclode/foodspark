import 'package:flutter/material.dart';
import 'package:foodspark/shared/color.dart';
import 'package:foodspark/shared/ui/ui_helper.dart';
import 'package:stacked/stacked.dart';

import 'cart_viewModel.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: kcPrimary,
          title: const Text(
            "Cart",
            style: TextStyle(color: kcWhite),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: kcWhite,
              )),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/empty_cart.png"),
                Text(
                  "Hungry",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                verticalSpaceSmall,
                const Text("You Haven't add anything to your cart."),
                MaterialButton(
                    minWidth: 45,
                    color: kcPrimary,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Order",
                      style: TextStyle(color: kcWhite),
                    ))
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => CartViewModel(),
    );
  }
}
