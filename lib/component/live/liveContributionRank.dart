import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:flutter/material.dart';

class LiveContriButionRank extends StatefulWidget {
  @override
  _LiveContriButionRankState createState() => _LiveContriButionRankState();
}

class _LiveContriButionRankState extends State<LiveContriButionRank> {

  List<Map> _selectExpandedBarData ;
  int highlight;

  List<Map> _rankData;

  @override
  void initState() {
    super.initState();
    highlight = 1;
    _selectExpandedBarData = [
      {'title':'周榜', 'code':1},
      {'title':'总榜', 'code':2},
    ];

    _rankData = [
      {'pm':1 , 'image':'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3873278591,2846033136&fm=26&gp=0.jpg', 'title':'隔壁老王', 'gx':124, },
      {'pm':2 , 'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1803056350,344909414&fm=111&gp=0.jpg', 'title':'隔壁老王', 'gx':23, },
      {'pm':3 , 'image':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'title':'隔壁老王', 'gx':100, },
      {'pm':4 , 'image':'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3873278591,2846033136&fm=26&gp=0.jpg', 'title':'隔壁老王', 'gx':233, },
      {'pm':5 , 'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1803056350,344909414&fm=111&gp=0.jpg', 'title':'隔壁老王', 'gx':68,},
      {'pm':6 , 'image':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'title':'隔壁老王', 'gx':1000,},
      {'pm':7 , 'image':'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3873278591,2846033136&fm=26&gp=0.jpg', 'title':'隔壁老王', 'gx':20, },
      {'pm':8 , 'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1803056350,344909414&fm=111&gp=0.jpg', 'title':'隔壁老王', 'gx':1, },
      {'pm':9 , 'image':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'title':'隔壁老王', 'gx':300, },
    ];
  }



  @override
  Widget build(BuildContext context) {

    double rpx = MediaQuery.of(context).size.width / 750;

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 40 * rpx, vertical: 40 * rpx),
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300 * rpx,
                padding: EdgeInsets.all(10 * rpx),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                    children: _selectExpandedBarData.map((item) {
                  return Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10 * rpx),
                          decoration: BoxDecoration(
                              color: highlight == item['code']
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Text(
                            item['title'],
                            style: TextStyle(
                                fontSize: 25 * rpx ,
                                color: highlight == item['code']
                                    ? Color(0xff333333)
                                    : Colors.white),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            highlight = item['code'];
                          });
                          // selectProvider.setBarIndex(item['code']);
                        },
                      ));
                }).toList()),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top:40 * rpx),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _rankData.map((item){
              return Container(
                        margin: EdgeInsets.only(bottom: 30 * rpx),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 70 *rpx,
                              height: 70 * rpx,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: panImage(item['pm']),
                                  fit: BoxFit.contain
                                ),
                              ),
                              child: item['pm'] > 3 ? Text('${item['pm']}', style: TextStyle(fontSize: 30 * rpx, color: Colors.white, fontWeight: FontWeight.bold),) : Text(''),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal:20 * rpx),
                              child: ImageRoud('${item['image']}', 60),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('${item['title']}', style: TextStyle(fontSize:30 * rpx, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              child: Text('已贡献${item['gx']}', style: TextStyle(fontSize: 25 * rpx, color: Color(0xffA4A4A4)),),
                            )
                          ],
                        ),
                      );
            }).toList()
          ),
        )
      ],
    );
  }

  panImage(n){
    switch (n) {
      case 1:
        return AssetImage('assets/images/ranking-1.png');
        break;
      case 2:
        return AssetImage('assets/images/ranking-2.png');
        break;
      case 3:
        return AssetImage('assets/images/ranking-3.png');
        break;
      default:
        return AssetImage('assets/images/ranking-other.png');
        break;
    }
  }
}