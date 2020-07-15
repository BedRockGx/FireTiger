import 'package:firetiger/component/Match/selectBarData/rank/rank.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class IntergralDetails extends StatefulWidget {
  @override
  _IntergralDetailsState createState() => _IntergralDetailsState();
}

class _IntergralDetailsState extends State<IntergralDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('韩K联', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
          backgroundColor: Color(0xffFAFAFA),
          brightness: Brightness.light,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              IconData(0xe654, fontFamily: 'myIcon'),
              size: ScreenAdapter.size(60),
              color: Color(0xff333333),
            ),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
      ),
      body: BarDataRank(),
    );
  }
}