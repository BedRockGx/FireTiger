

import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('我的账户', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
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
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Color(0xffFFC6CA),
                        Color(0xffFF3641)
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.help, color: Colors.white, size: ScreenAdapter.size(40),),
                            SizedBox(width: ScreenAdapter.setWidth(10),),
                            Text('火花', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Colors.white))
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top:ScreenAdapter.setHeight(20), bottom:ScreenAdapter.setHeight(40)),
                          // alignment: Alignment.centerLeft,
                          child: Text('12', style: TextStyle(fontSize: ScreenAdapter.size(60), color: Colors.white, fontWeight: FontWeight.bold,), ),
                        ),
                        InkWell(
                          child: Container(
                            alignment: Alignment.center,
                            width: ScreenAdapter.setWidth(120),
                            height: ScreenAdapter.setHeight(50),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width:ScreenAdapter.setWidth(1), color:Color(0xffFF3641)),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Text('充值'),
                          ),
                          onTap: (){

                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenAdapter.setWidth(20),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Color(0xffFFDF5A),
                        Color(0xffFF7038)
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.help, color: Colors.white, size: ScreenAdapter.size(40),),
                            SizedBox(width: ScreenAdapter.setWidth(10),),
                            Text('火虎币', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Colors.white))
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top:ScreenAdapter.setHeight(20), bottom:ScreenAdapter.setHeight(40)),
                          // alignment: Alignment.centerLeft,
                          child: Text('12千万', style: TextStyle(fontSize: ScreenAdapter.size(50), color: Colors.white, fontWeight: FontWeight.bold,), ),
                        ),
                        Row(
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                width: ScreenAdapter.setWidth(120),
                                height: ScreenAdapter.setHeight(50),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width:ScreenAdapter.setWidth(2), color:Color(0xffFF3641)),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Text('做任务'),
                              ),
                              onTap: (){

                              },
                            ),
                            SizedBox(
                              width: ScreenAdapter.setWidth(15),
                            ),
                            InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                width: ScreenAdapter.setWidth(120),
                                height: ScreenAdapter.setHeight(50),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width:ScreenAdapter.setWidth(2), color:Color(0xffFF3641)),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Text('兑换'),
                              ),
                              onTap: (){

                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(60)),
            margin: EdgeInsets.only(top:ScreenAdapter.setHeight(30)),
            child: Text('我的消费记录', style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
          ),

          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: ScreenAdapter.setHeight(30)),
                padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(60)),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: ScreenAdapter.setWidth(50),
                      margin: EdgeInsets.only(right:ScreenAdapter.setWidth(15)),
                      child: Icon(Icons.help),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('充值火花', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                          SizedBox(height: ScreenAdapter.setHeight(10),),
                          Text('05-08 22:10', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),)
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: ScreenAdapter.setWidth(100),
                      child: Text('+12', style: TextStyle(fontSize: ScreenAdapter.size(35), color: Colors.red)),
                    ),
                  ],
                ),
              ),
               Container(
                margin: EdgeInsets.symmetric(vertical: ScreenAdapter.setHeight(30)),
                padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(60)),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: ScreenAdapter.setWidth(50),
                      margin: EdgeInsets.only(right:ScreenAdapter.setWidth(15)),
                      child: Icon(Icons.help),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('消费火虎币', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                          SizedBox(height: ScreenAdapter.setHeight(10),),
                          Text('03-12 22:10', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),)
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: ScreenAdapter.setWidth(100),
                      child: Text('-92万', style: TextStyle(fontSize: ScreenAdapter.size(35))),
                    ),
                  ],
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}