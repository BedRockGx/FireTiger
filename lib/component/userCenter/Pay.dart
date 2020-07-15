

import 'dart:convert';

import 'package:firetiger/PluginWidget/GreyDivider.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PayPage extends StatefulWidget {
  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {

  var selectNum = 1;
  var selectType = '微信支付';
  bool isShowInput = false;

  List payNum = [1, 10, 50, 100, 500, 1000, 5000, 10000, 0];
  List<Map> payType = [{'title':'微信支付', 'icon':0xe66b, 'color':0Xff09BB07}, {'title':'支付宝支付', 'icon':0xe66c, 'color':0Xff06B4FD}];

  TextEditingController _numText = TextEditingController();
  var api = Api();
  var uid, token;

  @override
  void initState() {
    super.initState();
    _numText.text = '0';
    _getHistoryData();
  }

  _getHistoryData() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    var tokens = await PublicStorage.getHistoryList('token');
    if(uuid.isEmpty && tokens.isEmpty){
      Navigator.pushReplacementNamed(context, '/login');
      return;
    }else{
      setState(() {
        uid = uuid[0];
        token = tokens[0];
      });
      _getRecharge();
    }
  }

  _getRecharge()  {
    // api.getData(context, 'getRecharge', formData: {'uid':uuid[0], 'token':token[0]}).then((val){
    //   var res = json.decode(val.toString());

    //   print(res);
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _numText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('支付', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
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
            padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
            child: Row(
              children: <Widget>[
                // Icon(IconData(0xe66a, fontFamily: 'myIcon'), color: Color(0xffFFEAEC),),
                Container(
                  width: ScreenAdapter.setWidth(40),
                  child: Image.asset('assets/images/huohuan.png', fit: BoxFit.cover,),
                ),
                SizedBox(width: ScreenAdapter.setWidth(10),),
                Text('火花余额', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                SizedBox(width: ScreenAdapter.setWidth(20),),
                Text('1200', style: TextStyle(fontSize: ScreenAdapter.size(40), fontWeight: FontWeight.bold, color: Color(0xffFF3641)),)
              ],
            ),
          ),
          GreyDivider(),
          Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
            child:Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20), left: ScreenAdapter.setWidth(10)),
                  alignment: Alignment.centerLeft,
                  child: Text('充值数量', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                ),
                Wrap(
                  spacing: ScreenAdapter.setWidth(30),
                  runSpacing: ScreenAdapter.setHeight(20),
                  children: payNum.map((v){
                    return InkWell(
                      child: Container(
                        width: ScreenAdapter.setWidth(200),
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30), vertical:ScreenAdapter.setHeight(15)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(width:ScreenAdapter.setWidth(2), color: selectNum == v ? Color(0xffFF3641) : Color(0xffE7E7E7)),
                          color: Color(0xffF9F9F9)
                        ),
                        child: Text(v == 0 ? '其他数量' : '$v火花', textAlign: TextAlign.center,),
                      ),
                      onTap: (){
                        setState(() {
                          if(v != 0){
                            _numText.text = '0';
                          }
                          if(v == 0){
                            selectNum = int.parse(_numText.text);
                            isShowInput = true;
                          }else{
                            isShowInput = false;
                            selectNum = v;
                          }
                        });
                      },
                    );
                  }).toList()
                ),
              ],
            )
          ),
          Visibility(
            visible: isShowInput ? true : false,
            child: Container(
              padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20), horizontal: ScreenAdapter.setWidth(40)),
              child: TextField(
                controller: _numText,
                style: TextStyle(fontSize: ScreenAdapter.size(30)),
                keyboardType:TextInputType.phone,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  hintText: '请输入数量',
                  hintStyle: TextStyle(fontSize: ScreenAdapter.size(30)),
                ),
                onChanged: (v){
                  print(v);
                  setState(() {
                    selectNum = int.parse(v);
                  });
                },
              ),
            )
          ),
          GreyDivider(),
          Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20), left: ScreenAdapter.setWidth(10)),
                  alignment: Alignment.centerLeft,
                  child: Text('支付方式', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                ),
                Wrap(
                  spacing: ScreenAdapter.setWidth(30),
                  runSpacing: ScreenAdapter.setHeight(20),
                  children: payType.map((v){
                    return InkWell(
                      child: Container(
                        width: ScreenAdapter.setWidth(180),
                        height: ScreenAdapter.setHeight(130),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width:ScreenAdapter.setWidth(2), color: selectType == v['title'] ? Color(0xffFF3641) : Color(0xffE7E7E7)),
                          color: Color(0xffF9F9F9)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(IconData(v['icon'], fontFamily: 'myIcon'),size: ScreenAdapter.size(60), color: Color(v['color']),),
                            SizedBox(height: ScreenAdapter.setHeight(15),),
                            Text(v['title'], style: TextStyle(fontSize: ScreenAdapter.size(25)),)
                          ],
                        ),
                      ),
                      onTap: (){
                        setState(() {
                          selectType = v['title'];
                        });
                      },
                    );
                  }).toList()
                ),
              ],
            )
          ),
          Container(
            margin: EdgeInsets.only(top:ScreenAdapter.setHeight(200), bottom: ScreenAdapter.setHeight(50)),
            child: Column(
              children: <Widget>[
                Container(
                  height: ScreenAdapter.setHeight(60),
                  margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
                  padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30)),
                  child: RaisedButton(
                    child: Text('立即支付$selectNum元', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                    textColor: Colors.white,
                    highlightColor:Theme.of(context).primaryColor,
                    color:Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                    onPressed: (){

                    }
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('支付即表示同意', style: TextStyle(color: Color(0xffA1A1A1), fontSize: ScreenAdapter.size(25))),
                    InkWell(
                      child: Text(' 充值服务协议', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: ScreenAdapter.size(25))),
                    )
                  ],
                ),
                Container(
                  child: Text('充值成功后，到账可能会有延时，请耐心等待', style: TextStyle(color: Color(0xffA1A1A1), fontSize: ScreenAdapter.size(25)),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}