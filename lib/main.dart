import 'package:flutter/material.dart';
import 'package:foodspark/app/app.locator.dart';
import 'package:foodspark/app/app.router.dart';
import 'package:foodspark/shared/bottom_sheet.dart';
import 'package:foodspark/shared/color.dart';
import 'package:foodspark/shared/ui/primary_swatch.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  setupBottomSheetUi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: kcWhite,
          primarySwatch: Palette.kToLight,
          primaryColor: kcPrimary),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
