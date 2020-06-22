import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class BarDataRank extends StatefulWidget {
  @override
  _BarDataRankState createState() => _BarDataRankState();
}

class _BarDataRankState extends State<BarDataRank> {
  List dataList = [
    {
      'title': '欧冠区',
      'data': [
        {
          'pm': 1,
          'img':
              'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg',
          'name': '阿森纳',
          's': 27,
          'spf': '18/4/5',
          'js': '63/31',
          'jf': 58
        },
        {
          'pm': 2,
          'img':
              'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg',
          'name': '纳卡斯尔',
          's': 27,
          'spf': '16/8/3',
          'js': '49/19',
          'jf': 56
        },
        {
          'pm': 3,
          'img':
              'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg',
          'name': '阿森纳',
          's': 27,
          'spf': '18/4/5',
          'js': '63/31',
          'jf': 58
        },
        {
          'pm': 4,
          'img':
              'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg',
          'name': '纳卡斯尔',
          's': 27,
          'spf': '16/8/3',
          'js': '49/19',
          'jf': 56
        },
      ]
    },
    {
      'title': '欧联区',
      'data': [
        {
          'pm': 5,
          'img':
              'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg',
          'name': '阿森纳',
          's': 27,
          'spf': '18/4/5',
          'js': '63/31',
          'jf': 58
        },
      ]
    },
    {
      'title': '欧联资格赛区',
      'data': [
        {
          'pm': 6,
          'img':
              'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg',
          'name': '纳卡斯尔',
          's': 27,
          'spf': '16/8/3',
          'js': '49/19',
          'jf': 56
        },
        {
          'pm': 7,
          'img':
              'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg',
          'name': '阿森纳',
          's': 27,
          'spf': '18/4/5',
          'js': '63/31',
          'jf': 58
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(40)),
      child: Column(
        children: <Widget>[
          Container(
              margin:
                  EdgeInsets.symmetric(vertical: ScreenAdapter.setHeight(20)),
              child: Table(
                columnWidths: {
                  0: FixedColumnWidth(ScreenAdapter.setWidth(300)),
                  1: FixedColumnWidth(ScreenAdapter.setWidth(70)),
                  2: FixedColumnWidth(ScreenAdapter.setWidth(150)),
                  3: FixedColumnWidth(ScreenAdapter.setWidth(90)),
                  4: FixedColumnWidth(ScreenAdapter.setWidth(100)),
                },
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Text(
                        '球队',
                        style: TextStyle(fontSize: ScreenAdapter.size(20)),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        '赛',
                        style: TextStyle(fontSize: ScreenAdapter.size(20)),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        '胜/平/负',
                        style: TextStyle(fontSize: ScreenAdapter.size(20)),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        '进/失',
                        style: TextStyle(fontSize: ScreenAdapter.size(20)),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        '积分',
                        style: TextStyle(fontSize: ScreenAdapter.size(20)),
                      ),
                    ),
                  ])
                ],
              )),
          Container(
            child: Column(
              children:[
                Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: ScreenAdapter.setHeight(20)),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '欧冠区',
                                style: TextStyle(
                                    fontSize: ScreenAdapter.size(35),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: ScreenAdapter.setHeight(20)),
                                  child: Table(
                                    columnWidths: {
                                      0: FixedColumnWidth(ScreenAdapter.setWidth(300)),
                                      1: FixedColumnWidth(ScreenAdapter.setWidth(70)),
                                      2: FixedColumnWidth(ScreenAdapter.setWidth(150)),
                                      3: FixedColumnWidth(ScreenAdapter.setWidth(90)),
                                      4: FixedColumnWidth(ScreenAdapter.setWidth(100)),
                                    },
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: [
                                      TableRow(children: [
                                        TableCell(
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '1',
                                                style: TextStyle(
                                                    fontSize: ScreenAdapter.size(35),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Container(
                                                width: ScreenAdapter.setWidth(50),
                                                margin: EdgeInsets.only(
                                                    left: ScreenAdapter.setWidth(40),
                                                    right: ScreenAdapter.setWidth(20)),
                                                child: Image.network(
                                                    'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg',
                                                    fit: BoxFit.cover),
                                              ),
                                              Text(
                                                '阿森纳',
                                                style: TextStyle(
                                                    fontSize: ScreenAdapter.size(25)),
                                              )
                                            ],
                                          ),
                                        ),
                                        TableCell(
                                          child: Text(
                                            '27',
                                            style: TextStyle(
                                                fontSize: ScreenAdapter.size(25)),
                                          ),
                                        ),
                                        TableCell(
                                          child: Text(
                                            '18/4/5',
                                            style: TextStyle(
                                                fontSize: ScreenAdapter.size(25)),
                                          ),
                                        ),
                                        TableCell(
                                          child: Text(
                                            '63/31',
                                            style: TextStyle(
                                                fontSize: ScreenAdapter.size(25)),
                                          ),
                                        ),
                                        TableCell(
                                          child: Text(
                                            '58',
                                            style: TextStyle(
                                                fontSize: ScreenAdapter.size(25)),
                                          ),
                                        ),
                                      ])
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      
              ]
            ),
          )
        ],
      ),
    );
  }
}
