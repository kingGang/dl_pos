
class AntiStockInfo {
  String eventName;
  String eventNO;
  Set<String> antiCodes;


  AntiStockInfo(
    {this.eventName,
    this.eventNO,
    this.antiCodes
    });


  factory AntiStockInfo.fromJson(Map<String,dynamic> json)=>new AntiStockInfo(
    eventName:json["event_name"],
    eventNO: json["event_no"],
  );
}