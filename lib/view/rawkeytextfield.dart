import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RawKeyTextField extends StatefulWidget {
  Function inputFinsh; //外部函数
  final String hintText;
  RawKeyTextField({Key key,this.inputFinsh, this.hintText='请扫一维码'}) : super(key: key);

  @override
  _RawKeyTextFieldState createState() => _RawKeyTextFieldState();
}

class _RawKeyTextFieldState extends State<RawKeyTextField> {
  final focusNode = FocusNode();
  final _controller = TextEditingController();
  bool isRead = true;
  String _hintVal='扫码录入';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hintVal=this.widget.hintText;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: RawKeyboardListener(
          focusNode: this.focusNode,
          child: Container(
            // decoration: getCircleDecoration(color0),
            child: TextField(
              //  keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 12, color: Color(0xff333333)),
              controller: _controller,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: "请按音量键扫码",
                hintText: _hintVal,
                border: InputBorder.none,
                // suffixIcon: Icon(Icons.remove_circle),
                // suffixText: "删除",
                // prefixText: "prefixText",
                
              ),
              textAlign: TextAlign.right,
              maxLines: 1,
              autofocus: true,
              readOnly: isRead,
              onEditingComplete: (){
                setState(() {
                  _hintVal=_controller.text;
                  // _val='已经清除';
                  // _controller.text='';
                  _controller.clear();
                  this.isRead=true;
                });
                // print("----onEditingComplete:$_hintVal");
                if (this.widget.inputFinsh!=null){
                  this.widget.inputFinsh(_hintVal);
                }
              },
              onTap: () {
                //  context.widget.
                setState(() {
                  _hintVal='';
                  _controller.clear();
                  isRead = false;
                });
              },
            ),
          ),
          onKey: (RawKeyEvent event) {
            if (event is RawKeyDownEvent &&
                event.data is RawKeyEventDataAndroid) {
              RawKeyDownEvent rawKeyDownEvent = event;

              RawKeyEventDataAndroid rawKeyEventDataAndroid =
                  rawKeyDownEvent.data;
              // print("keyCode: ${rawKeyEventDataAndroid.keyCode}---${rawKeyEventDataAndroid.keyLabel}");

              switch (rawKeyEventDataAndroid.keyCode) {
                case 66: //KEY_ENTER
                  print(_controller.text);
                  setState(() {
                    // isRead=false;
                    // SystemChannels.textInput.invokeMethod('TextInput.hide');
                    _hintVal=_controller.text;
                  _controller.clear();
                  });
                  if (this.widget.inputFinsh!=null){
                    this.widget.inputFinsh(_hintVal);
                  }
                  // _controller.text='';
                  break;
                case 19: //KEY_UP
                  break;
                case 20: //KEY_DOWN
                  break;
                case 21: //KEY_LEFT
                  break;
                case 22: //KEY_RIGHT
                  break;
                default:
                if (_hintVal==_controller.text){
                  setState(() {
                    _controller.text='';
                    _hintVal='@clear';
                  });
                }
                  _controller.text +=
                      rawKeyEventDataAndroid.keyLabel.toString();
              }
            }
          }),
    );
  }
}