
class DLOrder{
  final String orderID;
  final String orderDateTime; //订单时间
  final  double payAmount; //实际支付总额
  final  double orderAmount; //订单总额
  final  double discountAmount; //优惠金额
  final String salesID;
  final String salesName;
  final String payWay; //支付方式
  final int    totalNum;//商品件数
  final List<Goods> items; 

  DLOrder(
    {this.orderID='8888888888', 
    this.orderDateTime, 
    this.payAmount=0.0, 
    this.orderAmount=0.0,
    this.discountAmount=0.0, 
    this.salesID='000000', 
    this.salesName='无记录', 
    this.payWay='无记录', 
    this.totalNum=0,
    this.items}); 
  factory DLOrder.fromJson(Map<String,dynamic> json)=>new DLOrder(
    orderID: json['order_id'],
    orderDateTime: json['carete_at'],
    payAmount: json['pay_amount'],
    orderAmount: json['order_amount'],
    discountAmount: json['discount_amount'],
    salesID: json['sales_id'],
    salesName: json['sales_name'],
    payWay: json['pay_way'],
    totalNum: json['total_num'],
    // items: Goods.fromJson(json['items']),
  );

}

class Goods{
  final String barCode; //sku编码
  final String goodsName; //商品名称
  final double price; //商品价格
  final double discountPrice; //优惠价
  final int    goodsNum; //件数
  final double amount; //总价
  final String unit;//单位

  Goods({this.barCode='暂无',this.goodsName='无记录', this.price=0.0, this.discountPrice=0.0, this.goodsNum=0, this.amount=0.0, this.unit=''});  
 factory Goods.fromJson(Map<String,dynamic> json)=>new Goods(
   goodsName:json['goods_name'] ,
   price: json['price'],
   discountPrice: json['discount_price'],
   goodsNum: json['goods_num'],
   amount: json['amount'],
   unit: json['unit']
 );
}