// import 'package:flutter/material.dart';
import 'package:dl_pos/pages/mrket/antistock.dart';

import '../pages/mine/mine.dart';
import '../tabs/tabs.dart';
import '../pages/loading/loading.dart';

final dlRoutes={
    '/':(context)=>Tabs(),
    '/loading':(context)=>LoadingPage(),
    '/test':(context)=>Mine(),
    '/antistock':(context)=>AntiStockList(),
  };

//命名路由，传值固定写法
// var onGenerateRoute = (RouteSettings settings) {
//   final String name = settings.name;
//   final Function pageContentBuilder = dlRoutes[name];
//   if (pageContentBuilder != null) {
//     if (settings.arguments != null) {
//       final Route route = MaterialPageRoute(
//           builder: (context) =>
//               pageContentBuilder(context, arguments: settings.arguments));
//       return route;
//     } else {
//       final Route route =
//           MaterialPageRoute(builder: (context) => pageContentBuilder(context));
//       return route;
//     }
//   }
// };
