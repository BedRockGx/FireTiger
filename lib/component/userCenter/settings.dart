import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firetiger/PluginWidget/GreyDivider.dart';
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/component/userCenter/userCenterPage.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/UserInfoProvider.dart';
import 'package:firetiger/utils/AlertMsg.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:firetiger/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  PickedFile _imageFile;
  var _birthday = '';
  var api = Api();
  var data;
  var _sex = '';
    var uid;
  var token;

  @override
  void initState() {
    super.initState();
    _getHistoryUserInfo();
  }

    _getHistoryUserInfo() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    var tokens = await PublicStorage.getHistoryList('token');
    
    if(tokens.isEmpty && uuid.isEmpty){
      Navigator.pushReplacementNamed(context, '/login');
      return;
    }else{
      setState(() {
        uid = uuid[0];
        token = tokens[0];
      });
    }
    _getBaseInfo();
  }

  _getBaseInfo() async {
    print(uid);
    api.getData(context, 'getLoginUserInfo', formData: {'uid':uid} ).then((val){
      var res = json.decode(val.toString());
      print(res);
      data = res['data']['info'];
      
      if(data['birthday'] == ''){
        _birthday = '请选择';
      }else{
        _birthday = data['birthday'];
      }

      print(data['sex'] == 1);

      if(data['sex'] == '1'){
        _sex = '男';
      }else{
        _sex = '女';
      }
      setState(() {   });
    });
  }

  @override
  Widget build(BuildContext context) {

    var userInfoProvider = Provider.of<UserInfoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('设置', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
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
      body: data == null ? Container() :
      ListView(
        children: <Widget>[
          infoOne(),
          GreyDivider(),
          infoTwo(),
          GreyDivider(),
          infoThree(),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(top:ScreenAdapter.setHeight(150)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: ScreenAdapter.setWidth(400),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
                    decoration: BoxDecoration(
                      border: Border.all(width:ScreenAdapter.setWidth(4), color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(40))
                    ),
                    child: Text('退出登录', style: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),),
                  ),
                ],
              ),
            ),
            onTap: (){
              AlertMsg.alertDialog(context, '确认退出吗？', '退出', '取消', (){
                PublicStorage.removeHistoryData('token');
                PublicStorage.removeHistoryData('uuid');
                PublicStorage.removeHistoryData('rtoken');
                userInfoProvider.setIsLogin(false);
                userInfoProvider.setUserInfo('');
                Navigator.pop(context);
                Navigator.pop(context);
              });
            },
          )
          
        ],
      ),
    );
  }

  Widget infoOne(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30)),
      child: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10), vertical: ScreenAdapter.setHeight(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('头像', style: TextStyle(color: Color(0xff333333), fontSize: ScreenAdapter.size(30)),),
                  ImageRoud('${data['avatar']}', 50)
                ],
              ),
            ),
            onTap: () async {
              var imgFile = await Utils.openGallery();
              if(imgFile == null){
                return;
              }
              print(imgFile.path);
              // FormData formData = new FormData.fromMap({
              //   'file':await MultipartFile.fromFile(imgFile.path),
              // });
              var croppFile = await Utils.cropImage(context, imgFile.path, false);
              print(croppFile is File);
              print(croppFile.path);
              api.postData(context, 'uploadFile', formData: await FormData1(croppFile.path)).then((val){
                print('返回：$val');
                // var res = json.decode(val.toString());
                // print('返回：$res');
              });
            },
          ),
          Divider(),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10), vertical: ScreenAdapter.setHeight(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('昵称', style: TextStyle(color: Color(0xff333333), fontSize: ScreenAdapter.size(30)),),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('${data['user_nicename']}', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
                        SizedBox(width: ScreenAdapter.setWidth(10),),
                        Icon(IconData(0xe655, fontFamily: 'myIcon'), color: Color(0xffCACACA), size: ScreenAdapter.size(30),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/modifyInfo', arguments: {'title':'编辑昵称', 'code':1}).then((_){
                _getBaseInfo();
              });
            },
          ),
          Divider(),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10), vertical: ScreenAdapter.setHeight(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('个性签名', style: TextStyle(color: Color(0xff333333), fontSize: ScreenAdapter.size(30)),),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(430),
                          alignment: Alignment.centerRight,
                          child: Text('${data['signature']}', overflow: TextOverflow.ellipsis, style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
                        ),
                        SizedBox(width: ScreenAdapter.setWidth(10),),
                        Icon(IconData(0xe655, fontFamily: 'myIcon'), color: Color(0xffCACACA), size: ScreenAdapter.size(30),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/modifyInfo', arguments: {'title':'编辑个性签名', 'code':2}).then((_){
                _getBaseInfo();
              });
            },
          )
        ],
      ),
    );
  }

  Widget infoTwo(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30)),
      child: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10), vertical: ScreenAdapter.setHeight(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('性别', style: TextStyle(color: Color(0xff333333), fontSize: ScreenAdapter.size(30)),),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('$_sex', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
                        SizedBox(width: ScreenAdapter.setWidth(10),),
                        Icon(IconData(0xe655, fontFamily: 'myIcon'), color: Color(0xffCACACA), size: ScreenAdapter.size(30),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: showBottomSheet,
          ),
          Divider(),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10), vertical: ScreenAdapter.setHeight(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('生日', style: TextStyle(color: Color(0xff333333), fontSize: ScreenAdapter.size(30)),),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('$_birthday', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
                        SizedBox(width: ScreenAdapter.setWidth(10),),
                        Icon(IconData(0xe655, fontFamily: 'myIcon'), color: Color(0xffCACACA), size: ScreenAdapter.size(30),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
              DatePicker.showDatePicker(
                context,
                locale:DateTimePickerLocale.zh_cn,
                minDateTime:DateTime.parse('1970-01-01'),
                initialDateTime:DateTime.now(),
                maxDateTime: DateTime.now(),
                onConfirm: (val, List<int> index) {
                  if (val == null) {
                    return null;
                  }
                  print(val);
                  setState(() {
                    _birthday = val
                        .toString()
                        .substring(0, 10);
                  });
                  var arguments =  {'uid':uid, 'token':token, 'birthday':_birthday};
                  FormData formData = FormData.fromMap(arguments);
                  api.postData(context, 'updateBirthday', formData:formData).then((val){
                    var res= json.decode(val.toString());
                    print(res);
                    if(res['data']['code'] == 1){
                      Fluttertoast.showToast(msg: res['data']['msg']);
                      // Navigator.pop(context);
                    }
                  });
                },
              );
            },
          ),
          Divider(),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10), vertical: ScreenAdapter.setHeight(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('所在地', style: TextStyle(color: Color(0xff333333), fontSize: ScreenAdapter.size(30)),),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('${data['city'] == '' ? '请输入' : data['city']}', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
                        SizedBox(width: ScreenAdapter.setWidth(10),),
                        Icon(IconData(0xe655, fontFamily: 'myIcon'), color: Color(0xffCACACA), size: ScreenAdapter.size(30),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/modifyInfo', arguments: {'title':'编辑所在地', 'code':3}).then((_){
                _getBaseInfo();
              });
            },
          )
        ],
      ),
    );
  }

  Widget infoThree(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30)),
      child: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10), vertical: ScreenAdapter.setHeight(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('绑定手机号', style: TextStyle(color: Color(0xff333333), fontSize: ScreenAdapter.size(30)),),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('${data['mobile'] == '' ? '尚未绑定' : data['mobile']}', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
                        SizedBox(width: ScreenAdapter.setWidth(10),),
                        Icon(IconData(0xe655, fontFamily: 'myIcon'), color: Color(0xffCACACA), size: ScreenAdapter.size(30),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/modifyInfo', arguments: {'title':'绑定手机号', 'code':4}).then((_){
                _getBaseInfo();
              });
            },
          ),
          Divider(),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10), vertical: ScreenAdapter.setHeight(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('绑定邮箱', style: TextStyle(color: Color(0xff333333), fontSize: ScreenAdapter.size(30)),),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('${data['user_email'] == '' ? '请输入' : data['user_email']}', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
                        SizedBox(width: ScreenAdapter.setWidth(10),),
                        Icon(IconData(0xe655, fontFamily: 'myIcon'), color: Color(0xffCACACA), size: ScreenAdapter.size(30),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/modifyInfo', arguments: {'title':'绑定邮箱', 'code':5}).then((_){
                _getBaseInfo();
              });
            },
          ),
          Divider(),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10), vertical: ScreenAdapter.setHeight(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('密码', style: TextStyle(color: Color(0xff333333), fontSize: ScreenAdapter.size(30)),),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('*********', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
                        SizedBox(width: ScreenAdapter.setWidth(10),),
                        Icon(IconData(0xe655, fontFamily: 'myIcon'), color: Color(0xffCACACA), size: ScreenAdapter.size(30),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
               Navigator.pushNamed(context, '/modifyInfo', arguments: {'title':'密码', 'code':6}).then((_){
                _getBaseInfo();
              });
            },
          )
        ],
      ),
    );
  }

  // 选择性别
  showBottomSheet(){
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 10,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:(BuildContext context, setBottomState) {
            return Container(
                    width: double.infinity,
                    height: ScreenAdapter.setHeight(300),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          child: Center(
                            child: Container(
                              child: Text('女', style: TextStyle(fontSize:ScreenAdapter.size(30), color: this._sex == '女' ? Colors.red : Colors.black),),
                              margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
                            ),
                          ),
                          onTap: (){
                            var arguments =  {'uid':uid, 'token':token, 'sex':2};
                            FormData formData = FormData.fromMap(arguments);
                            api.postData(context, 'updateSex', formData:formData).then((val){
                              var res= json.decode(val.toString());
                              print(res);
                              if(res['data']['code'] == 1){
                                Fluttertoast.showToast(msg: res['data']['msg']);
                                // Navigator.pop(context);
                              }
                            });
                            setState(() {
                              this._sex = '女';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        InkWell(
                          child: Center(
                            child: Container(
                              child: Text('男', style: TextStyle(fontSize:ScreenAdapter.size(30), color:this._sex == '男' ? Colors.red : Colors.black),),
                              margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
                            ),
                          ),
                          onTap: (){
                            var arguments =  {'uid':uid, 'token':token, 'sex':1};
                            FormData formData = FormData.fromMap(arguments);
                            api.postData(context, 'updateSex', formData:formData).then((val){
                              var res= json.decode(val.toString());
                              print(res);
                              if(res['data']['code'] == 1){
                                Fluttertoast.showToast(msg: res['data']['msg']);
                                // Navigator.pop(context);
                              }
                            });
                            setState(() {
                              this._sex = '男';
                            });
                            Navigator.pop(context);
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
          }
        );
        
      });
  }

  Future<FormData> FormData1(fileUrl) async {
    return FormData.fromMap({
      "file": await MultipartFile.fromFile(fileUrl, filename:'UserImg'),
    });
  }

  // 选择日期
}