import 'package:dl_pos/view/rawkeytextfield.dart';
import 'package:flutter/material.dart';

class AntiStockList extends StatefulWidget {
  @override
  _AntiStockListState createState() => _AntiStockListState();
}

class _AntiStockListState extends State<AntiStockList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(0, 0, 0, 0),
      
      body:Column(
        children:<Widget>[
          Container(
            margin: EdgeInsets.only(top:36),
            child:RawKeyTextField(inputFinsh: (val){
              print("扫码值为：$val");
              setState(() {
                strItems.insert(0,val);
                subTitleItems.insert(0,val);
                iconItems.insert(0,Icon(Icons.access_time));
              });
            },)
          ),
          Expanded(child: Container(
        child: Scrollbar(
      child: ListView.separated(itemBuilder: (context,item){
        return buildListData(context, strItems[item], iconItems[item], subTitleItems[item]);
      }, separatorBuilder: (BuildContext context, int index) => new Divider(),  itemCount: strItems.length)
      ),
      ),)
        ]
      )
      );
    
    
  }
}


List<String> subTitleItems = <String>[
    'subTitle: keyboard', 'subTitle: print',
    'subTitle: router', 'subTitle: pages',
    'subTitle: zoom_out_map', 'subTitle: zoom_out',
    'subTitle: youtube_searched_for', 'subTitle: wifi_tethering',
    'subTitle: wifi_lock', 'subTitle: widgets',
    'subTitle: weekend', 'subTitle: web',
    'subTitle: accessible', 'subTitle: ac_unit',
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

Widget buildListData(BuildContext context, String titleItem, Icon iconItem, String subTitleItem) {
    return new ListTile(
      leading: iconItem,
      title: new Text(
        titleItem,
        style: TextStyle(fontSize: 14),
      ),
      subtitle: new Text(
        subTitleItem,
      ),
      trailing: new Icon(Icons.keyboard_arrow_right),
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
