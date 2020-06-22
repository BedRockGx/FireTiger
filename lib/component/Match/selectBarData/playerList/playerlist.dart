import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/provider/matchBarProvider.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerList extends StatefulWidget {
  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {

    List<Map> siderBarList =  [
    {'title':'射手榜', 'code':0},
    {'title':'助攻榜', 'code':1},
    {'title':'射门', 'code':2},
    {'title':'射正', 'code':3},
    {'title':'传球', 'code':4},
    {'title':'成功传球', 'code':5},
    {'title':'关键传球', 'code':6},
    {'title':'拦截', 'code':7},
    {'title':'封堵', 'code':8},
    {'title':'解围', 'code':9},
    {'title':'黄牌', 'code':10},
  ];

  List<Map> siderDataList = [
    {'pm':1, 'name':'阿森纳', 'nickname':'奥巴梅杨',  'fs':80, 'jl':'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', 'img':'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=749063240,1600668152&fm=111&gp=0.jpg'},
    {'pm':2, 'name':'纽卡斯尔', 'nickname':'若埃林通', 'fs':74, 'jl':'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg',  'img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg'},
    {'pm':3, 'name':'阿森纳', 'nickname':'奥巴梅杨', 'fs':63, 'jl':'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', 'img':'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=749063240,1600668152&fm=111&gp=0.jpg'},
    {'pm':4, 'name':'纽卡斯尔', 'nickname':'若埃林通', 'fs':53, 'jl':'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg','img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg'},
    {'pm':5, 'name':'阿森纳', 'nickname':'奥巴梅杨', 'fs':52, 'jl':'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', 'img':'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=749063240,1600668152&fm=111&gp=0.jpg'},
    {'pm':6, 'name':'纽卡斯尔', 'nickname':'若埃林通', 'fs':43, 'jl':'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg','img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg'},
    {'pm':7, 'name':'阿森纳', 'nickname':'奥巴梅杨', 'fs':41, 'jl':'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', 'img':'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=749063240,1600668152&fm=111&gp=0.jpg'},
    {'pm':8, 'name':'纽卡斯尔', 'nickname':'若埃林通', 'fs':40, 'jl':'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg','img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg'},
    {'pm':9, 'name':'阿森纳', 'nickname':'奥巴梅杨', 'fs':39, 'jl':'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', 'img':'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=749063240,1600668152&fm=111&gp=0.jpg'},
    {'pm':10, 'name':'纽卡斯尔', 'nickname':'若埃林通', 'fs':37, 'jl':'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg','img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg'},
    {'pm':11, 'name':'阿森纳', 'nickname':'奥巴梅杨', 'fs':39, 'jl':'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', 'img':'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=749063240,1600668152&fm=111&gp=0.jpg'},
    {'pm':12, 'name':'纽卡斯尔', 'nickname':'若埃林通', 'fs':30, 'jl':'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg', 'img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg'},
  ];

  @override
  Widget build(BuildContext context) {

    var playerSider = Provider.of<MatchBarProvider>(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height
      ),
      child:Container(
        // padding: EdgeInsets.only(bottom:ScreenAdapter.setHeight(400)),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child:  ListView(
                  children: siderBarList.map((item){
                    return InkWell(
                      child: Container(
                        padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                        color: playerSider.playerSideBarIndex == item['code'] ? Colors.white : Color(0xffEAEAEA),
                        alignment: Alignment.centerRight,
                        child: Text('${item['title']}', style: TextStyle(fontSize: ScreenAdapter.size(25), fontWeight:playerSider.playerSideBarIndex == item['code'] ? FontWeight.bold : FontWeight.normal),),
                      ),
                      onTap: (){
                        playerSider.setPlayerSideBarIndex(item['code']);
                      },
                    );
                  }).toList()
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.white,
                child: ListView(
                  children: siderDataList.map((item){
                    return Container(
                      margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Text('${item['pm']}', style: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),),
                                  margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('${item['nickname']}', style: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),),
                                    SizedBox(
                                      height: ScreenAdapter.setHeight(10),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                                          width: ScreenAdapter.setWidth(30),
                                          child: Image.network('${item['jl']}', fit: BoxFit.cover,),
                                        ),
                                        Text('${item['name']}', style: TextStyle(fontSize: ScreenAdapter.size(20)),)
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text('${item['fs']}', style: TextStyle(fontSize: ScreenAdapter.size(35), color: Colors.redAccent, fontWeight: FontWeight.bold),),
                                
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(60)),
                                  child: ImageRoud('${item['img']}', 40)
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList()
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}