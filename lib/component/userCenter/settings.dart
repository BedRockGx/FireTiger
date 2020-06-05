import 'package:firetiger/PluginWidget/GreyDivider.dart';
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/component/userCenter/userCenterPage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:firetiger/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:image_picker/image_picker.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  PickedFile _imageFile;
  var _birthday = '请选择';

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
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
                  ImageRoud('https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3140403455,2984550794&fm=26&gp=0.jpg', 50)
                ],
              ),
            ),
            onTap: () async {
              var imgFile = await Utils.openGallery();
              print(imgFile.path);
              setState(() {
                
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
                        Text('Uzi', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
                        SizedBox(width: ScreenAdapter.setWidth(10),),
                        Icon(IconData(0xe655, fontFamily: 'myIcon'), color: Color(0xffCACACA), size: ScreenAdapter.size(30),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/modifyInfo', arguments: {'title':'编辑昵称', 'code':1});
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
                          child: Text('快乐的菜鸡up主快乐的菜鸡up主阿达凉快圣诞节快乐就', overflow: TextOverflow.ellipsis, style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
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
              Navigator.pushNamed(context, '/modifyInfo', arguments: {'title':'编辑个性签名', 'code':2});
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
                        Text('女', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
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
                        Text('南极', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
                        SizedBox(width: ScreenAdapter.setWidth(10),),
                        Icon(IconData(0xe655, fontFamily: 'myIcon'), color: Color(0xffCACACA), size: ScreenAdapter.size(30),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/modifyInfo', arguments: {'title':'编辑所在地', 'code':3});
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
                        Text('尚未绑定', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
                        SizedBox(width: ScreenAdapter.setWidth(10),),
                        Icon(IconData(0xe655, fontFamily: 'myIcon'), color: Color(0xffCACACA), size: ScreenAdapter.size(30),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/modifyInfo', arguments: {'title':'绑定手机号', 'code':4});
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
                        Text('abc@def.com', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
                        SizedBox(width: ScreenAdapter.setWidth(10),),
                        Icon(IconData(0xe655, fontFamily: 'myIcon'), color: Color(0xffCACACA), size: ScreenAdapter.size(30),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/modifyInfo', arguments: {'title':'绑定邮箱', 'code':5});
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
                        Text('南极', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
                        SizedBox(width: ScreenAdapter.setWidth(10),),
                        Icon(IconData(0xe655, fontFamily: 'myIcon'), color: Color(0xffCACACA), size: ScreenAdapter.size(30),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
               Navigator.pushNamed(context, '/modifyInfo', arguments: {'title':'密码', 'code':6});
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
        return Container(
          width: double.infinity,
          height: ScreenAdapter.setHeight(300),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Center(
                  child: Container(
                    child: Text('女', style: TextStyle(fontSize:ScreenAdapter.size(30), color: Colors.red),),
                    margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
                  ),
                ),
                onTap: (){

                },
              ),
              InkWell(
                child: Center(
                  child: Container(
                    child: Text('男', style: TextStyle(fontSize:ScreenAdapter.size(30)),),
                    margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
                  ),
                ),
                onTap: (){

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

  // 选择日期
}