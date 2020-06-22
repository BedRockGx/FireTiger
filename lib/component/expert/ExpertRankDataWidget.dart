import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/component/expert/ExpertChild.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ExpertRankDataWidget extends StatefulWidget {
  @override
  _ExpertRankDataWidgetState createState() => _ExpertRankDataWidgetState();
}

class _ExpertRankDataWidgetState extends State<ExpertRankDataWidget> {

    List<Map> data = [
    {'pm':1 , 'image':'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3873278591,2846033136&fm=26&gp=0.jpg', 'title':'隔壁老王', 'describe':'暗示大家看合适的骄傲和时间段就卡的健康会尽快哈倒计时', 'isGuan':false},
    {'pm':2 , 'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1803056350,344909414&fm=111&gp=0.jpg', 'title':'隔壁老王', 'describe':'看见爱上的骄傲机会大健康和大家安科技的哈健康的科技安徽登记卡和大家客户的空间啊哈看的哈几点回家卡', 'isGuan':true},
    {'pm':3 , 'image':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'title':'隔壁老王', 'describe':'美卡素假大空洛杉矶的期望IE基金奥斯卡大家', 'isGuan':false},
    {'pm':4 , 'image':'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3873278591,2846033136&fm=26&gp=0.jpg', 'title':'隔壁老王', 'describe':'阿萨德黄金卡股东会建安公司的环境爱上干活的环境噶的规划', 'isGuan':false},
    {'pm':5 , 'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1803056350,344909414&fm=111&gp=0.jpg', 'title':'隔壁老王', 'describe':'默契我诶去哪都流口水的机会千万已微乎其微和', 'isGuan':true},
    {'pm':6 , 'image':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'title':'隔壁老王', 'describe':'20年卡视角大神解答收款登记卡上的礼物请尽快球迷', 'isGuan':false},
    {'pm':7 , 'image':'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3873278591,2846033136&fm=26&gp=0.jpg', 'title':'隔壁老王', 'describe':'加速路口的敬爱其文uqiwlijalsjdajdaksjdkajsdqwieqw奥斯卡的据了解为契机个奥斯卡就打开连接起劲儿', 'isGuan':false},
    {'pm':8 , 'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1803056350,344909414&fm=111&gp=0.jpg', 'title':'隔壁老王', 'describe':'男男女女暖所多军军无军群无可群扩无可群翁木女女阿萨德纳面试你的吗，阿喀琉斯到家了请问那是的那家', 'isGuan':true},
    {'pm':9 , 'image':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'title':'隔壁老王', 'describe':'阿萨德能进去后我就饿', 'isGuan':false},
  ];

  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
            child: Column(
              children: data.map((item){
                return ExpertChild(item);
              }).toList()
            ),
          )
      ],
    );
  }
}