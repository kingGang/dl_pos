import 'package:flutter/material.dart';

/*
 * 图片 按钮
 */
class ImageButton extends StatefulWidget {

  final String imgAssets;
  final double imgWidth;
  final double imgHeight;
  final double fontSize;
  final String title;
  final GestureTapCallback onPress;

  const ImageButton({
    Key key,
    this.imgAssets="assets/image/index/Sy_Gn_Ico1@2x.png",
    this.imgWidth=35.0,
    this.imgHeight=35.0,
    this.fontSize=12.0,
    this.title="按钮",
    this.onPress,
  }) : super(key: key);

  @override
  _ImageButtonState createState() {
    // TODO: implement createState
    return _ImageButtonState(
    );
  }
}

class _ImageButtonState extends State<ImageButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
          child: Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.only(top:10.0),
            decoration: new BoxDecoration(
                    // border: new Border.all(width: 2.0, color: Colors.red),
                    color: Colors.white,
                    // borderRadius: new BorderRadius.only(
                    //     topLeft: Radius.circular(20.0),
                    //     topRight: Radius.circular(20.0)),
                  ),
            child:new Column(
            
            // alignment: const FractionalOffset(0.5, 1.0),
            children: <Widget>[
              new Image.asset(this.widget.imgAssets,width: this.widget.imgWidth,height: this.widget.imgHeight,),
              // IconButton(icon: Image(image: AssetImage("assets/image/index/Sy_Gn_Ico1@2x.png"),width: 80.0,height: 80.0,), onPressed: (){}),
              new Container(
                margin: EdgeInsets.only(left:1.0,top:5.0,right:1.0),
                child:Text(this.widget.title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              style: new TextStyle(
                fontSize: this.widget.fontSize,
                // fontWeight: FontWeight.bold,
                // color: Colors.black,
                letterSpacing: 0.5,
                // backgroundColor: Colors.red
              ),),
              )
            ],
          ),
          ),
          onTap: this.widget.onPress,
          onTapDown: (TapDownDetails details){
            print(details.toString());
          },);
  }
}

// FlatButton(
//       color: Colors.grey,
      
//       child: new Container(
//         margin: EdgeInsets.only(top: 1.0,left: 0.0,right: 0.0),
//         padding:EdgeInsets.only(top: 1.0,left: 0.0,right: 0.0),
//         decoration: BoxDecoration(
//               border: Border.all(color: Colors.red, width: 1.0),
//               // borderRadius: BorderRadius.circular(8.0),
//               // gradient: LinearGradient(colors: <Color>[
//               //   Colors.orange,
//               //   Colors.blue,
//               // ]),
//             // color: Colors.lightBlue,
//             ),

//         child: Column(children: <Widget>[
//           Expanded(
//             child: Container(
//               child: Image.asset(
//                 "assets/image/index/Sy_Gn_Ico1@2x.png",
//                 // alignment: Alignment.topLeft,
//                 fit: BoxFit.contain,
//               ),
              
//               // color: Colors.red,
//             ),
//           ),
//           // SizedBox(height:10.0),
//           // Expanded(
//           //   child: 
//           // )
//           Container(
//               margin: EdgeInsets.only(left:0.0,right:0.0,top: 1.0),
//               color: Colors.red,
              
//               height: 20.0,
//               child: Text("会员管理",
//                   style: TextStyle(
//                     // color: Color(0xff222222),
//                     fontSize: 12,
//                     // color: Colors.red
//                   )),
//             ),
//         ]),
//         // padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
//         alignment: Alignment.center,
//       ),
//       // shape: RoundedRectangleBorder(
//       //     borderRadius:
//       //         BorderRadius.circular(3.0)), //圆角大小,与BoxDecoration保持一致，更美观
//       onPressed: () {},
//       textColor: Colors.black,
//     );