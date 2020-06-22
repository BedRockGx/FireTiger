import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Comment extends StatefulWidget {
  int type;           // 1：咨询评论、2：视频评论
  Comment(this.type);
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

  @override
  void initState() {
    _comment = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double rpx = MediaQuery.of(context).size.width / 750;

    return Stack(
      children: <Widget>[
        ListView.builder(
          padding: EdgeInsets.only(top:0, bottom:ScreenAdapter.setHeight(250 * rpx)),
          itemBuilder: (BuildContext context, int index){
            return Container(
              padding: EdgeInsets.all(30 * rpx),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ImageRoud('${data[index]['img']}', 50),
                      SizedBox(
                        width: 10 * rpx,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('${data[index]['name']}', style: TextStyle(fontSize: 25 * rpx, color: Color(0xffA4A4A4)),),
                            Text('${data[index]['time']}', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
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
                                likeCount:data[index]['Fabulous'],
                                circleColor:CircleColor(start: Color(0xff00ddff), end: Color(0xffFF3641)),
                                bubblesColor: BubblesColor(
                                    dotPrimaryColor: Color(0xffFF3641),
                                    dotSecondaryColor: Color(0xffFF3641),
                                ),
                                onTap: (bool isLiked) async{
                                  return !isLiked;
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
                        child: Text('来哦天内容爱神的箭哈静待花开阿萨德离开家哈酒的哈吉斯的哈健康的哈时间的话', style: TextStyle(fontSize:  30 * rpx), ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: data.length,
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
            ),
          )
      ],
    );
  }
}