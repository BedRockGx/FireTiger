import 'package:firetiger/PluginWidget/Canvas.dart';
import 'package:firetiger/utils/Behavior.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff333333),
            ),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          brightness: Brightness.light,
          backgroundColor: Color(0xfffff),
          elevation: 0
      ),
      body: ScrollConfiguration(
        behavior: OverScrollBehavior(),
        child:ListView(
          padding: EdgeInsets.symmetric(
                horizontal: ScreenAdapter.setWidth(90),
                vertical: ScreenAdapter.setHeight(30)),
          children: <Widget>[
            CustomPaint(
              painter: CurvePainter(),
              child: Container(
                padding:
                    EdgeInsets.only(bottom: ScreenAdapter.setHeight(10)),
                child: Text('登录',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(60),
                        fontWeight: FontWeight.bold,
                        color: Color(0xff333333))),
                // height: ScreenAdapter.setHeight(30),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(90)),
              child: Column(
                children: <Widget>[
                          Container(
                            height: ScreenAdapter.setHeight(100),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: ScreenAdapter.setHeight(1),
                                        color: Color(0xffE5E5E5)))),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight: ScreenAdapter.setHeight(100),
                                      // maxWidth: 200
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        hintText: '请输入手机号码',
                                        hintStyle: TextStyle(
                                            fontSize: ScreenAdapter.size(30),
                                            color: Color(0xffCECECE)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Container(
                            height: ScreenAdapter.setHeight(100),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: ScreenAdapter.setHeight(1),
                                        color: Color(0xffE5E5E5)))),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight: ScreenAdapter.setHeight(100),
                                      // maxWidth: 200
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        hintText: '请输入密码',
                                        hintStyle: TextStyle(
                                            fontSize: ScreenAdapter.size(30),
                                            color: Color(0xffCECECE)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                                      
                ],
              ),
            ),
            
          Column(
            children: <Widget>[
              Container(
                width: ScreenAdapter.setWidth(500),
                height: ScreenAdapter.setHeight(70),
                margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(200)),
                child: RaisedButton(
                  child: Text('立即登录', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                  onPressed: () {
                    
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      '你也可以使用设计账号登录 或 ',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: ScreenAdapter.size(25)),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      child: Text(
                        '账号密码登录',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: ScreenAdapter.size(25)),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/passwordlogin');
                    },
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top:ScreenAdapter.setHeight(100)),
                 child: Row(
                  children: <Widget>[
                    Container()
                  ],
                ),
              )
            ],
          )
          ],
        )
      )
    );
  }
}