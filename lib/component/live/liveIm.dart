import 'dart:async';

import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:firetiger/utils/Utils.dart';
import 'package:flutter/material.dart';

class LiveIM extends StatefulWidget {
  @override
  _LiveIMState createState() => _LiveIMState();
}

class _LiveIMState extends State<LiveIM> with SingleTickerProviderStateMixin {

  TextEditingController _comment;
  ScrollController _listController;                   // 聊天列表控制器啊
  ScrollController _lwController;                     // 礼物列表控制器

  List<Map> _list = [];
  List<Map> _lwList = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();       // 聊天列表key
  final GlobalKey<AnimatedListState> _lwKey = GlobalKey<AnimatedListState>();         // 礼物key


  @override
  void initState() {
    super.initState();
    _comment = TextEditingController();
    _listController = ScrollController();         
    _lwController = ScrollController();
  }

  void _addItem() {
    final int _index = _list.length;

    Timer(Duration(milliseconds: 500), () => _listController.jumpTo(_listController.position.maxScrollExtent));      // 页面永远保持在最底部

    _list.insert(_index, {'dj':5, 'nickName':'大眼萌', 'msg':'贵了，还有经济网一年合同的大龄速度型，我就说不是这样的吧，不信，安徽师大'});
    _listKey.currentState.insertItem(_index);
  }

  void _addLwItem() {
    final int _index = _lwList.length;
    Timer(Duration(milliseconds: 500), () => _lwController.jumpTo(_lwController.position.maxScrollExtent));      // 页面永远保持在最底部
    _lwList.insert(_index, {'img':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3256100974,305075936&fm=26&gp=0.jpg', 'nickName':'磐石BedRock', 'num':2});
    _lwKey.currentState.insertItem(_index);
    Timer(Duration(milliseconds: 2500), () => _removeLwItem());
  }

  
  void _removeLwItem() {
    final int _index = _lwList.length - 1;
    var item = _lwList[_index];
    print(_index);
    print(item);
    _lwKey.currentState.removeItem(
        0, (context, animation) => _buildLwItem(item, _index, animation));
    _lwList.removeAt(_index);
  }


  @override
  void dispose() {
    super.dispose();
    _comment.dispose();
    _listController.dispose();
    _lwController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    double rpx = MediaQuery.of(context).size.width / 750;

    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(30 * rpx),
          margin: EdgeInsets.only(bottom:150 * rpx),
          child: AnimatedList(
            controller: _listController,
            key: _listKey,
            itemBuilder: (BuildContext context, int index, Animation animation){
              return _buildItem(_list[index], animation);
            },
            initialItemCount: _list.length,
          )
        ),
        Positioned(
          bottom: 400 * rpx,
          width: 750 * rpx,
          child: Container(
            padding: EdgeInsets.all(30 * rpx),
            width: 750 * rpx,
            height: 500 * rpx,
            // color: Colors.pink,
            child: AnimatedList(
              controller: _lwController,
              key: _lwKey,
              itemBuilder: (BuildContext context, int index, Animation animation){
                return _buildLwItem(_lwList[index], index, animation);
              },
              initialItemCount: _lwList.length,
            )
            
          ),
        ),
        Positioned(
          bottom: 200 * rpx,
          width: 150 * rpx,
          right: 20 * rpx,
          child: InkWell(
            child: Container(
              width: 150 * rpx,
              height: 100*rpx,
              child: Image.asset('assets/images/pennant.png', fit: BoxFit.contain,),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/webView', arguments: {'url':'https://www.baidu.com', 'title':'标题'});
            },
          )
        ),
        Positioned(
            bottom: 0,
            width: 750 * rpx,
            child: Container(
              width: 750 * rpx,
              height: 150 * rpx,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20 * rpx, 20 * rpx, 20 * rpx, 45 * rpx),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal:30 * rpx),
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: _comment,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '来聊天啊~',
                          hintStyle: TextStyle(color: Color(0xffCECECE), fontSize: 25 * rpx)
                        ),
                      ),
                    ),
                  ),
                   InkWell(
                    child: Container(
                      width: 60 * rpx,
                      margin: EdgeInsets.symmetric(horizontal: 20 * rpx),
                      child: Image.asset('assets/images/pay.png'),
                    ),
                    onTap: () => _addItem()
                  ),
                  InkWell(
                    child: Container(
                      width: 60 * rpx,
                      child: Image.asset('assets/images/livelw.png'),
                    ),
                    onTap: () => _addLwItem()
                  )
                ],
              ),
            ),
          )
      ],
    );
  }

  // 构造聊天容器
  Widget _buildItem( _item, Animation _animation) {

    double rpx = MediaQuery.of(context).size.width / 750;

    return SizeTransition(
      sizeFactor: _animation,
      child: Container(
        margin: EdgeInsets.only(bottom: 20 * rpx),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(50 * rpx, 5 * rpx, 20 * rpx, 5 * rpx),
              // width: ScreenAdapter.setWidth(80),
              alignment: Alignment.centerRight,
              child: Text('${_item['dj']}', style: TextStyle(fontSize: 23 * rpx, color:Colors.white), textAlign: TextAlign.right,),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Utils.panImage(_item['dj']),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(5)
              ),
            ),
            SizedBox(
              width: 10 * rpx,
            ),
            Expanded(
              flex: 1,
              child: Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    child: Text('${_item['nickName']}：', style: TextStyle(fontSize: 25 * rpx, color: Color(0xffA4A4A4)),)
                  ),
                  TextSpan(
                    text: '${_item['msg']}',
                    style: TextStyle(
                      fontSize: 26 * rpx
                    )
                  )
                ]
              )
            ),
            )
          ],
        ),
      )
    );
  }

  // 构造礼物容器
  Widget _buildLwItem(_item, index,  Animation _animation){

    double rpx = MediaQuery.of(context).size.width / 750;

    return SlideTransition(
            position: _animation.drive(CurveTween(curve: Curves.easeIn)).drive(Tween<Offset>(begin: Offset(1,1),end: Offset(0,1))),
            child:Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top:20 * rpx),
                        // padding: EdgeInsets.all(20 * rpx),
                        decoration: BoxDecoration(
                          color: Color(0xffFF3641),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(20 * rpx),
                              child: ImageRoud('https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3256100974,305075936&fm=26&gp=0.jpg', 30),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10 * rpx),
                              child: Text('磐石BedRock', style: TextStyle(fontSize: 25 * rpx, fontWeight: FontWeight.bold,  color: Colors.white),),
                            ),
                            Text('赠送了礼物:', style: TextStyle(fontSize: 25 * rpx, color: Colors.white),),
                            Text('奖杯 x $index', style: TextStyle(fontSize: 25 * rpx, color: Colors.white),),
                          ],
                        ),
                      ),
                      Positioned(
                        width: 140 * rpx,
                        height: 140 * rpx,
                        right:20,
                        child: Container(
                          // margin: EdgeInsets.only(left:20 * rpx),
                          // width: 30, // 自适应占满全部
                          width: 140 * rpx,
                          height: 140 * rpx,
                          padding: EdgeInsets.symmetric(vertical:20 * rpx, horizontal: 40 * rpx),
                          decoration: BoxDecoration(
                            color: Color(0xffF9F9F9),
                            borderRadius: BorderRadius.horizontal(left:Radius.circular(40), right: Radius.circular(40))
                          ),
                          child: Image.asset('assets/images/award.png', fit:BoxFit.contain)
                        ),
                      )
                    ],
                  )
            );

     
  }
}