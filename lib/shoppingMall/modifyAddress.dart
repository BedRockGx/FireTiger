import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:city_pickers/city_pickers.dart';

class ModifyAddress extends StatefulWidget {
  @override
  _ModifyAddressState createState() => _ModifyAddressState();
}

class _ModifyAddressState extends State<ModifyAddress> {
  var _city = '省份-城市-区县';
  TextEditingController _detailsAddress;
  TextEditingController _nickName;
  TextEditingController _phoneNumber;

  @override
  void initState() {
    super.initState();
    _detailsAddress = TextEditingController();
    _nickName = TextEditingController();
    _phoneNumber = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _detailsAddress.dispose();
    _nickName.dispose();
    _phoneNumber.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '编辑地址',
            style: TextStyle(
                color: Colors.black87,
                fontSize: ScreenAdapter.size(35),
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xffFAFAFA),
          brightness: Brightness.light,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              IconData(0xe654, fontFamily: 'myIcon'),
              size: ScreenAdapter.size(60),
              color: Color(0xff333333),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
            child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Stack(children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenAdapter.setWidth(40)),
                    child: ListView(
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenAdapter.setHeight(40)),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: ScreenAdapter.setHeight(2),
                                        color: Color(0xffF3F3F3)))),
                            child: Text(
                              '$_city',
                              style: TextStyle(
                                  fontSize: ScreenAdapter.size(25),
                                  color:_city != '省份-城市-区县' ? Colors.black : Color(0xffA4A4A4)),
                            ),
                          ),
                          onTap: () async {
                            Result result = await CityPickers.showCityPicker(
                              context: context,
                            );
                            print(result);
                            if(result!=null){
                              setState(() {
                                _city = '${result.provinceName}-${result.cityName}-${result.areaName}';
                              });
                            }
                          },
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenAdapter.setHeight(20)),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: ScreenAdapter.setHeight(2),
                                        color: Color(0xffF3F3F3)))),
                            child: TextField(
                              controller: _detailsAddress,
                              style: TextStyle(fontSize: ScreenAdapter.size(25)),
                              decoration: InputDecoration(
                                  hintText: '详细地址',
                                  hintStyle: TextStyle(
                                      fontSize: ScreenAdapter.size(25),
                                      color: Color(0xffA4A4A4)),
                                  border: InputBorder.none),
                            )),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenAdapter.setHeight(20)),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: ScreenAdapter.setHeight(2),
                                        color: Color(0xffF3F3F3)))),
                            child: TextField(
                              controller: _detailsAddress,
                              style: TextStyle(fontSize: ScreenAdapter.size(25)),
                              decoration: InputDecoration(
                                  hintText: '收货人姓名',
                                  hintStyle: TextStyle(
                                      fontSize: ScreenAdapter.size(25),
                                      color: Color(0xffA4A4A4)),
                                  border: InputBorder.none),
                            )),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenAdapter.setHeight(20)),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: ScreenAdapter.setHeight(2),
                                        color: Color(0xffF3F3F3)))),
                            child: TextField(
                              controller: _detailsAddress,
                              style: TextStyle(fontSize: ScreenAdapter.size(25)),
                              decoration: InputDecoration(
                                  hintText: '收货人手机号',
                                  hintStyle: TextStyle(
                                      fontSize: ScreenAdapter.size(25),
                                      color: Color(0xffA4A4A4)),
                                  border: InputBorder.none),
                            )),
                      ],
                    ),
                  ),
                  Positioned(
                      width: ScreenAdapter.setWidth(750),
                      bottom: ScreenAdapter.setHeight(60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: ScreenAdapter.setWidth(400),
                            height: ScreenAdapter.setHeight(60),
                            margin: EdgeInsets.only(
                                left: ScreenAdapter.setWidth(15)),
                            child: RaisedButton(
                                child: Text(
                                  '保存',
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.size(25)),
                                ),
                                textColor: Colors.white,
                                highlightColor: Color(0xffDFDFDF),
                                color: Color(0xffDFDFDF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                elevation: 0,
                                onPressed: () {}),
                          )
                        ],
                      ))
                ]))));
  }
}
