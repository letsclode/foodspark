import 'package:foodspark/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RestoDetailsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  void back() {
    _navigationService.back();
  }
}
