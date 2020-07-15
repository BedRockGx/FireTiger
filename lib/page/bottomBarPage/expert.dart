import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/component/expert/expert.dart';
import 'package:firetiger/provider/UserInfoProvider.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Expert extends StatefulWidget {
  @override
  _ExpertState createState() => _ExpertState();
}

class _ExpertState extends State<Expert> {

  var _userInfo;

  @override
  Widget build(BuildContext context) {
    var userInfoProvider = Provider.of<UserInfoProvider>(context);
    setState(() {
      _userInfo = userInfoProvider.userInfo;
    });
    return Scaffold(
      appBar: AppBar(
        // ImageRoud('https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3374416169,262924133&fm=111&gp=0.jpg',50),
        backgroundColor: Color(0xffFAFAFA),
        brightness: Brightness.light,
        title: Row(
          children: <Widget>[
            Container(
              child: IconButton(
                  icon: _userInfo.isEmpty ? 
                  Icon(IconData(0xe684, fontFamily: 'myIcon'), color: Color(0xffA4A4A4),)
                  :
                  Container(
                    child:ImageRoud('${_userInfo['avatar']}', 100)
                  ),
                onPressed: (){
                  Navigator.pushNamed(context, '/userCenter');
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text('专家', style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold, color: Color(0xff333333)),)
              ),
            ),
            Container(
              width: ScreenAdapter.setWidth(60),
              child: IconButton(
                  icon:Icon(IconData(0xe652, fontFamily: 'myIcon'), color: Color(0xffE5E5E5),),
                  onPressed: (){
                    Navigator.pushNamed(context, '/search');
                  },
              ),
            ),
          ],
        ),
        
        elevation: 0,
      ),
      body: Container(
        child: ExpertWidget(),
      )
    );
  }
}