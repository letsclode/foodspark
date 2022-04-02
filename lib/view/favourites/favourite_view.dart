import 'package:flutter/material.dart';
import 'package:foodspark/shared/color.dart';
import 'package:stacked/stacked.dart';

import '../../shared/ui/ui_helper.dart';
import 'favourite_viewModel.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavouriteViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: kcPrimary,
          title: const Text(
            "Favourites",
            style: TextStyle(color: kcWhite),
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/empty_fav.jpg"),
                Text(
                  "Opps",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                verticalSpaceSmall,
                const Text("You Haven't add anything to your favourites."),
                MaterialButton(
                    minWidth: 45,
                    color: kcPrimary,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Browse",
                      style: TextStyle(color: kcWhite),
                    ))
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => FavouriteViewModel(),
    );
  }
}
