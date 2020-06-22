import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class GuessingCompetitionWidget extends StatelessWidget {
  var type = 1;
  GuessingCompetitionWidget(this.type);
  List<Map> data = [
    {'title':'哪方会赢得比赛?', 'status':0, 'Mainparty':'A', 'Client':'B', 'win':'', 'time':'2020-06-10 13:23', 'me':'A'},
    {'title':'哪方会赢得比赛?', 'status':2, 'Mainparty':'A', 'Client':'B', 'win':'A', 'time':'2020-06-10 13:23', 'me':'B'},
    {'title':'哪方会赢得比赛?', 'status':1, 'Mainparty':'A', 'Client':'B', 'win':'B', 'time':'2020-06-10 13:23', 'me':'A'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
      child:
       ListView.builder(
        itemBuilder: (BuildContext context, int index){
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: ScreenAdapter.setWidth(1),
                  color: Color(0xffF3F3F3)
                )
              )
            ),
            padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(40)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text('${data[index]['title']}', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                          SizedBox(width: ScreenAdapter.setWidth(10)),
                         type == 2 ? Text('我投${data[index]['me']}', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Colors.red),) : Text('')
                        ],
                      ),
                    ),
                    panText(data[index]['status'])
                  ],
                ),
                SizedBox(
                  height: ScreenAdapter.setHeight(10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text.rich(TextSpan(
                      style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),
                      children: [
                        TextSpan(
                          text: '${data[index]['Mainparty']}'
                        ),
                        type == 1 ? TextSpan(
                          text: '${data[index]['Mainparty'] == data[index]['win'] ? '(胜)' : ''}',
                          style: TextStyle(
                            color: Colors.red
                          )
                        ):TextSpan(),
                        TextSpan(
                          text: ' vs '
                        ),
                        TextSpan(
                          text: '${data[index]['Client']}'
                        ),
                        type == 1 ?TextSpan(
                          text: '${data[index]['Client'] == data[index]['win'] ? '(胜)' : ''}',
                          style: TextStyle(
                            color: Colors.red
                          )
                        ):TextSpan(),
                      ]
                    )),
                    Text('${data[index]['time']}', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),)
                  ],
                )
              ],
            ),
          );
        },
        itemCount: data.length,
      )
    );
  }

  // 判断显示什么文字
  Widget panText(i){
    switch (i) {
      case 0:
        return Text('流局', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Color(0xffA4A4A4)),);
        break;
      case 1:
        return Text('0', style: TextStyle(fontSize: ScreenAdapter.size(30)),);
        break;
      case 2:
        return Text('+45', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Colors.red),);
        break;
      default:
    }
  } 
}