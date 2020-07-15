

import 'dart:convert';

import 'package:firetiger/http/api.dart';
import 'package:flutter/material.dart';

class AnchorRankProvider with ChangeNotifier {

  var api = Api();

  List<Map> _rankData;
  int _type;
  int _dateType;

  AnchorRankProvider(){
    _rankData = [];
    _type = 1;
    _dateType = 1;
  }

  List<Map> get rankData => _rankData;
  int get type => _type;
  int get dateType => _dateType;

  setType(v){
    this._type = v;
    notifyListeners();
  }

  setDateType(v){
    this._dateType = v;
    notifyListeners();
  }

  getRankData(context, uid){
    print({'type':this._type, 'uid':uid, 'dateType':this._dateType});
    api.getData(context, 'getRank', formData: {'type':this._type, 'uid':uid, 'dateType':this._dateType}).then((response){
      var v = json.decode(response.toString());
      var arr = v['data']['info'];
      for(var i = 0; i < arr.length; i++){
        arr[i]['pm'] = i + 1;
      }
      print(arr);
      _rankData = (arr as List).cast();
    });
    notifyListeners();
  }
  
}