
import 'package:flutter/material.dart';


class LoadingPage extends StatefulWidget{
  @override
  _LoadingState createState()=>_LoadingState();
}

class _LoadingState extends State<LoadingPage>{
  @override
  void initState(){
    super.initState();
    //在页面停顿5秒
    Future.delayed(Duration(seconds: 3),(){
      print("pos终端程序启动");
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: Stack(
        children: <Widget>[
          Image.asset("assets/image/loading/loading1.jpeg"),
          Center(
            child:Text("启动页面",
            style: TextStyle(
              color:Colors.white,
              fontSize:36.0,
            ),
            ),
          )
        ],
      ),
    );
     
  }
}