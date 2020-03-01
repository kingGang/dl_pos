import 'package:date_format/date_format.dart';
import 'package:dl_pos/model/dailystatement.dart';
import 'dart:convert';
import 'package:dl_pos/uitls/printtemplate.dart';
import 'package:sunmi/class.dart';
import 'package:dl_pos/model/order.dart';
import 'package:sunmi/sunmi.dart';

//返回销售单打印模板
List<SunmiPrinter> getOrderPrinterList(DLOrder order,{String title='凯儿得乐专营店'}){
  List<dynamic> json = jsonDecode(order_print_template);
    List<SunmiPrinter> lists = [];
    // print(json[0]);
    var enter=new SunmiPrinter.fromJson(jsonDecode('{"OrderNo": 0, "PrintType": "ENTER", "PrintContent": null, "Options": {} }'));
    var alignleft=new SunmiPrinter.fromJson(jsonDecode('{"OrderNo": 0,"PrintType": "ALIGN","PrintContent": null, "Options": { "TextAlign": 0}}'));
    
    for (var i = 0; i < json.length; i++) {
      SunmiPrinter p=new SunmiPrinter.fromJson(json[i]);
      if (p.printContent!=null&&p.printContent=='{店铺名称}'){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: title,options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent.startsWith('{ID:')){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: 'ID:'+order.orderID.toString(),options: p.options,orderNo: p.orderNo);
        lists.add(p1);
        lists.add(new SunmiPrinter(
          printType:SUNMI_PRINT_TYPE.BARCODE ,
          printContent: order.orderID.toString(),
        options: SunmiPrinterOptions.fromJson(jsonDecode('{"BarcodeSymbology":7,"BarcodeWidth":2,"BarcodeHeight":100}')),orderNo: p.orderNo));
      }else if (p.printContent!=null&&p.printContent.startsWith('{订单日期:')){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: '订单日期:'+order.orderDateTime,options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent.startsWith('{打印日期:')){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: '打印日期:'+formatDate(DateTime.now().toLocal(),[yyyy, '-', mm, '-', dd,' ',hh,':',nn,':',ss]),options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent=='{商品··············数量··········金额}'){
        
         lists.add(new SunmiPrinter(printType: p.printType,printContent:'商品············数量········金额',orderNo: p.orderNo,options: p.options));
         lists.add(enter);
        for(int i=0;i<order.items.length;i++){
          lists.add(new SunmiPrinter(printType: p.printType,
          printContent:'${order.items[i].goodsName}(￥${order.items[i].price.toStringAsFixed(2)})',
          options: p.options,
          orderNo: p.orderNo));
          lists.add(enter);
          SunmiPrinter p1=new SunmiPrinter(
            printType: p.printType,
            printContent: '${order.items[i].barCode.padRight(16,"·")}×${order.items[i].goodsNum.toString()}${order.items[i].amount.toStringAsFixed(2).padLeft(16-order.items[i].goodsNum.toString().length,"·")}',
            options: p.options,
            orderNo: p.orderNo);
          lists.add(p1);
          lists.add(enter);
        }
      }else if (p.printContent!=null&&p.printContent.startsWith('{订单金额:')){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: '订单金额:￥'+order.orderAmount.toStringAsFixed(2),options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent.startsWith('{优惠金额:')){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: '优惠金额:￥'+order.discountAmount.toStringAsFixed(2),options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent.startsWith('{实付金额:')){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent:'实付金额:￥'+order.payAmount.toStringAsFixed(2),options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent.startsWith('{支付方式:')){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: '支付方式:'+order.payWay,options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent.startsWith('{销售员:')){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: '销售员:'+order.salesName,options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else{
        lists.add(p);
      }
    }
    return lists;
}

List<SunmiPrinter> getDailyStatementPrinterList(DailyStatement statement,{String title='凯儿得乐专营店'}){
  List<dynamic> json = jsonDecode(daily_print_template);
    List<SunmiPrinter> lists = [];
    // print(json[0]);
    var enter=new SunmiPrinter.fromJson(jsonDecode('{"OrderNo": 0, "PrintType": "ENTER", "PrintContent": null, "Options": {} }'));
    var alignleft=new SunmiPrinter.fromJson(jsonDecode('{"OrderNo": 0,"PrintType": "ALIGN","PrintContent": null, "Options": { "TextAlign": 0}}'));
    // var alignright=new SunmiPrinter.fromJson(jsonDecode('{"OrderNo": 0,"PrintType": "ALIGN","PrintContent": null, "Options": { "TextAlign": 2}}'));
    for (var i = 0; i < json.length; i++) {
      SunmiPrinter p=new SunmiPrinter.fromJson(json[i]);
      if (p.printContent!=null&&p.printContent=='{店铺名称}'){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: '●'+title,options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent.startsWith('{日结编号:')){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: 'ID:'+statement.dailyNO,options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent.startsWith('{日结日期:')){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: '日结日期:'+formatDate(statement.dailyTime,[yyyy, '-', mm, '-', dd,' ',hh,':',nn,':',ss]),options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent.startsWith('{打印日期:')){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: '打印日期:'+formatDate(DateTime.now().toLocal(),[yyyy, '-', mm, '-', dd,' ',hh,':',nn,':',ss]),options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent.startsWith('{日结人员:')){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: '日结人员:${statement.salesName}',options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent.startsWith('{今日总入账:')){
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: '今日总入账:${statement.dailyAmount.toStringAsFixed(2)}',options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent.startsWith('{卖货   ×100   ￥')){
        String fillstr='·';
        fillstr=fillstr.padRight(36-2*2-4-statement.saleNum.toString().length-statement.saleAmount.toStringAsFixed(2).length,' ');
          
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: '卖货   ×${statement.saleNum}$fillstr￥${statement.saleAmount.toStringAsFixed(2)}',options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent.startsWith('{退货   ×0     ￥')){
        String fillstr='·';
        fillstr=fillstr.padRight(36-2*2-4-statement.returnGoodsNum.toString().length-statement.returnGoodsAmount.toStringAsFixed(2).length,' ');
        SunmiPrinter p1=new SunmiPrinter(printType: p.printType,printContent: '退货   ×${statement.returnGoodsNum}$fillstr￥${statement.returnGoodsAmount.toStringAsFixed(2)}',options: p.options,orderNo: p.orderNo);
        lists.add(p1);
      }else if (p.printContent!=null&&p.printContent=='{商品··············数量··········金额}'){
        lists.add(new SunmiPrinter(printType: p.printType,printContent:'商品··············数量··········金额',orderNo: p.orderNo,options: p.options));
        lists.add(enter);
        lists.add(alignleft);
        for (int i=0;i<statement.items.length;i++){
          
            lists.add(new SunmiPrinter(printType: p.printType,
            printContent:'${statement.items[i].goodsName}',orderNo: p.orderNo,options: p.options));
            lists.add(enter);
            String fillstr=statement.items[i].barCode;
            fillstr=fillstr.padRight(20,' ');

            lists.add(new SunmiPrinter(printType: p.printType,
            printContent:'$fillstr${statement.items[i].goodsNum.toString().padRight(4)}${statement.items[i].amount.toStringAsFixed(2).padLeft(14)}',orderNo: p.orderNo,options: p.options));
            lists.add(enter);
          
          
        }
      }else{
        lists.add(p);
      }
    }
    return lists;
}
void dlPrint(String title,dynamic args){
  if (args is DLOrder){
    List<SunmiPrinter> lists=getOrderPrinterList(args);
    Sunmi.printArray(array: lists);
  }else if( args is DailyStatement){
    List<SunmiPrinter> lists=getDailyStatementPrinterList(args);
    Sunmi.printArray(array: lists);
  } else{
    print("打印参数不合法");
  }
}