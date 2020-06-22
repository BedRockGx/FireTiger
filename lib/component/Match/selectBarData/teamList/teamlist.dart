import 'package:firetiger/provider/matchBarProvider.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamList extends StatefulWidget {
  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {

  List<Map> siderBarList =  [
    {'title':'进球', 'code':0},
    {'title':'失球', 'code':1},
    {'title':'传球成功', 'code':2},
    {'title':'传球', 'code':3},
    {'title':'犯规', 'code':4},
    {'title':'过人', 'code':5},
    {'title':'越位', 'code':6},
    {'title':'角球', 'code':7},
    {'title':'射门', 'code':8},
    {'title':'被射门', 'code':9},
    {'title':'铲球', 'code':10},
  ];

  List<Map> siderDataList = [
    {'pm':1, 'name':'阿森纳', 'fs':80, 'img':'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg'},
    {'pm':2, 'name':'纽卡斯尔', 'fs':74, 'img':'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg'},
    {'pm':3, 'name':'阿森纳', 'fs':63, 'img':'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg'},
    {'pm':4, 'name':'纽卡斯尔', 'fs':53, 'img':'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg'},
    {'pm':5, 'name':'阿森纳', 'fs':52, 'img':'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg'},
    {'pm':6, 'name':'纽卡斯尔', 'fs':43, 'img':'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg'},
    {'pm':7, 'name':'阿森纳', 'fs':41, 'img':'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg'},
    {'pm':8, 'name':'纽卡斯尔', 'fs':40, 'img':'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg'},
    {'pm':9, 'name':'阿森纳', 'fs':39, 'img':'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg'},
    {'pm':10, 'name':'纽卡斯尔', 'fs':37, 'img':'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg'},
    {'pm':11, 'name':'阿森纳', 'fs':39, 'img':'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg'},
    {'pm':12, 'name':'纽卡斯尔', 'fs':30, 'img':'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg'},
  ];

  @override
  Widget build(BuildContext context) {

    var teamSider = Provider.of<MatchBarProvider>(context);

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
                        color: teamSider.teamSideBarIndex == item['code'] ? Colors.white : Color(0xffEAEAEA),
                        alignment: Alignment.centerRight,
                        child: Text('${item['title']}', style: TextStyle(fontSize: ScreenAdapter.size(25), fontWeight:teamSider.teamSideBarIndex == item['code'] ? FontWeight.bold : FontWeight.normal),),
                      ),
                      onTap: (){
                        teamSider.setTeamSideBarIndex(item['code']);
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
                                Text('${item['name']}', style: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),)
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
                                  width: ScreenAdapter.setWidth(50),
                                  margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(60)),
                                  child: Image.network('${item['img']}', fit: BoxFit.cover,),
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