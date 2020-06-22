import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/component/follow/ExpertChild.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class FollowExpert extends StatefulWidget {
  @override
  _FollowExpertState createState() => _FollowExpertState();
}

class _FollowExpertState extends State<FollowExpert> {

    List<Map> data = [
      {'img':'https://dss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3416639201,1190609549&fm=58&s=73760872F56D25012E0BDFBB0300502D&bpow=121&bpoh=75','sl':'100%', 'maxLines':2, 'dj':98, 'name':'LPL夏季赛', 'subname':'阿斯加德卡拉斯科建档立卡升级了打了卡数据库的理论框架卡洛斯建档立卡时间的考虑将案件奥斯卡登记卡上的健康好快乐的'},
      {'img':'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2722854742,2630717572&fm=111&gp=0.jpg', 'dj':98, 'name':'小主播','sl':'69.23%','maxLines':2,  'subname':'新来的主播多多关注'},
      {'img':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'dj':98, 'name':'一条大团团QAQ','sl':'53%','maxLines':2,  'subname':'咋回事啊。我的天哪'},
      {'img':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=443801258,2722780474&fm=111&gp=0.jpg', 'dj':98, 'name':'❤香','sl':'36.58%','maxLines':2,  'subname':'对没错，我就要波波哈哈哈哈哈静安嘉圣诞节奥斯卡佳'},
    ];

    var str = '展开';

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
                  padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children:data.map((item){
                          return ExpertChild(item);
                        }).toList()
                      )
                    ],
                  ),
                )
        ],
      )
    );
  }
}