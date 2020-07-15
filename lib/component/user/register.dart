import 'dart:async';
import 'dart:convert';

import 'package:firetiger/PluginWidget/Canvas.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/Behavior.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:firetiger/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController _phoneText = TextEditingController();
  TextEditingController _codeText = TextEditingController();
  TextEditingController _passwordText = TextEditingController();
  Timer _timer;
  int _countdownTime = 60;
  bool _verification_available = false;
  bool _password_available = false;
  var api = Api();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    _phoneText.text = '';
    _codeText.text = '';
    _passwordText.text = '';
    if(_timer != null){
      _timer.cancel();
      _countdownTime = 60;
    }
    _verification_available = false;
    _password_available = false;
  }

  getVerification(){
    if(_countdownTime == 60){
      return Text(
                '获取验证码',
                style: TextStyle(
                    fontSize: ScreenAdapter.size(28),
                    color: Theme.of(context).primaryColor),
              );
    }else{
      return Text(
                '$_countdownTime秒后获取',
                style: TextStyle(
                    fontSize: ScreenAdapter.size(28),
                    color: Color(0xffA4A4A4)),
              );
    }
  }

  startCountdownTimer(){
    // 定义时间：秒
    const oneSec = const Duration(seconds:1);
    // 定义回调方法
    var callback = (timer) => {
      setState((){
        // 如果小于1，便停止定时器
        if(_countdownTime == 1){
          _timer.cancel();
          _countdownTime = 60;
        }else{
          _countdownTime--;
        }
      })
    };

    _timer = Timer.periodic(oneSec, callback);
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
            elevation: 0),
        body: ScrollConfiguration(
            behavior: OverScrollBehavior(),
            child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenAdapter.setWidth(90),
                  vertical: ScreenAdapter.setHeight(30)),
              children: <Widget>[
                Container(
                  width: ScreenAdapter.setWidth(30),
                  child: CustomPaint(
                    painter: CurvePainter(),
                    child: Container(
                      padding:
                          EdgeInsets.only(bottom: ScreenAdapter.setHeight(10)),
                      child: Text('注册',
                          style: TextStyle(
                              fontSize: ScreenAdapter.size(60),
                              fontWeight: FontWeight.bold,
                              color: Color(0xff333333))),
                      // height: ScreenAdapter.setHeight(30),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: ScreenAdapter.setHeight(90)),
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
                            Container(
                              child: Text(
                                '+86',
                                style:
                                    TextStyle(fontSize: ScreenAdapter.size(30)),
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
                                  controller: _phoneText,
                                  style: TextStyle(fontSize: ScreenAdapter.size(30)),
                                  keyboardType:TextInputType.phone,
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
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
                                  onChanged: (val){
                                    if (Utils.isChinaPhoneLegal(val)) {
                                      setState(() {
                                        _verification_available = true;
                                      });
                                    } else {
                                      setState(() {
                                        _verification_available = false;
                                      });
                                    }
                                  },
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
                                  controller: _codeText,
                                  style: TextStyle(fontSize: ScreenAdapter.size(30)),
                                  keyboardType:TextInputType.phone,
                                  enabled: _verification_available ? true : false,
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
                              child: InkWell(
                                child: getVerification(),
                                onTap: (){
                                  if(_verification_available){
                                    if(_countdownTime == 60){
                                      api.getData(context, 'getCode', formData: {'mobile':_phoneText.text}).then((val){
                                        var response = json.decode(val.toString());
                                        print(response);
                                        if(response['data']['code'] == 0){
                                          Fluttertoast.showToast(msg: '验证码发送成功！请注意查收~');
                                          if(_countdownTime == 60){
                                            startCountdownTimer();
                                          }
                                        }else{
                                          Fluttertoast.showToast(msg: response['data']['msg']);
                                        }
                                      });
                                    }else{
                                      Fluttertoast.showToast(msg: '请稍后获取验证码~');
                                      return;
                                    }
                                  }else{
                                    Fluttertoast.showToast(msg: '请输入正确的手机号');
                                    return;
                                  }
                                },
                              )
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
                                  keyboardType:TextInputType.visiblePassword,
                                  obscureText:true,
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter(RegExp("[a-zA-Z1-9]")),
                                    
                                    LengthLimitingTextInputFormatter(20)
                                  ],
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
                                  onChanged: (val){
                                    if (Utils.isLoginPassword(val)) {
                                      setState(() {
                                        _password_available = true;
                                      });
                                    } else {
                                      setState(() {
                                        _password_available = false;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: ScreenAdapter.setWidth(500),
                      height: ScreenAdapter.setHeight(70),
                      child: RaisedButton(
                        child: Text('立即注册', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                        textColor: Colors.white,
                        highlightColor:_verification_available && _codeText.text != '' ? 
                              Theme.of(context).primaryColor : Color(0xffDFDFDF),
                        color: _verification_available && _password_available && _codeText.text != '' ? 
                              Theme.of(context).primaryColor : Color(0xffDFDFDF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 0,
                        onPressed: () {
                          print(_phoneText.text);
                          if(_phoneText.text == '' || _codeText.text == '' || _passwordText.text == ''){
                            Fluttertoast.showToast(msg: '请检查输入内容');
                            return;
                          }else if(!_password_available){
                            Fluttertoast.showToast(msg: '密码必须是数字和字母组合，并且不能少于6位');
                            return;
                          }
                          print({'user_login':_phoneText.text, 'user_pass':_passwordText.text, 'code':_codeText.text});
                          api.getData(context, 'userRegister', formData: {'user_login':_phoneText.text, 'user_pass':_passwordText.text, 'code':_codeText.text}).then((val){
                            var res = json.decode(val.toString());

                            Fluttertoast.showToast(msg: res['data']['msg']);

                            Timer(Duration(seconds: 1), (){
                              Navigator.pop(context);
                            });
                            
                          });
                        },
                      ),
                    ),
                    SizedBox(height: ScreenAdapter.setHeight(30)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            '注册即表示同意',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: ScreenAdapter.size(25)),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            child: Text(
                              '《用户服务协议》',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: ScreenAdapter.size(25)),
                            ),
                          ),
                          onTap: () {},
                        ),
                        Container(
                          child: Text(
                            '和',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: ScreenAdapter.size(25)),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            child: Text(
                              '《隐私政策》',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: ScreenAdapter.size(25)),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
