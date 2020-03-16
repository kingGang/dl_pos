import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dl_pos/model/dailystatement.dart';
import 'package:dl_pos/model/order.dart';
import 'package:dl_pos/pages/mrket/antistock.dart';
import 'package:dl_pos/uitls/eventbus.dart';
import 'package:dl_pos/view/update_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
// import 'package:install_plugin/install_plugin.dart';
import 'package:path_provider/path_provider.dart';

// import 'package:permission_handler/permission_handler.dart';

class Mrket extends StatefulWidget {
  Mrket({Key key}) : super(key: key);
  @override
  _MrketState createState() => _MrketState();
}

void _print() {
  DLOrder order = DLOrder(
    orderID: '4897070508484',
    orderAmount: 100.0,
    orderDateTime: DateTime.now().toLocal().toString(),
    payAmount: 80.0,
    discountAmount: 20.0,
    totalNum: 2,
    salesName: "茶茶",
    salesID: '66669999',
    payWay: "现金支付",
    items: [
      new Goods(
          barCode: "4897070508484",
          goodsNum: 2,
          goodsName: "多味花生",
          price: 50.28,
          discountPrice: 20.88,
          amount: 40.32,
          unit: '箱'),
      new Goods(
          barCode: '2101069010202',
          goodsNum: 1,
          goodsName: "丝柔纸尿裤",
          price: 60.0,
          discountPrice: 40.0,
          amount: 40.0,
          unit: '包')
    ],
  );

  bus.emit("dl_print", order);
}

void _printDailyStatement() {
  DailyStatement daily = DailyStatement(
      title: 'test',
      dailyTime: DateTime.now().toLocal(),
      dailyNO: '123456',
      salesID: '66668888',
      salesName: "茶",
      dailyAmount: 8856.88,
      saleNum: 687, //售卖总数量
      saleAmount: 9000,
      returnGoodsAmount: 123.45,
      returnGoodsCount: 1,
      returnGoodsNum: 2,
      items: [
        new Goods(
            barCode: "4897070508484",
            goodsNum: 2,
            goodsName: "多味花生",
            price: 50.28,
            discountPrice: 20.88,
            amount: 40.32,
            unit: '箱'),
        new Goods(
            barCode: '2101069010202',
            goodsNum: 189,
            goodsName: "丝柔纸尿裤，丝柔纸尿裤，丝柔纸尿裤",
            price: 60.0,
            discountPrice: 40.0,
            amount: 40.0,
            unit: '包')
      ]);
  bus.emit('dl_print', daily);
}

class _MrketState extends State<Mrket> {
  String _platformVersion = 'Unknown';
  GlobalKey<UpdateDialogState> _dialogKey = new GlobalKey();
  @override
  void initState() {
    super.initState();
    // Sunmi.bindPrinter();
    FlutterBugly.init(
            androidAppId: "f579aec2d6",
            iOSAppId: "79299d44d1",
            autoCheckUpgrade: true,
            autoInit: true)
        .then((_result) {
      setState(() {
        _platformVersion = _result.message;
        print('appid=$_result.appId,result=$_result');
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // Sunmi.unbindPrinter();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text(
            "打印",
            style: TextStyle(backgroundColor: Colors.red),
          ),
          onPressed: () {
            _print();
            // Sunmi.printArray();
          },
        ),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed('routeName');
            },
            child: Text("carsh")),
        GestureDetector(
          onTap: () {
            if (Platform.isAndroid) {
              _checkUpgrade();
            }
          },
          child: Center(
            child: Text('init result: $_platformVersion\n'),
          ),
        ),
        RaisedButton(
          onPressed: () {
            _printDailyStatement();
          },
          child: Text("打印日结单"),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (_) => new AntiStockList(
                      eventName: "销售",
                      eventNo: "123456789",
                    )));
          },
          child: Text("防串货"),
        )
      ],
    ));
  }

  void _checkUpgrade() {
    print("获取更新中。。。");
    FlutterBugly.getUpgradeInfo().then((UpgradeInfo info) {
      print("-getUpgradeInfo---------------$info");
    });
    FlutterBugly.checkUpgrade(isManual: true, isSilence: true)
        .then((UpgradeInfo info) {
      if (info != null && info.id != null) {
        print("----------------${info.apkUrl}");

        _showUpdateDialog(info.newFeature, info.apkUrl, info.upgradeType == 2);
      }
    });
  }

  void _showUpdateDialog(String version, String url, bool isForceUpgrade) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => _buildDialog(version, url, isForceUpgrade),
    );
  }

  Widget _buildDialog(String version, String url, bool isForceUpgrade) {
    return WillPopScope(
        onWillPop: () async => isForceUpgrade,
        child: UpdateDialog(
          key: _dialogKey,
          version: version,
          onClickWhenDownload: (_msg) {
            //提示不要重复下载
            print("不要重复下载");
          },
          onClickWhenNotDownload: () async {
            //下载apk，完成后打开apk文件，建议使用dio+open_file插件
            Directory dir = await getApplicationDocumentsDirectory();
            String path = dir.path;
            print('path=$path');
            Response response = await Dio().download(url, path + '/pos.apk',
                onReceiveProgress: (int count, int total) {
              _updateProgress(count / total);
            });
            if (response.statusCode == 200) {
              print('下载请求成功');

              // Map<PermissionGroup, PermissionStatus> permissions =
              //     await PermissionHandler()
              //         .requestPermissions([PermissionGroup.storage]);
              // if (permissions[PermissionGroup.storage] ==
              //     PermissionStatus.granted) {
              //   InstallPlugin.installApk(
              //           path + '/pos.apk', 'com.example.dl_pos')
              //       .then((result) {
              //     print('install apk $result');
              //   }).catchError((error) {
              //     print('install apk error: $error');
              //   });
              // } else {
              //   print('Permission request fail!');
              // }
            }
          },
        ));
  }

  //dio可以监听下载进度，调用此方法
  void _updateProgress(_progress) {
    setState(() {
      _dialogKey.currentState.progress = _progress;
    });
  }
}
