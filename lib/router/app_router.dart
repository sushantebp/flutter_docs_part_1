import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:learn_app/pages/button_type_page.dart';
import 'package:learn_app/pages/details/details_page.dart';
import 'package:learn_app/pages/dialog_box_example_page.dart';
import 'package:learn_app/pages/handling_user_input_page.dart';
import 'package:learn_app/pages/keys_usecase_page.dart';
import 'package:learn_app/pages/layout_understanding_page.dart';
import 'package:learn_app/pages/network_example_page.dart';
import 'package:learn_app/pages/responsive_layout_example_page.dart';
import 'package:learn_app/pages/state_manage_example_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: ButtonTypeRoute.page),
    AutoRoute(page: DialogBoxExampleRoute.page),
    AutoRoute(page: HandlingUserInputRoute.page),
    AutoRoute(page: NetworkExampleRoute.page),
    AutoRoute(page: KeysUsecaseRoute.page, initial: true),
    AutoRoute(page: DetailsRoute.page),
  ];
}
