import 'dart:async';
import 'dart:convert';

import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/UserInfoProvider.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:firetiger/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:rongcloud_im_plugin/rongcloud_im_plugin.dart';
import 'dart:developer' as developer;

import 'package:transparent_image/transparent_image.dart';

class LiveIM extends StatefulWidget {
  var stream;
  var anchorID;
  LiveIM(this.stream, this.anchorID);
  @override
  _LiveIMState createState() => _LiveIMState(this.stream, this.anchorID);
}

class _LiveIMState extends State<LiveIM> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  var stream;
  var anchorID;
  TextEditingController _comment;
  ScrollController _listController;                   // 聊天列表控制器啊
  ScrollController _lwController;                     // 礼物列表控制器
  var uid,token;
  _LiveIMState(this.stream, this.anchorID);

  List<Map> _list = [];
  List<Map> _lwList = [];
  List<Map> _lwData = [];
  var giftid;
  var lwimg;
  var lwname;
  var giftcount = 1;
  var lw = [];
  var account;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();       // 聊天列表key
  final GlobalKey<AnimatedListState> _lwKey = GlobalKey<AnimatedListState>();         // 礼物key

  var api = Api();

  @override
  bool get wantKeepAlive => true;


  @override
  void initState() {
    super.initState();
    _comment = TextEditingController();
    _listController = ScrollController();         
    _lwController = ScrollController();
    onListenerIM();
    _getLwData();
    _getHistoryUserInfo();
    
  }

  _getHistoryUserInfo() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    var tokens = await PublicStorage.getHistoryList('token');
    print(tokens);
    if(uuid.isNotEmpty && tokens.isNotEmpty){
      setState(() {
        uid = uuid[0];
        token = tokens[0];
      });
      _getAccountData();
    }
  }

  void _addItem() {
    final int _index = _list.length;

    Timer(Duration(milliseconds: 500), () => _listController.jumpTo(_listController.position.maxScrollExtent));      // 页面永远保持在最底部

    _list.insert(_index, {'dj':5, 'nickName':'大眼萌', 'msg':'贵了，还有经济网一年合同的大龄速度型，我就说不是这样的吧，不信，安徽师大'});
    _listKey.currentState.insertItem(_index);
  }

  void _addLwItem(data) {
    final int _index = _lwList.length;
    Timer(Duration(milliseconds: 500), () => _lwController.jumpTo(_lwController.position.maxScrollExtent));      // 页面永远保持在最底部
    _lwList.insert(_index, {'lwimg':data['lwimg'], 'nickName':'磐石BedRock','avatar':data['avatar'], 'num':1, 'lwname':data['lwname']});
    _lwKey.currentState.insertItem(_index);
    Timer(Duration(milliseconds: 2500), () => _removeLwItem());
  }

  
  void _removeLwItem() {
    final int _index = _lwList.length - 1;
    var item = _lwList[_index];
    _lwKey.currentState.removeItem(
        0, (context, animation) => _buildLwItem(item, _index, animation));
    _lwList.removeAt(_index);
  }

  onSendMessage({isLw = false}) async{
      if(!isLw){
        TextMessage txtMessage = new TextMessage();
        txtMessage.content = json.encode({'content':_comment.text,  'type':1});
        Message msg = await RongIMClient.sendMessage(RCConversationType.ChatRoom, '332245', txtMessage);

        if(msg.senderUserId != null){
        
        var uid = msg.senderUserId.toString().substring(2);
        api.getData(context, 'getUserLevel', formData: {'uid':uid}).then((val){
            var res = json.decode(val.toString());
            final int _index = _list.length;
            Timer(Duration(milliseconds: 500), () => _listController.jumpTo(_listController.position.maxScrollExtent));      // 页面永远保持在最底部
            _list.insert(_index, {'dj':res['data']['info']['level'], 'nickName':res['data']['info']['user_nicename'], 'msg':'${_comment.text}'});
            _listKey.currentState.insertItem(_index);
            Timer(Duration(milliseconds: 550), (){
              setState(() {
                _comment.text = '';
              });
            });
          });

          
        }
      }else{
        var lwFormData = json.encode({'lwimg':this.lwimg, 'type':2, 'num':1, 'lwname':this.lwname});
        print(lwFormData);

        TextMessage txtMessage = new TextMessage();
        txtMessage.content = lwFormData;
        Message msg = await RongIMClient.sendMessage(RCConversationType.ChatRoom, '332245', txtMessage);
        print('发送成功：${msg.senderUserId}');
      }

      
  }

  onListenerIM(){
    RongIMClient.onMessageReceived = (Message msg,int left) {
      print("监听消息Id:"+msg.messageId.toString()+" left:"+left.toString());
      
      var msgObj = json.decode(msg.content.conversationDigest());
      print(msgObj);
      if(msgObj['type'] == 1){
        var uid = msg.senderUserId.toString().substring(2);
        api.getData(context, 'getUserLevel', formData: {'uid':uid}).then((val){
            var res = json.decode(val.toString());
            final int _index = _list.length;
            Timer(Duration(milliseconds: 500), () => _listController.jumpTo(_listController.position.maxScrollExtent));      // 页面永远保持在最底部
            _list.insert(_index, {'dj':res['data']['info']['level'], 'nickName':res['data']['info']['user_nicename'], 'msg':'${msgObj['content']}'});
            _listKey.currentState.insertItem(_index);
          });
      }else{
        print(msgObj['lwimg']);
        var uid = msg.senderUserId.toString().substring(2);
        api.getData(context, 'getUserLevel', formData: {'uid':uid}).then((val){
          var res = json.decode(val.toString());
          final int _index = _lwList.length;
          Timer(Duration(milliseconds: 500), () => _lwController.jumpTo(_lwController.position.maxScrollExtent));      // 页面永远保持在最底部
          _lwList.insert(_index, {'lwimg':msgObj['lwimg'], 'nickName':res['data']['info']['user_nicename'],'avatar': res['data']['info']['avatar'], 'num':1, 'lwname':msgObj['lwname']});
          _lwKey.currentState.insertItem(_index);
          Timer(Duration(milliseconds: 2500), () => _removeLwItem());
        });
      }

      
    };
  }

  _getLwData(){
    api.getData(context, 'getGiftList').then((val){
      var res = json.decode(val.toString());
      setState(() {
        _lwData = ( res['data']['info']['list'] as List).cast();
        giftid = _lwData[0]['id'];
      });
    });
  }

  _getAccountData(){
    api.getData(context, 'getUserAccount', formData: {'uid':uid, 'token':token, 'p':1, 'dateType':4}).then((val){
      var res= json.decode(val.toString());
      print('1111111111111111');
      print(res);
      setState(() {
        account = res['data']['info']['total'];
      });
    });
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
                        textInputAction:TextInputAction.send,
                        style: TextStyle(fontSize: 25 * rpx),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '来聊天啊~',
                          hintStyle: TextStyle(color: Color(0xffCECECE), fontSize: 25 * rpx)
                        ),
                        onSubmitted:(v){
                          onSendMessage();
                        }
                      ),
                    ),
                  ),
                   InkWell(
                    child: Container(
                      width: 60 * rpx,
                      margin: EdgeInsets.symmetric(horizontal: 20 * rpx),
                      child: Image.asset('assets/images/pay.png'),
                    ),
                    onTap: (){
                      
                      Navigator.pushNamed(context, '/shoppingMall');
                    }
                  ),
                  InkWell(
                    child: Container(
                      width: 60 * rpx,
                      child: Image.asset('assets/images/livelw.png'),
                    ),
                    onTap: showBottomSheet
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
                  image: Utils.panImage(int.parse(_item['dj'])),
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
                              child: ImageRoud('${_item['avatar']}', 30),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10 * rpx),
                              child: Text('${_item['nickName']}', style: TextStyle(fontSize: 25 * rpx, fontWeight: FontWeight.bold,  color: Colors.white),),
                            ),
                            Text('赠送了礼物:', style: TextStyle(fontSize: 25 * rpx, color: Colors.white),),
                            Text('${_item['lwname']} x ${_item['num']}', style: TextStyle(fontSize: 25 * rpx, color: Colors.white),),
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
                          padding: EdgeInsets.symmetric(vertical:20 * rpx, horizontal: 30 * rpx),
                          decoration: BoxDecoration(
                            color: Color(0xffF9F9F9),
                            borderRadius: BorderRadius.horizontal(left:Radius.circular(40), right: Radius.circular(40))
                          ),
                          child: Image.network('${_item['lwimg']}')
                        ),
                      )
                    ],
                  )
            );

     
  }

  static List<List<T>> splitList<T>(List<T> list, int len) {

    if (len <= 1) {
      return [list];
    }

    List<List<T>> result = List();

    int index = 1;

    while (true) {
      if (index * len < list.length) {
        List<T> temp = list.skip((index - 1) * len).take(len).toList();
        result.add(temp);
          index++;
          continue;
      }
      List<T> temp = list.skip((index - 1) * len).toList();
      result.add(temp);
      break;
    }
      
    return result;
  }

   showBottomSheet(){
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 10,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (BuildContext context) {
        
        List<List<Map>> newList = [];

        newList = splitList(_lwData, 8);
          
        return StatefulBuilder(
          builder:(BuildContext context, setBottomState) {

            var userInfoProvider = Provider.of<UserInfoProvider>(context);

            double rpx = MediaQuery.of(context).size.width / 750;

            return Container(
                    width: double.infinity,
                    height: 750 * rpx,
                    padding: EdgeInsets.all(20 * rpx),
                    child:Column(
                      children: <Widget>[
                        Container(
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text('给主播送礼物', style: TextStyle(fontSize: 35 * rpx, fontWeight: FontWeight.bold)),
                              ),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom:5*rpx),
                          child: ConstrainedBox(
                            child:  Swiper(
                              outer:false,
                              loop:false,
                              itemBuilder: (c, i) {
                                return  Wrap(
                                  runSpacing:  15.0 * rpx,
                                  spacing: 5.0 * rpx,
                                  children: newList[i].map((item){
                                    return InkWell(
                                      child:  Container(
                                        width: MediaQuery.of(context).size.width / 5+10 ,
                                        padding: EdgeInsets.all(5 * rpx),
                                        decoration: BoxDecoration(
                                          border:item['id'] == this.giftid ? Border.all(width:1, color: Colors.red) :  Border.all(width:1, color: Color(0xffFFFFFF)),
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        child:  Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            SizedBox(
                                              child:   Container(
                                                child:  FadeInImage.memoryNetwork(
                                                    placeholder: kTransparentImage,
                                                    image: '${item['gifticon']}',
                                                    fit: BoxFit.cover,
                                                  ),
                                              ),
                                              height: MediaQuery.of(context).size.width * 0.12,
                                              width: MediaQuery.of(context).size.width * 0.12,
                                            ),
                                            Padding(padding:  EdgeInsets.only(top:6.0),child:  Text("${item['giftname']}"),),
                                            Padding(padding:  EdgeInsets.only(top:6.0),child:  Text("${item['needcoin']}火花", style: TextStyle(fontSize: ScreenAdapter.size(20)),),)
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        setBottomState((){
                                          this.giftid = item['id'];
                                          this.lwimg = item['gifticon'];
                                          this.lwname = item['giftname'];
                                        });
                                      },
                                    );
                                  }).toList(),
                                );
                              },
                              pagination:  SwiperPagination(
                                margin:  EdgeInsets.all(5.0)
                              ),
                              itemCount: (_lwData.length / 8).ceil()
                            ),
                              constraints: BoxConstraints.loose( Size(750 * rpx, 450 * rpx))
                          ),
                        ),
                        Container(
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
                                  margin: EdgeInsets.only(right:20 * rpx),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: 40 * rpx,
                                              child: Image.asset('assets/images/huohuan.png'),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(horizontal:10 * rpx),
                                              child: Text('火花', style: TextStyle(color: Color(0xffA1A1A1), fontSize: 25 * rpx),),
                                            ),
                                            Text('${account['huohua']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 * rpx),)
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 40 * rpx,
                                              child: Image.asset('assets/images/jb.png'),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(horizontal:10 * rpx),
                                              child: Text('火虎币', style: TextStyle(color: Color(0xffA1A1A1), fontSize: 25 * rpx),),
                                            ),
                                            Text('${account['huohubi']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 * rpx),)
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal:40 * rpx, vertical:10 *rpx),
                                  margin: EdgeInsets.symmetric(horizontal: 10 * rpx),
                                  decoration: BoxDecoration(
                                    color: Color(0xffFF3641),
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Text('送出', style: TextStyle(fontSize: 30 * rpx, color: Colors.white,)),
                                ),
                                onTap: () {
                                  // print(this.giftid);
                                  _addLwItem({'lwimg':this.lwimg, 'lwname':this.lwname, 'avatar':userInfoProvider.userInfo['avatar']});
                                  
                                  // print({'uid':uid,'token':token, 'liveuid':this.widget.anchorID, 'stream':this.widget.stream, 'giftid':this.giftid, 'giftcount':1});

                                  api.getData(context, 'SendGift', formData: {'uid':uid,'token':token, 'liveuid':this.widget.anchorID, 'stream':this.widget.stream, 'giftid':this.giftid, 'giftcount':1}).then((val){
                                    var res = json.decode(val.toString());
                                    if(res['data']['code'] == 0){
                                      onSendMessage(isLw: true);
                                    }
                                    
                                  });
                                }
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  );
          }
        );
        
      });
  }
}