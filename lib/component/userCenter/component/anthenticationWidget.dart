import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:firetiger/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AnthenTicationWidget extends StatefulWidget {
  var arguments;
  AnthenTicationWidget(this.arguments);
  @override
  _AnthenTicationWidgetState createState() => _AnthenTicationWidgetState();
}

class _AnthenTicationWidgetState extends State<AnthenTicationWidget> {

  TextEditingController _nickName;
  TextEditingController _idCard;
  TextEditingController _phone;
  TextEditingController _code;

  Timer _timer;
  int _countdownTime = 60;
  bool _verification_available = false;
  var photo1 = '';
  var photo2 = '';
  var photo3 = '';

  var api = Api();
  var uid, token;


  @override
  void initState() {
     super.initState();
     print(widget.arguments['type']);
    _nickName = TextEditingController();
    _idCard = TextEditingController();
    _phone = TextEditingController();
    _code = TextEditingController();

    _getHistoryUserInfo();
  }

  _getHistoryUserInfo() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    var tokens = await PublicStorage.getHistoryList('token');
    if(uuid.isNotEmpty && tokens.isNotEmpty){
      setState(() {
        uid = uuid[0];
        token = tokens[0];
      });
      _getUserAuth();
    }
  }

  _getUserAuth(){
    api.postData(context, 'setUserAuth', formData: {'uid':uid, 'token':token, 'real_name':_nickName.text, 'mobile':_phone.text, 'cer_no':_idCard.text, }).then((val){

    });
  }

  @override
  void dispose() {
    super.dispose();
    _nickName.dispose();
    _idCard.dispose();
    _phone.dispose();
    _code.dispose();

    if(_countdownTime != 60){
      _timer.cancel();
      _countdownTime = 60;
    }
    _verification_available = false;
  }

  getVerification(){
    if(_countdownTime == 60){
      return Text(
                '获取验证码',
                style: TextStyle(
                    fontSize: ScreenAdapter.size(28),
                    color: Color(0xffDFDFDF)),
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
          title: Text('主播认证', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
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
        shrinkWrap:true,                //内容适配
        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
        children: <Widget>[
          myTextField(_nickName, '*姓名', '请输入身份证上的姓名', false),
          myTextField(_idCard, '*身份证', '请输入身份证号', false),
          myTextField(_phone, '*手机号', '请输入手机号', true, isPhone: true),
          myTextField(_code, '*验证码', '请输入验证码', true),
          Container(
            margin: EdgeInsets.only(top:ScreenAdapter.setHeight(10), bottom:ScreenAdapter.setHeight(50)),
            child: Text('请您如实准确填写本人信息，否则将认证失败', textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: ScreenAdapter.size(20)),),
          ),
          Container(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: ScreenAdapter.setWidth(30),
              mainAxisSpacing: ScreenAdapter.setHeight(30),
              shrinkWrap: true,                       //内容适配
              physics: NeverScrollableScrollPhysics(),
              children: [
                InkWell(
                  child: photo1 == '' ? Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width:1, color:Color(0xffE1E1E1))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(IconData(0xe68b, fontFamily: 'myIcon'), size: ScreenAdapter.size(50), color: Color(0xffA4A4A4),),
                        SizedBox(
                          height: ScreenAdapter.setHeight(20),
                        ),
                        Text('请上传', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Color(0xffA4A4A4)),),
                        Text('身份证正面', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Color(0xffA4A4A4)),)
                      ],
                    ),
                  )
                  : Container(
                    child: Image.file(File(photo1)),
                    ),
                  onTap: (){
                    showBottomSheet(1);
                  }
                ),
                InkWell(
                  child:photo2 == '' ? Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width:1, color:Color(0xffE1E1E1))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(IconData(0xe68b, fontFamily: 'myIcon'), size: ScreenAdapter.size(50), color: Color(0xffA4A4A4),),
                        SizedBox(
                          height: ScreenAdapter.setHeight(20),
                        ),
                        Text('请上传', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Color(0xffA4A4A4)),),
                        Text('身份证反面', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Color(0xffA4A4A4)),),
                      ],
                    ),
                  ) : Container(
                    child: Image.file(File(photo2)),
                    ),
                  onTap:(){
                    showBottomSheet(2);
                  }
                ),
                InkWell(
                  child: photo3 == '' ? Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width:1, color:Color(0xffE1E1E1))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(IconData(0xe68b, fontFamily: 'myIcon'), size: ScreenAdapter.size(50), color: Color(0xffA4A4A4),),
                        SizedBox(
                          height: ScreenAdapter.setHeight(20),
                        ),
                        Text('请上传', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Color(0xffA4A4A4)),),
                        Text('手持身份证的照片', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Color(0xffA4A4A4)),)
                      ],
                    ),
                  ) : Container(
                    child: Image.file(File(photo3)),
                    ),
                  onTap: (){
                    showBottomSheet(3);
                  }
                )
              ]
            )
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(50)),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text('认证代表你已阅读并同意', style: TextStyle(fontSize: ScreenAdapter.size(20)),),
                      ),
                      Container(
                        child: Text('《火虎认证须知》', style: TextStyle(color: Colors.red, fontSize: ScreenAdapter.size(20)),),
                      ),
                      Container(
                        child: Text('和', style: TextStyle( fontSize: ScreenAdapter.size(20)),),
                      ),
                      Container(
                        child: Text('《火虎直播协议》', style: TextStyle(color: Colors.red, fontSize: ScreenAdapter.size(20)),),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: ScreenAdapter.setWidth(400),
                  height: ScreenAdapter.setHeight(60),
                  margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setWidth(30)),
                  child: RaisedButton(
                    child: Text('立即认证', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                    textColor: Colors.white,
                    highlightColor:Color(0xffDFDFDF),
                    color:Color(0xffDFDFDF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                    onPressed:(){

                    }
                  ),
                ),
                Container(
                  child: Text('如有疑问，请联系客服', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),),
                )
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget myTextField(controller, title, hintText,isNumber, {isPhone = false}){
    return Container(
            padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: ScreenAdapter.setWidth(2), color: Color(0xffF3F3F3))
              )
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right:ScreenAdapter.setWidth(40)),
                  width: ScreenAdapter.setWidth(100),
                  child: Text('$title'),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: controller,
                    style: TextStyle(fontSize: ScreenAdapter.size(30)),
                    keyboardType:isNumber ? TextInputType.phone : TextInputType.text,
                    inputFormatters: isNumber ? [
                       WhitelistingTextInputFormatter.digitsOnly
                    ] : [],
                    decoration: InputDecoration(
                      hintText: '$hintText',
                      hintStyle: TextStyle(fontSize: ScreenAdapter.size(30), color: Color(0xffA4A4A4)),
                      border: InputBorder.none
                    ),
                    onChanged: (val){
                      if (isPhone && Utils.isChinaPhoneLegal(val)) {
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
                isPhone ? Container(
                  padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10), horizontal:ScreenAdapter.setWidth(20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width:ScreenAdapter.setWidth(2), color:Color(0xffDFDFDF))
                  ),
                              child: InkWell(
                                child: getVerification(),
                                onTap: (){
                                  if(_verification_available){
                                    if(_countdownTime == 60){
                                      api.getData(context, 'getLoginCode', formData: {'mobile':_phone}).then((val){
                                        var response = json.decode(val.toString());
                                        print(response);
                                        if(response['data']['code'] == 1007){
                                          // Fluttertoast.showToast(msg: '验证码发送成功！请注意查收~');
                                        }else{

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
                            ):Container()
              ],
            ),
          );
  }

  // 拍照方式
  showBottomSheet(params){
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: ScreenAdapter.setHeight(300),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Center(
                  child: Container(
                    child: Text('拍照', style: TextStyle(fontSize:ScreenAdapter.size(30), color: Colors.red),),
                    margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  var photoUrl =await Utils.takePhoto();
                  switch (params) {
                    case 1:
                      photo1 = photoUrl.path;
                      break;
                    case 2:
                      photo2 = photoUrl.path;
                      break;
                    case 3:
                      photo3 = photoUrl.path;
                      break;
                    default:
                  }
                  setState(() {});
                },
              ),
              InkWell(
                child: Center(
                  child: Container(
                    child: Text('相册', style: TextStyle(fontSize:ScreenAdapter.size(30)),),
                    margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  var photoUrl = await Utils.openGallery();
                  switch (params) {
                    case 1:
                      photo1 = photoUrl.path;
                      break;
                    case 2:
                      photo2 = photoUrl.path;
                      break;
                    case 3:
                      photo3 = photoUrl.path;
                      break;
                    default:
                  }
                  setState(() {});
                },
              ),
              InkWell(
                child: Center(
                  child: Container(
                    child: Text('取消', style: TextStyle(fontSize:ScreenAdapter.size(30)),),
                    margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
                  ),
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ],
          )
        );
      });
  }
}