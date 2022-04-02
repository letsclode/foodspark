import 'package:flutter/material.dart';
import 'package:foodspark/app/app.locator.dart';
import 'package:foodspark/view/cart/cart_view.dart';
import 'package:foodspark/view/favourites/favourite_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  // String? _path;

  // set path(value) => _path = value;

  showRestoDetailsPage(String path) {
    _navigationService.navigateTo(Routes.restoDetailsView,
        arguments: RestoDetailsViewArguments(path: path));
  }

  showCartPage() {
    _navigationService.navigateToView(const CartView());
  }

  showFavPage() {
    _navigationService.navigateToView(const FavouriteView());
  }

  List<Widget> items = [
    Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Card(
              child: Image.asset("assets/images/2.jpeg"),
            )),
            Expanded(
                child: Card(
              child: Image.asset("assets/images/banner2.png"),
            ))
          ],
        ),
      ),
    ),
    Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Card(
              child: Image.asset("assets/images/2.jpeg"),
            )),
            Expanded(
                child: Card(
              child: Image.asset("assets/images/banner2.png"),
            ))
          ],
        ),
      ),
    )
  ];
}
