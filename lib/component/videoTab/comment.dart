import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/UserInfoProvider.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:firetiger/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class Comment extends StatefulWidget {
  int type;           // 2：咨询评论、1：视频评论
  var videoId;
  Comment(this.type, {this.videoId});
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {

  TextEditingController  _comment;

  List<Map> data = [
    {'img':'https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1408233282,1483083519&fm=26&gp=0.jpg', 'name':'我是一颗小虎牙', 'time':'10:45', 'Fabulous':0},
    {'img':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3256100974,305075936&fm=26&gp=0.jpg', 'name':'哈哈哈哈', 'time':'09:08', 'Fabulous':20},
    {'img':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'name':'是这样的吗', 'time':'昨天23:21', 'Fabulous':30},
    {'img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4146343321,3855884912&fm=111&gp=0.jpg', 'name':'专业啊', 'time':'昨天18:54', 'Fabulous':5},
    {'img':'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2722854742,2630717572&fm=111&gp=0.jpg', 'name':'厉害了！', 'time':'昨天15:54', 'Fabulous':7},
    {'img':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=909846316,603824306&fm=111&gp=0.jpg', 'name':'我就不信了', 'time':'昨天10:02', 'Fabulous':10},
    {'img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3321238736,733069773&fm=26&gp=0.jpg', 'name':'磐石BedRock', 'time':'昨天10:00', 'Fabulous':15},
    {'img':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1803056350,344909414&fm=111&gp=0.jpg', 'name':'PHP是最好的语言', 'time':'06-17', 'Fabulous':0},
    {'img':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3941945834,1200687368&fm=111&gp=0.jpg', 'name':'Timelsls', 'time':'02-14', 'Fabulous':100},
  ];

  var _futureCommentBuilder;
  var api = Api();
  var _page = 1;
  var _pagesize = 20;
  var commentData;
  var uid, token;
  var topic_type = 1;

 

  @override
  void initState() {
    _comment = TextEditingController();
    super.initState();
    _futureCommentBuilder = _getCommentData();
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
    }else{
      Navigator.pushNamed(context, '/login');
    }
  }

  _pushComments() async {
    print({'uid':uid, 'token':token, 'topic':widget.videoId, 'topic_type':widget.type, 'content':_comment.text});
    if(_comment.text.length < 5){
      Fluttertoast.showToast(msg: '最少5个字');
      return;
    }
    api.getData(context, 'setNewComment', formData: {'uid':uid, 'token':token, 'topic':widget.videoId, 'topic_type':widget.type, 'content':_comment.text}).then((val){
      var res = json.decode(val.toString());
      if(res['data']['code'] == 700){
        Navigator.pushNamed(context, '/login');
      }else{
        setState(() {
          _comment.text = '';
        });
      }
      Fluttertoast.showToast(msg: res['data']['msg']);
      _getCommentData();
    });
  }

  Future _getCommentData() async{
    Response response;
    response = await api.getData(context, 'getLiveComments', formData: {'topic':widget.videoId, 'page':_page, 'pagesize':_pagesize});
    var v = json.decode(response.toString());
    print(v['data']['info']);
    setState(() {
      commentData = v['data']['info'];
    });
    // return [];
    return v['data']['info'];
  }

  @override
  Widget build(BuildContext context) {

    double rpx = MediaQuery.of(context).size.width / 750;

    var userInfoProvider = Provider.of<UserInfoProvider>(context);

    return Stack(
      children: <Widget>[
        FutureBuilder(
          future: _futureCommentBuilder,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if(snapshot.data.length > 0){
               
                
                return ListView.builder(
                        padding: EdgeInsets.only(top:0, bottom:ScreenAdapter.setHeight(300 * rpx)),
                        itemBuilder: (BuildContext context, int index){
                          // print('');
                          return Container(
                            padding: EdgeInsets.all(30 * rpx),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    ImageRoud('${commentData[index]['comment']['from_uid']['avatar']}', 50),
                                    SizedBox(
                                      width: 10 * rpx,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('${commentData[index]['comment']['from_uid']['user_nicename']}', style: TextStyle(fontSize: 25 * rpx, color: Color(0xffA4A4A4)),),
                                          Text('${commentData[index]['comment']['create_time']}', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          LikeButton(
                                              likeBuilder: (bool isLiked){
                                                  return Icon(IconData(0xe683, fontFamily: 'myIcon'),color: isLiked ? Color(0xffFF3641) : Colors.grey,);
                                              },
                                              likeCount:int.parse(commentData[index]['comment']['commentLikes']),
                                              circleColor:CircleColor(start: Color(0xff00ddff), end: Color(0xffFF3641)),
                                              bubblesColor: BubblesColor(
                                                  dotPrimaryColor: Color(0xffFF3641),
                                                  dotSecondaryColor: Color(0xffFF3641),
                                              ),
                                              onTap: (bool isLiked) async{
                                                // print({'uid':uid, 'token':token, 'comment_id':commentData[index]['comment_id']});
                                                Response response;
                                                response = await api.getData(context, 'commentAddLike', formData: {'uid':uid, 'token':token, 'comment_id':commentData[index]['comment_id']});
                                                var res = json.decode(response.toString());
                                                Fluttertoast.showToast(msg: res['data']['msg']);
                                                if(res['data']['code'] == 1){
                                                  return !isLiked;
                                                }
                                                
                                              }
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 100 * rpx,
                                    ),
                                    Container(
                                      width: 500 * rpx,
                                      child: Text('${commentData[index]['comment']['content']}', style: TextStyle(fontSize:  30 * rpx), ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: commentData.length,
                      );
              }else{
                return Container(
                  child: Center(
                    child: Text('目前还没有人评论哦~', style: TextStyle(fontSize: 30 * rpx, color: Color(0xffA4A4A4)),),
                  ),
                );
              }
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        ),
        
        Positioned(
            bottom: 0,
            width: 750 * rpx,
            child: userInfoProvider.islogin ? 
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
                          _pushComments();
                        }
                      ),
                    ),
                  ),
                  widget.type == 2 ? InkWell(
                    child: Container(
                      width: 60 * rpx,
                      margin: EdgeInsets.symmetric(horizontal: 20 * rpx),
                      child: Image.asset('assets/images/pay.png'),
                    ),
                    onTap: (){

                    },
                  ):Text(''),
                  widget.type == 2 ? InkWell(
                    child: Container(
                      width: 60 * rpx,
                      child: Image.asset('assets/images/livelw.png'),
                    ),
                    onTap: (){

                    },
                  ):Text(''),
                ],
              ),
            )
            :
            InkWell(
              child: Container(
                width: 750 * rpx,
                height: 150 * rpx,
                color: Color(0xffF5F5F5),
                padding: EdgeInsets.fromLTRB(20 * rpx, 20 * rpx, 20 * rpx, 45 * rpx),
                alignment: Alignment.center,
                child: Text('请先登录再评论~'),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/login').then((_){
                  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.light,
                    statusBarIconBrightness: Brightness.light,
                  ));
                });
              },
            )
          )
      ],
    );
  }
}