import 'package:auto_route/auto_route.dart';
import 'package:crud_flutter/features/detail/screens/detail_screen.dart';
import 'package:crud_flutter/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(page: DetailRoute.page)
      ];
}
