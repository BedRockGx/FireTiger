import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class SelectExpandedBar extends StatefulWidget {
  @override
  _SelectExpandedBarState createState() => _SelectExpandedBarState();
}

class _SelectExpandedBarState extends State<SelectExpandedBar> {
  List<Map> _selectExpandedBarData;
  int highlight;

  @override
  void initState() {
    super.initState();
    _selectExpandedBarData = [
      {'title': '比赛', 'code': 1},
      {'title': '排名', 'code': 2},
      {'title': '球队榜', 'code': 3},
      {'title': '球员榜', 'code': 4},
    ];
    highlight = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenAdapter.setWidth(40),
          vertical: ScreenAdapter.setHeight(20)),
      height: ScreenAdapter.setHeight(100),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: ScreenAdapter.setWidth(40)),
            child: Row(
              children: <Widget>[
                Text(
                  '19-20',
                  style: TextStyle(fontSize: ScreenAdapter.size(30)),
                ),
                SizedBox(
                  width: ScreenAdapter.setWidth(10),
                ),
                Icon(
                  IconData(0xe677, fontFamily: 'myIcon'),
                  color: Color(0xff666666),
                  size: ScreenAdapter.size(15),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(ScreenAdapter.setWidth(10)),
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
                        padding: EdgeInsets.all(ScreenAdapter.setWidth(10)),
                        decoration: BoxDecoration(
                            color: highlight == item['code']
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          item['title'],
                          style: TextStyle(
                              fontSize: ScreenAdapter.size(25),
                              color: highlight == item['code']
                                  ? Color(0xff333333)
                                  : Colors.white),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          highlight = item['code'];
                        });
                      },
                    ));
              }).toList()),
            ),
          )
        ],
      ),
    );
  }
}
