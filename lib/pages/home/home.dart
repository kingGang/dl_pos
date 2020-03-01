import 'package:flutter/material.dart';
import '../../view/imagebutton.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var widths = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: new BoxDecoration(
                      // border: new Border.all(width: 2.0, color: Colors.red),
                      // color: Colors.black,
                      // borderRadius: new BorderRadius.only(
                      //     topLeft: Radius.circular(20.0),
                      //     topRight: Radius.circular(20.0)),
                    ),
                    margin: EdgeInsets.only(
                      left: 20.0,
                      right: 15.0,
                      top: 30.0,
                    ),
                    // padding:EdgeInsets.only(left: 10.0, right: 15.0, top: 40.0),
                    // width: widths.width,
                    child: Text(
                      '上午好，xxx',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Expanded(
                  child: new Container(
                    decoration: new BoxDecoration(
                      // border: new Border.all(width: 2.0, color: Colors.red),
                      // color: Colors.black,
                      // borderRadius: new BorderRadius.only(
                      //     topLeft: Radius.circular(20.0),
                      //     topRight: Radius.circular(20.0)),
                    ),
                      margin: EdgeInsets.only(right: 20.0, top: 18.0),
                      padding: EdgeInsets.only(left: 40.0,top:20.0,right:5.0,bottom: 0.0),
                      // width: 60.0,

                      // height: 100.0,
                      child: Image.asset(
                        'assets/image/Sy_Dz@2x.png',
                        // width: widths.width / 7,
                      )),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
//                  padding: new EdgeInsets.only(left: 15.0,right: 15.0),
                  margin: EdgeInsets.only(left: 15.0, right: 15.0),
                  decoration: new BoxDecoration(
                      // border: new Border.all(width: 2.0, color: Colors.red),
                      // color: Colors.black,
                      // borderRadius: new BorderRadius.only(
                      //     topLeft: Radius.circular(20.0),
                      //     topRight: Radius.circular(20.0)),
                      ),
                  child: new ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(20.0),
                      topRight: new Radius.circular(20.0),
                    ),
                    
                      child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(top:25.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  ImageButton(imgAssets:"assets/image/Sy_Sk@2x.png",imgWidth: 56.0,imgHeight:56.0,fontSize: 14.0,title:"开单",onPress:(){}),
                                  ImageButton(imgAssets:"assets/image/Sy_Kd@2x.png",imgWidth: 56.0,imgHeight:56.0,fontSize: 14.0,title:"挂单",onPress:(){}),
                                 ],
                              ),
                            ],
                          )),
                    
                  ),
                ))
              ],
            ),
            
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 15.0, right: 15.0),
                  decoration: new BoxDecoration(
                    // border: new Border.all(width: 2.0, color: Colors.red),
                    color: Colors.white,
                    // borderRadius: new BorderRadius.only(
                    //     topLeft: Radius.circular(20.0),
                    //     topRight: Radius.circular(20.0)),
                  ),
                  child:GridView.count(
                    crossAxisCount: 4,  //显示几列
                    crossAxisSpacing: 2.0, //左右距离
                    mainAxisSpacing: 2.0, //上下距离
                    children: <Widget>[
                      ImageButton(imgAssets: "assets/image/index/Sy_Gn_Ico1@2x.png",title: "会员管理",onPress: (){},),
                      ImageButton(imgAssets: "assets/image/index/Sy_Gn_Ico2@2x.png",title: "商品管理",onPress: (){},),
                      ImageButton(imgAssets: "assets/image/index/Sy_Gn_Ico3@2x.png",title: "供应商",onPress: (){},),
                      ImageButton(imgAssets: "assets/image/index/Sy_Gn_Ico4@2x.png",title: "库存盘点",onPress: (){},),
                      ImageButton(imgAssets: "assets/image/index/Sy_Gn_Ico5@2x.png",title: "员工管理",onPress: (){},),
                      ImageButton(imgAssets: "assets/image/index/Sy_Gn_Ico6@2x.png",title: "日结",onPress: (){},),
                      ImageButton(imgAssets: "assets/image/index/Sy_Gn_Ico8@2x.png",title: "出入库管理",onPress: (){},),
                      ImageButton(imgAssets: "assets/image/index/Sy_Gn_Ico10@2x.png",title: "调货单",onPress: (){},),
                      ImageButton(imgAssets: "assets/image/index/Sy_Gn_Ico7@2x.png",title: "得乐采购",onPress: (){},),
                      ImageButton(imgAssets: "assets/image/index/Sy_Gn_Ico9@2x.png",title: "活动管理",onPress: (){},),
                      ImageButton(imgAssets: "assets/image/index/repertory.png",title: "库存管理",onPress: (){},),
                      Text("data",style: TextStyle(color:Colors.grey,backgroundColor: Colors.black),),
                    ],
                  ),
                ))
              ],
            ),
        );
  }
}
