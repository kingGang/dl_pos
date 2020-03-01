
import 'package:dl_pos/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:sunmi/sunmi.dart';

import 'uitls/eventbus.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'uitls/print.dart';


// void main() =>  runApp(DLPos());
void main()=>FlutterBugly.postCatchedException((){
  runApp(DLPos());
},debugUpload: true);

// runApp(DLPos());

class DLPos extends StatefulWidget {
  DLPos({Key key}) : super(key: key);
  @override
  _DLPosState createState() => _DLPosState();
}

class _DLPosState extends State<DLPos> {
  //  String _platformVersion = 'Unknown';

  @override
  void initState(){
    super.initState();
    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    FlutterBugly.init(
      androidAppId: "f579aec2d6",
      iOSAppId: "79299d44d1",
      autoCheckUpgrade: true
    );
    // .then((_result) {
    //   setState(() {
    //     _platformVersion = _result.message;
    //     print('$_result.appId,$_result.message');
    //   });
    // });
    FlutterBugly.setUserId("66668888");
    // FlutterBugly.putUserData(key: "key", value: "value");
    int tag = 95270;
    FlutterBugly.setUserTag(tag);
    // if (mounted) _checkUpgrade();

      // Sunmi.selfCheckingPrinter();
      Sunmi.bindPrinter();
    
    
    // print(dlRoutes);
    bus.on('dl_print', (arg) { 
        dlPrint("凯儿得乐专营店",arg);      
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Sunmi.unbindPrinter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS收银终端--凯儿得乐',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // routes: routes,
      initialRoute: '/loading',
      onGenerateRoute: (RouteSettings settings) {
        final String name = settings.name;
        final Function pageContentBuilder = dlRoutes[name];
        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            final Route route = MaterialPageRoute(
                builder: (context) =>
                    pageContentBuilder(context, arguments: settings.arguments));
            return route;
          } else {
            final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context));
            return route;
          }
        }
      },
    );
  }
}
