import 'package:foodspark/view/home/home_view.dart';
import 'package:foodspark/view/login/login_view.dart';
import 'package:foodspark/view/resto/resto_details_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: LoginView, initial: true),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: RestoDetailsView)
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: BottomSheetService)
], logger: StackedLogger())
class App {}
