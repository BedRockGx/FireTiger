import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:firetiger/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ModifyUserInfo extends StatefulWidget {
  var appBartitle;
  ModifyUserInfo(this.appBartitle);

  @override
  _ModifyUserInfoState createState() => _ModifyUserInfoState();
}

class _ModifyUserInfoState extends State<ModifyUserInfo> {

  TextEditingController _nameText;                                // 用户名
  TextEditingController _autographText;                           // 签名
  TextEditingController _addressText;                             // 地址
  TextEditingController _phoneText;                               // 手机号
  TextEditingController _codeText;                                // 验证码
  TextEditingController _emailText;                               // 邮箱
  TextEditingController _passwordText;                            // 密码
  var errorText = '';
  bool _isClickBtn = false;

  bool _verification_available = false;
  Timer _timer;
  int _countdownTime = 60;

  var uid;
  var token;

  var api = Api();

  @override
  void initState() {
    super.initState();
    _nameText = TextEditingController();
    _autographText = TextEditingController();
    _addressText = TextEditingController();
    _phoneText = TextEditingController();
    _codeText = TextEditingController();
    _emailText = TextEditingController();
    _passwordText = TextEditingController();
    _getHistoryUserInfo();
  }

  _getHistoryUserInfo() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    var tokens = await PublicStorage.getHistoryList('token');
    setState(() {
      uid = uuid[0];
      token = tokens[0];
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameText.dispose();
    _autographText.dispose();
    _addressText.dispose();
    _phoneText.dispose();
    _codeText.dispose();
    _emailText.dispose();
    _passwordText.dispose();
    _isClickBtn = false;

    _verification_available = false;
    if(_countdownTime != 60){
      _timer.cancel();
      _countdownTime = 60;
    }
  }

  getVerification(){
    if(_countdownTime == 60){
      return Text(
                '获取验证码',
                style: TextStyle(
                    fontSize: ScreenAdapter.size(30),
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
        centerTitle: true,
        title: Text('${widget.appBartitle['title']}', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
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
        padding: EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            panShowWidget()
          ],
        ),
      )
    );
  }

  panShowWidget(){
    switch (widget.appBartitle['code']) {
      case 1:
        return modifyNickName();
        break;
      case 2:
        return modifyAutograph();
        break;
      case 3:
        return modifyAddress();
        break;
      case 4:
        return modifyPhone();
        break;
      case 5:
        return modifyEmail();
        break;
      case 6:
        return modifyPassword();
        break;
      default:
    }
  }

  // 修改昵称
  Widget modifyNickName(){
    return Column(
      children: <Widget>[
            Container(
              child: TextField(
                controller: _nameText,
                style: TextStyle(fontSize: ScreenAdapter.size(30)),
                decoration: InputDecoration(
                  hintText: '请输入新的用户名',
                  hintStyle: TextStyle(fontSize: ScreenAdapter.size(30)),
                  border: InputBorder.none
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: ScreenAdapter.setWidth(1),
                    color: Color(0xffE4E4E4)
                  )
                )
              ),
            ),
            SizedBox(
              height: ScreenAdapter.setHeight(20),
            ),
            Container(
              width: ScreenAdapter.setWidth(400),
              child: RaisedButton(
                child: Text('确认修改', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                color: Theme.of(context).primaryColor,
                highlightColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 0,
                onPressed: () {
                  var arguments =  {'uid':uid, 'token':token, 'nickname':_nameText.text};
                  FormData formData = FormData.fromMap(arguments);
                  api.postData(context, 'updateNickname', formData:formData).then((val){
                    var res= json.decode(val.toString());
                    if(res['data']['code'] == 1){
                      Navigator.pop(context);
                    }
                    Fluttertoast.showToast(msg: res['data']['msg']);
                  });
                },
              ),
            )
      ],
    );
  }

  // 修改签名
  Widget modifyAutograph(){
    return  Column(
      children: <Widget>[
            Container(
              child: TextField(
                controller: _autographText,
                style: TextStyle(fontSize: ScreenAdapter.size(30)),
                decoration: InputDecoration(
                  hintText: '请输入新的签名',
                  hintStyle: TextStyle(fontSize: ScreenAdapter.size(30)),
                  border: InputBorder.none
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: ScreenAdapter.setWidth(1),
                    color: Color(0xffE4E4E4)
                  )
                )
              ),
            ),
            SizedBox(
              height: ScreenAdapter.setHeight(20),
            ),
            Container(
              width: ScreenAdapter.setWidth(400),
              child: RaisedButton(
                child: Text('确认修改', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                color: Theme.of(context).primaryColor,
                highlightColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 0,
                onPressed: (){
                  var arguments =  {'uid':uid, 'token':token, 'signature':_autographText.text};
                  FormData formData = FormData.fromMap(arguments);
                  api.postData(context, 'updateSignature', formData:formData).then((val){
                    var res= json.decode(val.toString());
                    if(res['data']['code'] == 1){
                      Navigator.pop(context);
                    }
                    Fluttertoast.showToast(msg: res['data']['msg']);
                  });
                },
              ),
            )
      ],
    );
  }

  // 修改所在地
  Widget modifyAddress(){
    return Column(
      children: <Widget>[
            Container(
              child: TextField(
                controller: _addressText,
                style: TextStyle(fontSize: ScreenAdapter.size(30)),
                decoration: InputDecoration(
                  hintText: '请输入新的地址',
                  hintStyle: TextStyle(fontSize: ScreenAdapter.size(30)),
                  border: InputBorder.none
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: ScreenAdapter.setWidth(1),
                    color: Color(0xffE4E4E4)
                  )
                )
              ),
            ),
            SizedBox(
              height: ScreenAdapter.setHeight(20),
            ),
            Container(
              width: ScreenAdapter.setWidth(400),
              child: RaisedButton(
                child: Text('确认修改', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                color: Theme.of(context).primaryColor,
                highlightColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 0,
                onPressed: (){
                  var arguments =  {'uid':uid, 'token':token, 'city':_addressText.text};
                  FormData formData = FormData.fromMap(arguments);
                  api.postData(context, 'updateCity', formData:formData).then((val){
                    var res= json.decode(val.toString());
                    if(res['data']['code'] == 1){
                      Navigator.pop(context);
                    }
                    Fluttertoast.showToast(msg: res['data']['msg']);
                  });
                },
              ),
            )
      ],
    );
  }

  // 修改手机号
  Widget modifyPhone(){
    return Column(
      children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: ScreenAdapter.setWidth(1),
                    color: Color(0xffE4E4E4)
                  )
                )
              ),
              margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(30)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: TextField(
                        controller: _phoneText,
                        style: TextStyle(fontSize: ScreenAdapter.size(30)),
                        decoration: InputDecoration(
                          hintText: '请输入手机号',
                          hintStyle: TextStyle(fontSize: ScreenAdapter.size(30)),
                          border: InputBorder.none
                        ),
                        keyboardType:TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
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
                  InkWell(
                    child: Container(
                      child: getVerification(),
                    ),
                    onTap: (){
                      if(_verification_available){
                        if(_countdownTime == 60){
                          api.getData(context, 'getBindMobileCode', formData:{'uid':uid, 'token':token, 'mobile':_phoneText.text}).then((val){
                            var res= json.decode(val.toString());
                            Fluttertoast.showToast(msg: res['data']['msg']);
                          });
                        }else{
                          Fluttertoast.showToast(msg: '请稍后获取验证码~');
                          return;
                        }
                      }else{
                        Fluttertoast.showToast(msg: '请输入正确的手机号');
                        return;
                      }

                      if(_countdownTime == 60){
                        startCountdownTimer();
                      }
                    },
                  )
                ],
              ),
            ),
            Container(
              child: TextField(
                controller: _codeText,
                style: TextStyle(fontSize: ScreenAdapter.size(30)),
                enabled: _verification_available ? true : false,
                decoration: InputDecoration(
                  hintText: '请输入验证码',
                  hintStyle: TextStyle(fontSize: ScreenAdapter.size(30)),
                  border: InputBorder.none
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: ScreenAdapter.setWidth(1),
                    color: Color(0xffE4E4E4)
                  )
                )
              ),
            ),
            SizedBox(
              height: ScreenAdapter.setHeight(20),
            ),
            Container(
              width: ScreenAdapter.setWidth(400),
              child: RaisedButton(
                child: Text('确认绑定', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                color: Theme.of(context).primaryColor,
                highlightColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 0,
                onPressed: (){
                  var arguments =  {'uid':uid, 'token':token, 'mobile':_phoneText.text, 'code':_codeText.text};
                  print(arguments);
                  FormData formData = FormData.fromMap(arguments);
                  api.postData(context, 'updateMobile', formData:formData).then((val){
                    var res= json.decode(val.toString());
                    if(res['data']['code'] == 1){
                      
                      Navigator.pop(context);
                    }
                    Fluttertoast.showToast(msg: res['data']['msg']);
                  });
                },
              ),
            )
      ],
    );
  }

  // 修改邮箱
  Widget modifyEmail(){
    return Column(
      children: <Widget>[
            Container(
              child: TextField(
                controller: _emailText,
                style: TextStyle(fontSize: ScreenAdapter.size(30)),
                decoration: InputDecoration(
                  hintText: '请输入新的邮箱地址',
                  hintStyle: TextStyle(fontSize: ScreenAdapter.size(30)),
                  border: InputBorder.none
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: ScreenAdapter.setWidth(1),
                    color: Color(0xffE4E4E4)
                  )
                )
              ),
            ),
            SizedBox(
              height: ScreenAdapter.setHeight(20),
            ),
            Container(
              width: ScreenAdapter.setWidth(400),
              child: RaisedButton(
                child: Text('确认修改', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                color: Theme.of(context).primaryColor,
                highlightColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 0,
                onPressed: (){
                  var arguments =  {'uid':uid, 'token':token, 'email':_emailText.text};
                  FormData formData = FormData.fromMap(arguments);
                  api.postData(context, 'updateEmail', formData:formData).then((val){
                    var res= json.decode(val.toString());
                    print(res);
                    if(res['data']['code'] == 1){
                      Fluttertoast.showToast(msg: res['data']['msg']);
                      Navigator.pop(context);
                    }
                  });
                },
              ),
            )
      ],
    );
  }

  // 修改密码
   // 修改手机号
  Widget modifyPassword(){

    

    return Column(
      children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: ScreenAdapter.setWidth(1),
                    color: Color(0xffE4E4E4)
                  )
                )
              ),
              margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(30)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: TextField(
                        controller: _phoneText,
                        style: TextStyle(fontSize: ScreenAdapter.size(30)),
                        decoration: InputDecoration(
                          hintText: '请输入手机号',
                          hintStyle: TextStyle(fontSize: ScreenAdapter.size(30)),
                          border: InputBorder.none
                        ),
                        keyboardType:TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
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
                  InkWell(
                    child: Container(
                      child: getVerification(),
                    ),
                    onTap: (){
                      if(_verification_available){
                        if(_countdownTime == 60){
                          api.getData(context, 'getForgetCode', formData:{ 'mobile':_phoneText.text}).then((val){
                            var res= json.decode(val.toString());
                            print(res);
                            if(res['data']['code'] == 1){
                              Fluttertoast.showToast(msg: res['data']['msg']);
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

                      if(_countdownTime == 60){
                        startCountdownTimer();
                      }
                    },
                  )
                ],
              ),
            ),
            Container(
              child: TextField(
                controller: _codeText,
                style: TextStyle(fontSize: ScreenAdapter.size(30)),
                enabled: _verification_available ? true : false,
                decoration: InputDecoration(
                  hintText: '请输入验证码',
                  hintStyle: TextStyle(fontSize: ScreenAdapter.size(30)),
                  border: InputBorder.none
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: ScreenAdapter.setWidth(1),
                    color: Color(0xffE4E4E4)
                  )
                )
              ),
            ),
            SizedBox(
              height: ScreenAdapter.setHeight(20),
            ),
            Container(
              child: TextField(
                controller: _passwordText,
                style: TextStyle(fontSize: ScreenAdapter.size(30)),
                enabled: _verification_available ? true : false,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '请输入新密码',
                  hintStyle: TextStyle(fontSize: ScreenAdapter.size(30)),
                  border: InputBorder.none
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: ScreenAdapter.setWidth(1),
                    color: Color(0xffE4E4E4)
                  )
                )
              ),
            ),
            SizedBox(
              height: ScreenAdapter.setHeight(20),
            ),
            Container(
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(fontSize: ScreenAdapter.size(30)),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '再次请输入新密码',
                  hintStyle: TextStyle(fontSize: ScreenAdapter.size(30)),
                  border: InputBorder.none,
                  errorText: errorText
                ),
                onChanged: (v){
                  print(v);
                  if(v != _passwordText.text){
                    errorText = '两次密码不一致!';
                    _isClickBtn = false;
                  }else{
                    errorText = '';
                    _isClickBtn = true;
                  }
                  setState(() {
                      
                  });
                },
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: ScreenAdapter.setWidth(1),
                    color: Color(0xffE4E4E4)
                  )
                )
              ),
            ),
            SizedBox(
              height: ScreenAdapter.setHeight(20),
            ),
            Container(
              width: ScreenAdapter.setWidth(400),
              child: RaisedButton(
                child: Text('确认绑定', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                color:  Theme.of(context).primaryColor,
                highlightColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 0,
                onPressed: (){
                  var arguments =  {'password':_passwordText.text, 'mobile':_phoneText.text, 'code':_codeText.text};
                  print(arguments);
                  FormData formData = FormData.fromMap(arguments);
                  api.postData(context, 'userForget', formData:formData).then((val){
                    var res= json.decode(val.toString());
                    print(res);
                    if(res['data']['code'] == 1){
                      
                      Navigator.pop(context);
                    }
                    Fluttertoast.showToast(msg: res['data']['msg']);
                  });
                },
              ),
            )
      ],
    );
  }
}