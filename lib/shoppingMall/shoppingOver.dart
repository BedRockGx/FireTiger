import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ShoppingOver extends StatefulWidget {
  @override
  _ShoppingOverState createState() => _ShoppingOverState();
}

class _ShoppingOverState extends State<ShoppingOver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('兑换完成', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
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
      body: Container(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(top:ScreenAdapter.setHeight(200)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: ScreenAdapter.setWidth(120),
                        child: Image.asset('assets/images/over.png', fit:BoxFit.cover),
                      ),
                      SizedBox(
                        height: ScreenAdapter.setHeight(20),
                      ),
                      Text('你已成功兑换！', style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              Positioned(
                width: ScreenAdapter.setWidth(750),
                bottom: ScreenAdapter.setHeight(60),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                       width: ScreenAdapter.setWidth(400),
                      child: OutlineButton(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor),
                        highlightedBorderColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Text('返回商城', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}