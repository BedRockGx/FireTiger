import 'dart:convert';

import 'package:firetiger/PluginWidget/Canvas.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/UserInfoProvider.dart';
import 'package:firetiger/utils/Behavior.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class PasswordLoginPage extends StatefulWidget {
  @override
  _PasswordLoginPageState createState() => _PasswordLoginPageState();
}

class _PasswordLoginPageState extends State<PasswordLoginPage> {

  var api = Api();

  TextEditingController _phoneText;
  TextEditingController _passwordText;

  @override
  void initState() {
    super.initState();
    _phoneText = TextEditingController();
    _passwordText = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    var userInfoProvider = Provider.of<UserInfoProvider>(context);

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
          backgroundColor: Color(0xffFFFFFF),
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
                child: Text('账号密码登录',
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
                                      controller: _phoneText,
                                      style: TextStyle(fontSize: ScreenAdapter.size(30)),
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
                                      controller: _passwordText,
                                      style: TextStyle(fontSize: ScreenAdapter.size(30)),
                                      keyboardType: TextInputType.visiblePassword,
                                      obscureText: true,
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
                child: RaisedButton(
                  child: Text('立即登录', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  highlightColor:Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                  onPressed: () async{
                    if(_passwordText.text == ''){
                      Fluttertoast.showToast(msg: '请输入密码');
                      return;
                    }
                    api.getData(context, 'userLogin', formData: {'user_login':_phoneText.text, 'user_pass':_passwordText.text}).then((val){
                      var res = json.decode(val.toString());
                      if(res['data']['code'] == 0){
                        Navigator.pop(context);
                        Fluttertoast.showToast(msg: '登录成功~');
                        userInfoProvider.setIsLogin(true);
                        PublicStorage.setHistoryList('rtoken', res['data']['info'][0]['rtoken']);
                        PublicStorage.setHistoryList('uuid', res['data']['info'][0]['id']);
                        PublicStorage.setHistoryList('token', res['data']['info'][0]['token']);
                        api.getData(context, 'getLoginUserInfo', formData: {'uid':res['data']['info'][0]['id']}).then((res){
                          var response = json.decode(res.toString());
                          userInfoProvider.setUserInfo(response['data']['info']);
                        });
                      }else{
                        Fluttertoast.showToast(msg: res['data']['msg']);
                      }
                    });
                  },
                ),
              ),
            ],
          )
          ],
        )
      )
    );
  
    
   
  }
}