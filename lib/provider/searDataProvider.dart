import 'package:flutter/material.dart';

class SearchDataProvider with ChangeNotifier {
  var _searchData;
  List<Map> _anchorData;
  List<Map> _liveData;
  List<Map> _videoData;

  SearchDataProvider(){
    _anchorData = [];
    _liveData = [];
    _videoData = [];
  }

  get searchData => _searchData;
  List<Map> get anchorData => _anchorData;
  List<Map> get liveData => _liveData;
  List<Map> get videoData => _videoData;

  setSearchData(v){
    this._searchData = v;
    this._anchorData = (v['anchor']['list'] as List).cast();
    this._liveData = (v['live']['list'] as List).cast();
    this._videoData = (v['video']['list'] as List).cast();
    notifyListeners();
  }
}