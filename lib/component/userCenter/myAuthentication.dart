import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class MyAuthentication extends StatefulWidget {
  @override
  _MyAuthenticationState createState() => _MyAuthenticationState();
}

class _MyAuthenticationState extends State<MyAuthentication> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('我的认证', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
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
        child: ListView(
          padding: EdgeInsets.only(top:ScreenAdapter.setHeight(40)),
          children: <Widget>[
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
                margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(40)),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: ScreenAdapter.setWidth(100),
                      margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                      child: AspectRatio(
                        aspectRatio: 1/1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: Colors.red,
                            alignment: Alignment.center,
                            child: Icon(IconData(0xe68a, fontFamily: 'myIcon'), size: ScreenAdapter.size(70), color: Colors.white,),
                          ),
                        ),
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text('主播认证',textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(30)),),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text('尚未认证', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(30)),),
                          ),
                          Icon(Icons.chevron_right, color: Color(0xffCACACA), size: ScreenAdapter.size(35),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/anthenTicationWidget', arguments: {'type':1});
              },
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: ScreenAdapter.setWidth(100),
                      margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                      child: AspectRatio(
                        aspectRatio: 1/1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: Color(0xffFFC04E),
                            alignment: Alignment.center,
                            child: Icon(IconData(0xe689, fontFamily: 'myIcon'), size: ScreenAdapter.size(70), color: Colors.white,),
                          ),
                        ),
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text('专家认证',textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(30)),),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          // Container(
                          //   child: Text('尚未认证', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(30)),),
                          // ),
                          // Container(
                          //   child: Text('审核中', style: TextStyle(color: Colors.red, fontSize: ScreenAdapter.size(30)),),
                          // ),
                          Container(
                            child: Text('认证成功', style: TextStyle(color: Color(0xff8BBA7B), fontSize: ScreenAdapter.size(30)),),
                          ),
                          Icon(Icons.chevron_right, color: Color(0xffCACACA), size: ScreenAdapter.size(35),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/anthenTicationWidget', arguments: {'type':2});
              },
            )
          ],
        ),
      ),
    );
  }
}