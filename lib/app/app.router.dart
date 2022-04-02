// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../view/home/home_view.dart';
import '../view/login/login_view.dart';
import '../view/resto/resto_details_view.dart';

class Routes {
  static const String loginView = '/';
  static const String homeView = '/home-view';
  static const String restoDetailsView = '/resto-details-view';
  static const all = <String>{
    loginView,
    homeView,
    restoDetailsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.restoDetailsView, page: RestoDetailsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    RestoDetailsView: (data) {
      var args = data.getArgs<RestoDetailsViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => RestoDetailsView(
          key: args.key,
          path: args.path,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// RestoDetailsView arguments holder class
class RestoDetailsViewArguments {
  final Key? key;
  final String? path;
  RestoDetailsViewArguments({this.key, required this.path});
}
