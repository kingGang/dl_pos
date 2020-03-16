import 'package:dio/dio.dart';
import 'package:dl_pos/model/antiinfo.dart';
import 'package:dl_pos/uitls/dioutil.dart';
import 'package:dl_pos/view/rawkeytextfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

var antiInfo = new AntiStockInfo();
var http = Dio(BaseOptions(baseUrl: BaseUrl));
// const String BaseUrl ="https://care.lingo8.cn/";
const String BaseUrl = "https://pos.api.caredaily.com/";

class AntiStockList extends StatefulWidget {
  AntiStockList({String eventName, String eventNo}) {
    antiInfo.eventName = eventName;
    antiInfo.eventNO = eventNo;
    antiInfo.antiCodes = new Set<String>();
    http.options.headers = {
      'Authorization': '692072e2-4c85-4e78-b6ba-43adb0983e6f'
    };
  }
  @override
  _AntiStockListState createState() => _AntiStockListState();
}

Future<void> _getList() async {
    DioUtil().get("/pos/mobile/antistock/eventno/:event_no",(data){
      dynamic items = data["data"];
      if (data["ok"] && items != null) {
        for (int i = 0; i < items.length; i++) {
          antiInfo.antiCodes.add(items[i]["anti_code"]);
        }
      }
    }, queryParameters: {
      "event_no": antiInfo.eventNO,
});  
}

class _AntiStockListState extends State<AntiStockList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getList();
    Future.delayed(Duration(seconds: 2), () {
      if (this.mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    antiInfo.antiCodes.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(100, 0, 0, 0),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("防窜货码列表"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.done),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
        body: Column(children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
              child: RawKeyTextField(
                inputFinsh: (val) async {
                  print("扫码值为：$val");
                  if (antiInfo.antiCodes.add(val)) {
                    print("添加成功");
                    Response resp = await http.post("/pos/mobile/antistock/add",
                        data: {
                          "event_name": antiInfo.eventName,
                          "event_no": antiInfo.eventNO,
                          "anti_code": val
                        });
                    if (resp.statusCode == 200) {
                      if (resp.data["ok"]) {
                        setState(() {});
                      }
                      print('$resp.data');
                    } else {
                      print("http状态错误;");
                    }
                  } else {
                    print("添加失败");
                  }
                },
              )),
          Expanded(
            child: Container(
              child: Scrollbar(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(UniqueKey().toString()),
                          dragStartBehavior: DragStartBehavior.down,
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.red,
                          ),
                          child: ListTile(
                            title: Text(antiInfo.antiCodes.elementAt(index)),
                            // subtitle: Text(subTitleItems[index]),
                            onTap: () {},
                          ),
                          onDismissed: (direction) async {
                            Response resp = await http.delete(
                                "/pos/mobile/antistock/eventno/:event_no/anticode/:anti_code",
                                queryParameters: {
                                  "event_no": antiInfo.eventNO,
                                  "anti_code":
                                      antiInfo.antiCodes.elementAt(index)
                                });
                            if (resp.statusCode == 200) {
                              if (resp.data["ok"]) {
                                setState(() {
                                  antiInfo.antiCodes.remove(
                                      antiInfo.antiCodes.elementAt(index));
                                });
                                Scaffold.of(context).hideCurrentSnackBar();
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('删除成功...'),
                                ));
                              }
                              print('$resp.data');
                            } else {
                              print("http状态错误;");
                            }
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          new Divider(),
                      itemCount: antiInfo.antiCodes.length)),
            ),
          )
        ]));
  }
}

List<String> subTitleItems = <String>[
  'subTitle: keyboard',
  'subTitle: print',
  'subTitle: router',
  'subTitle: pages',
  'subTitle: zoom_out_map',
  'subTitle: zoom_out',
  'subTitle: youtube_searched_for',
  'subTitle: wifi_tethering',
  'subTitle: wifi_lock',
  'subTitle: widgets',
  'subTitle: weekend',
  'subTitle: web',
  'subTitle: accessible',
  'subTitle: ac_unit',
];
List<String> strItems = <String>[
  '图标 -> keyboard',
  '图标 -> print',
  '图标 -> router',
  '图标 -> pages',
  '图标 -> zoom_out_map',
  '图标 -> zoom_out',
  '图标 -> youtube_searched_for',
  '图标 -> wifi_tethering',
  '图标 -> wifi_lock',
  '图标 -> widgets',
  '图标 -> weekend',
  '图标 -> web',
  '图标 -> accessible',
  '图标 -> ac_unit',
];

List<Icon> iconItems = <Icon>[
  new Icon(Icons.keyboard),
  new Icon(Icons.print),
  new Icon(Icons.router),
  new Icon(Icons.pages),
  new Icon(Icons.zoom_out_map),
  new Icon(Icons.zoom_out),
  new Icon(Icons.youtube_searched_for),
  new Icon(Icons.wifi_tethering),
  new Icon(Icons.wifi_lock),
  new Icon(Icons.widgets),
  new Icon(Icons.weekend),
  new Icon(Icons.web),
  new Icon(Icons.accessible),
  new Icon(Icons.ac_unit),
];

Widget buildListData(BuildContext context, String titleItem, Icon iconItem,
    String subTitleItem) {
  return new ListTile(
    leading: iconItem,
    title: new Text(
      titleItem,
      style: TextStyle(fontSize: 14),
    ),
    subtitle: new Text(
      subTitleItem,
    ),
    trailing: new Icon(Icons.remove_circle),
    // selected: true,
    // 创建点击事件
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(
              'ListViewAlert',
              style: new TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            ),
            content: new Text('您选择的item内容为:$titleItem'),
          );
        },
      );
    },
  );
}
