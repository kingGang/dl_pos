import 'package:dl_pos/view/rawkeytextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show RawKeyDownEvent, RawKeyEventDataAndroid, SystemChannels;

class Mine extends StatefulWidget {
  Mine({Key key}) : super(key: key);

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  
  @override
  void initState() {
    // TODO: implement initState
    // this.focusNode.addListener(() {
    //   if (this.focusNode.hasFocus) {
    //     SystemChannels.textInput.invokeMethod('TextInput.hide');
    //     print("隐藏键盘");
    //   }
    // });
    super.initState();
    //
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          // FocusScope.of(context).requestFocus(FocusNode());
          print("点击空白处");
          
        },
      behavior: HitTestBehavior.translucent,
      child: Center(
        child: RawKeyTextField(inputFinsh: (val){
          print("扫码值为:$val");
        },),
      )
    );
  }
}
