import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:firetiger/provider/matchBarProvider.dart';

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
      {'title': '积分榜', 'code': 2},
      {'title': '球员榜', 'code': 4},
    ];
    highlight = 1;
  }

  @override
  Widget build(BuildContext context) {

    var selectProvider = Provider.of<MatchBarProvider>(context);

    return Container(
      // color: Colors.white,
      margin: EdgeInsets.only(top:ScreenAdapter.setHeight(10)),
      padding: EdgeInsets.symmetric(
          horizontal: ScreenAdapter.setWidth(40),
          vertical: ScreenAdapter.setHeight(15)),
      height: ScreenAdapter.setHeight(100),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          selectProvider.barIndex == 1 ? 
          InkWell(
            child: Container(
              margin: EdgeInsets.only(right: ScreenAdapter.setWidth(40)),
              child: Row(
                children: <Widget>[
                  Text(
                    '${splice(selectProvider.nowTime)}',
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
            onTap: (){
              DatePicker.showDatePicker(
                context,
                locale:DateTimePickerLocale.zh_cn,
                minDateTime:DateTime.now(),
                initialDateTime:DateTime.now(),
                maxDateTime: DateTime.now()
                                      .add(new Duration(days: 7)),
                onConfirm: (val, List<int> index) {
                  if (val == null) {
                    return null;
                  }
                   var _birthday = val
                        .toString()
                        .substring(0, 10);
                  selectProvider.setNowTime(_birthday);
                  selectProvider.getMathData(context, page:1, size:10);
                  // widget.type == 0 ? 
                  // selectProvider.getMathData(context, 'getFootBallMatch', page:1, size:10) 
                  // :
                  // selectProvider.getMathData(context, 'getBasketBallMatch', page:1, size:10);
                },
              );
            },
          )
          :
          Container(
            margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
            child: Text('19-20',style: TextStyle(fontSize: ScreenAdapter.size(30)),),
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
                            color: selectProvider.barIndex == item['code']
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          item['title'],
                          style: TextStyle(
                              fontSize: ScreenAdapter.size(25),
                              color: selectProvider.barIndex == item['code']
                                  ? Color(0xff333333)
                                  : Colors.white),
                        ),
                      ),
                      onTap: () {
                        // setState(() {
                        //   highlight = item['code'];
                        // });
                        selectProvider.setBarIndex(item['code']);
                        selectProvider.getMathData(context, page:1, size:10);
                        // widget.type == 0 ? 
                        // selectProvider.getMathData(context, 'getFootTeamRank') 
                        // :
                        // selectProvider.getMathData(context, 'getBasketTeamRank');
                      },
                    ));
              }).toList()),
            ),
          )
        ],
      ),
    );
  }
  splice(time){
    return time.toString().substring(5);
  }
}
