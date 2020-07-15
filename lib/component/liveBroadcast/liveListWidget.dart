import 'dart:convert';

import 'package:firetiger/PluginWidget/HomeVideoList.dart';
import 'package:firetiger/http/api.dart';
import 'package:flutter/material.dart';

class LiveListWidget extends StatefulWidget {
  var type;
  LiveListWidget(this.type);
  @override
  _LiveListWidgetState createState() => _LiveListWidgetState();
}

class _LiveListWidgetState extends State<LiveListWidget> {

  List<Map> liveList = [];

  var api = Api();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData(){
    api.getData(context, 'getLiveList', formData: {'type':widget.type, 'page':1, 'size':15}).then((val){
      var res = json.decode(val.toString());
      if(res['data']['info'].isEmpty){
        return;
      }
      setState(() {
        liveList = (res['data']['info']['liveList'] as List).cast();
      });
      print(liveList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        liveList.isEmpty ? Center(child: Text('还没有数据哦~'),) : HomeVideoList(videoData:liveList, specific:true)
      ],
    );
  }
}