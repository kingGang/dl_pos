import 'order.dart';

class DailyStatement {
  final String title;
  final DateTime dailyTime;
  final String dailyNO;
  final String salesID;
  final String salesName;
  final double dailyAmount; //日结总金额
  final int saleNum; //售卖总数量
  final double saleAmount; //售卖总金额
  final int returnGoodsCount; //退货次数
  final int returnGoodsNum; //退货总件数
  final double returnGoodsAmount;
  final List<Goods> items;

  DailyStatement(
      {this.title,
      this.dailyTime,
      this.dailyNO,
      this.salesID,
      this.salesName,
      this.dailyAmount,
      this.saleNum,
      this.saleAmount,
      this.returnGoodsCount,
      this.returnGoodsNum,
      this.returnGoodsAmount,
      this.items});
}
