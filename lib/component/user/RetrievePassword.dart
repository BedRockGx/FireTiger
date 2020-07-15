import 'package:firetiger/PluginWidget/Canvas.dart';
import 'package:firetiger/utils/Behavior.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class RetrievePage extends StatefulWidget {
  @override
  _RetrievePageState createState() => _RetrievePageState();
}

class _RetrievePageState extends State<RetrievePage> {

  var _index;
  double _progressVal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _index = 0;
    _progressVal = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: ListView(
          padding: EdgeInsets.symmetric(
                  horizontal: ScreenAdapter.setWidth(90),
                  vertical: ScreenAdapter.setHeight(30)),
          children: <Widget>[
            CustomPaint(
              painter: CurvePainter(),
              child: Container(
                padding:
                    EdgeInsets.only(bottom: ScreenAdapter.setHeight(10)),
                child: Text('找回密码',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(60),
                        fontWeight: FontWeight.bold,
                        color: Color(0xff333333))),
                // height: ScreenAdapter.setHeight(30),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(50)),
              height: ScreenAdapter.setHeight(150),
              child: Stack(
                children: <Widget>[
                  Positioned(
                  width: ScreenAdapter.setWidth(750),
                    top:ScreenAdapter.setHeight(30),
                    child: 
                    SizedBox(
                      height: ScreenAdapter.setHeight(2),
                      child: LinearProgressIndicator(
                        value: _progressVal,
                        backgroundColor:Color(0xffDFDFDF),
                        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                      ),
                    )
                    // Container(
                    //    width: ScreenAdapter.setWidth(750),
                    //   height: ScreenAdapter.setHeight(2),
                    //   decoration: BoxDecoration(color: Color(0xffDFDFDF)),
                    // ),
                  ),
                  Positioned(
                    top:0,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth:ScreenAdapter.setWidth(570),
                      ),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(110),
                          color: Color(0xffFAFAFA),
                          padding:EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20)),
                          child: AspectRatio(
                            aspectRatio: 1/1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(ScreenAdapter.setWidth(55)),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor
                                ),
                                child: Text('1', style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(50), fontWeight: FontWeight.w700),),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenAdapter.setWidth(110),
                          color: Color(0xffFAFAFA),
                          padding:EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20)),
                          child: AspectRatio(
                            aspectRatio: 1/1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(ScreenAdapter.setWidth(55)),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color:_index == 1 || _index == 2 ?  Theme.of(context).primaryColor : Color(0xffDFDFDF)
                                ),
                                child: Text('2', style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(50), fontWeight: FontWeight.w700),),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenAdapter.setWidth(110),
                          color: Color(0xffFAFAFA),
                          padding:EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20)),
                          child: AspectRatio(
                            aspectRatio: 1/1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(ScreenAdapter.setWidth(55)),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _index == 2 ?  Theme.of(context).primaryColor : Color(0xffDFDFDF)
                                ),
                                child: Text('3', style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(50), fontWeight: FontWeight.w700),),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    )
                    
                  ),
                  _index == 1 ? Positioned(
                    bottom: ScreenAdapter.setHeight(20),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Text('验证码发送至', style: TextStyle(fontSize: ScreenAdapter.size(28), color: Color(0xffA4A4A4)),),
                          Text('138 **** 8888', style: TextStyle(fontSize: ScreenAdapter.size(30)),)
                        ],
                      ),
                    ),
                  ):Container()
                ],
              )
            ),

            
            
              IndexedStack(
                index:_index,
                children: <Widget>[
                  Column(
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
                              Container(
                                child: Text(
                                  '+86',
                                  style:
                                      TextStyle(fontSize: ScreenAdapter.size(32)),
                                ),
                              ),
                              SizedBox(
                                width: ScreenAdapter.setWidth(20),
                              ),
                              Expanded(
                                flex: 1,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: ScreenAdapter.setHeight(100),
                                    // maxWidth: 200
                                  ),
                                  child: TextField(
                                    style: TextStyle(fontSize: ScreenAdapter.size(30)),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      hintText: '请输入手机号码',
                                      hintStyle: TextStyle(
                                          fontSize: ScreenAdapter.size(32),
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
                          margin: EdgeInsets.only(top:ScreenAdapter.setHeight(50)),
                          width: ScreenAdapter.setWidth(400),
                          height: ScreenAdapter.setHeight(70),
                          child: RaisedButton(
                            highlightColor:Theme.of(context).primaryColor,
                            child: Text('下一步', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                            textColor: Colors.white,
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            elevation: 0,
                            onPressed: () {
                              setState(() {
                                _index = 1;
                                _progressVal = 0.4;
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                  Column(
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
                                  style: TextStyle(fontSize: ScreenAdapter.size(30)),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    hintText: '请输入验证码',
                                    hintStyle: TextStyle(
                                        fontSize: ScreenAdapter.size(30),
                                        color:Color(0xffCECECE)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: ScreenAdapter.setWidth(20),
                            ),
                            Container(
                              child: Text(
                                '获取验证码',
                                style: TextStyle(
                                    fontSize: ScreenAdapter.size(28),
                                    color: Theme.of(context).primaryColor),
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
                                  style: TextStyle(fontSize: ScreenAdapter.size(30)),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    hintText: '请设置6-20位至少两种字符组合密码',
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
                          margin: EdgeInsets.only(top:ScreenAdapter.setHeight(50)),
                          width: ScreenAdapter.setWidth(400),
                          height: ScreenAdapter.setHeight(70),
                          child: RaisedButton(
                            highlightColor:Theme.of(context).primaryColor,
                            child: Text('下一步', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                            textColor: Colors.white,
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            elevation: 0,
                            onPressed: () {
                              setState(() {
                                _index = 2;
                                _progressVal = 1;
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                       Container(
                          height: ScreenAdapter.setHeight(100),
                          alignment: Alignment.center,
                          child:Text('密码找回成功', style: TextStyle(fontSize: ScreenAdapter.size(30)),)
                        ),
                        Container(
                          margin: EdgeInsets.only(top:ScreenAdapter.setHeight(50)),
                          width: ScreenAdapter.setWidth(400),
                          height: ScreenAdapter.setHeight(70),
                          child: RaisedButton(
                            highlightColor:Theme.of(context).primaryColor,
                            child: Text('重新登录', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                            textColor: Colors.white,
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            elevation: 0,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                    ],
                  )
                  
                ],
              )
          ],
        ),
      ),
    );
  }
}