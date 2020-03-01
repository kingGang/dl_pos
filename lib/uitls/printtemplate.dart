
final order_print_template='''[
    {
      "OrderNo": 0,
      "PrintType": "ALIGN",
      "PrintContent": null,
      "Options": {
        "TextAlign": 1
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "FONTSIZE",
      "PrintContent": null,
      "Options": {
        "FontSize": 30
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{店铺名称}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 1,
      "PrintType": "FONTSIZE",
      "PrintContent": null,
      "Options": {
        "FontSize": 22
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{ID:8888 8888 8888}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ALIGN",
      "PrintContent": null,
      "Options": {
        "TextAlign": 0
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{订单日期:2019-12-10 15:16:30}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
     "PrintContent": "{打印日期:2019-12-10 15:16:30}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ALIGN",
      "PrintContent": null,
      "Options": {
        "TextAlign": 1
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "==================================",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ALIGN",
      "PrintContent": null,
      "Options": {
        "TextAlign": 0
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{商品··············数量··········金额}",
      "Options": {
        "TextAlign": 0
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "----------------------------------",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{订单金额:2000.00}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{优惠金额:200.00}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{实付金额:2000.00}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{支付方式:现金支付}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{销售员:张三}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "--------------END---------------",
      "Options": {
        "TextAlign": 1
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    }
  ]''';

//日结打印模板
final daily_print_template='''[
    {
      "OrderNo": 0,
      "PrintType": "ALIGN",
      "PrintContent": null,
      "Options": {
        "TextAlign": 0
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "FONTSIZE",
      "PrintContent": null,
      "Options": {
        "FontSize": 30
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{店铺名称}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 1,
      "PrintType": "FONTSIZE",
      "PrintContent": null,
      "Options": {
        "FontSize": 20
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{日结编号:8888 8888 8888}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{日结日期:2019-12-10 15:16:30}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
     "PrintContent": "{打印日期:2019-12-10 15:16:30}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
     "PrintContent": "{日结人员:张三}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
     "PrintContent": "{今日总入账:8888.88}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "==================================",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ALIGN",
      "PrintContent": null,
      "Options": {
        "TextAlign": 1
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{卖货   ×100   ￥12345.67}",
      "Options": {
        "TextAlign": 0
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
  {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{退货   ×0     ￥0.00}",
      "Options": {
        "TextAlign": 0
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "----------------------------------",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{日结明细}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ALIGN",
      "PrintContent": null,
      "Options": {
        "TextAlign": 1
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "{商品··············数量··········金额}",
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
   
    {
      "OrderNo": 0,
      "PrintType": "TEXT",
      "PrintContent": "--------------END---------------",
      "Options": {
        "TextAlign": 1
      }
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    },
    {
      "OrderNo": 0,
      "PrintType": "ENTER",
      "PrintContent": null,
      "Options": {}
    }
  ]''';