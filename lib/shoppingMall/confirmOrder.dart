import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ConfirmOrder extends StatefulWidget {
  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('确认订单', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xffFAFAFA),
        brightness: Brightness.light,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            IconData(0xe654, fontFamily: 'myIcon'),
            size: ScreenAdapter.size(60),
            color: Color(0xff333333),
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(IconData(0xe678, fontFamily: 'myIcon'), color: Colors.black,),
            onPressed: (){

            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(ScreenAdapter.setWidth(20)),
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Container(
                  margin:  EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                    padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(60), horizontal:ScreenAdapter.setWidth(20)),
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(100),
                          margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                          child: Image.asset('assets/images/address.png'),
                        ),
                        Expanded(
                          flex: 1,
                          child:InkWell(
                            child: 
                            Container(
                              child: Text('请填写收货地址', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(35)),),
                            ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: <Widget>[
                            //     Row(
                            //       children: <Widget>[
                            //         Text('毛多多', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(35)),),
                            //         SizedBox(width: ScreenAdapter.setWidth(20),),
                            //         Text('17012647824', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),)
                            //       ],
                            //     ),
                            //     SizedBox(
                            //       height: ScreenAdapter.setHeight(10),
                            //     ),
                            //     Container(
                            //       child: Text('浙江省杭州市下城区石桥路274号浙江省杭州市下城区石桥路274号', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                            //     )
                            //   ],
                            // ),
                            onTap: (){
                              Navigator.pushNamed(context, '/modifyAddress');
                            },
                          )
                          
                          
                        ),
                        Container(
                          width: ScreenAdapter.setWidth(100),
                          child: Icon(Icons.chevron_right, color: Color(0xffCACACA),),
                        ),
                      ],
                    ),
                  ),
                Container(
                    padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(60), horizontal:ScreenAdapter.setWidth(20)),
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(100),
                          margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                          child:FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image:
                                'https://img12.360buyimg.com/n7/jfs/t1/140162/39/258/417932/5ede68f2E4b58c4f5/fd41782b2ae1dddc.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text('iPhone11 商品名称商品名称商品名', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                              ),
                              SizedBox(
                                height: ScreenAdapter.setHeight(10),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: ScreenAdapter.setWidth(30),
                                    child: Image.asset('assets/images/jb2.png', fit: BoxFit.cover,),
                                  ),
                                  SizedBox(width: ScreenAdapter.setWidth(20),),
                                  Text('10000', style: TextStyle(fontSize: ScreenAdapter.size(40), fontWeight: FontWeight.bold, color: Color(0xffFF3641)),)
                                ],
                              ),
                              
                              
                            ],
                          ),
                        ),
                        Container(
                          width: ScreenAdapter.setWidth(100),
                          alignment: Alignment.center,
                          child: Text('x1', style: TextStyle(color: Color(0xffCACACA), fontSize: ScreenAdapter.size(25),))
                        ),
                      ],
                    ),
                  )
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: ScreenAdapter.setWidth(710),
                padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
                // height: ScreenAdapter.setHeight(80),
                color: Color(0xffF5F5F5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: ScreenAdapter.setWidth(30),
                              margin: EdgeInsets.only(right:ScreenAdapter.setWidth(10)),
                              child: Image.asset('assets/images/jb2.png'),
                            ),
                            Container(
                              child: Text('10000', style: TextStyle( fontSize: ScreenAdapter.size(40), fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: ScreenAdapter.setWidth(200),
                        child: RaisedButton(
                          child: Text('支付', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                          textColor: Colors.white,
                          highlightColor:Theme.of(context).primaryColor,
                          color:Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: 0,
                          onPressed:alertDialog
                        ),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  alertDialog(){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          content: Text('确认支付10000火虎币？', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(30))),
          backgroundColor: Colors.white,
          elevation: 24,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actions: <Widget>[
            Container(
              width: ScreenAdapter.setWidth(200),
              child:OutlineButton(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
                highlightedBorderColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Text('取消', style: TextStyle(color: Theme.of(context).primaryColor),),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              width:ScreenAdapter.setWidth(10)
            ),
            Container(
              width: ScreenAdapter.setWidth(200),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                highlightColor:Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Text('确认', style: TextStyle(color: Colors.white),),
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/shoppingOver');
                },
              ),
            )
          ],
        );
      }
    );
  }
}