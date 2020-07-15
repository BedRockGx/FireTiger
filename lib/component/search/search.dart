import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/component/search/searchTabBar.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/searDataProvider.dart';
import 'package:firetiger/utils/Behavior.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart'; // 提示

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // var _keywords = '';
  TextEditingController _keywords = TextEditingController();
  List _historyListData = [];
  List<Map> _hotListData = [];
  var isSearch = false;
  var searchData;

  var api =Api();

  // List data = ['lorem', 'loremasd', 'HelloWorld', '睡觉觉啊', '袭击我去呜呜呜', '上世纪'];

  @override
  void initState() {
    super.initState();
    this._getHistoryData();
    this._getHotSearch();
  }

  // 获取本地存储
  _getHistoryData() async {
    var _historyListData = await PublicStorage.getHistoryList('searchList');
    // print('获取本地存储${_historyListData}');
    setState(() {
      this._historyListData = _historyListData;
    });
  }

  // 获取热门搜索
  _getHotSearch(){
    api.getData(context, 'getHotSearch').then((val){
      var res = json.decode(val.toString());
      setState(() {
        _hotListData = (res['data']['info'] as List).cast();
      });
    });
  }

  Future _getSearchData() async {
    // print('触发搜索：${_keywords.text}');
    Response response;
    var formData = {'keyWord':_keywords.text};
    var uid = await PublicStorage.getHistoryList('uuid');
    var token = await PublicStorage.getHistoryList('token');
    if(uid.isNotEmpty){
      formData['uid'] = uid[0];
      formData['token'] = token[0];
    }
    print(formData);
    response = await api.getData(context, 'getSearchList', formData: formData);
    var v =  json.decode(response.toString());
    print(v);
    return v['data']['info'];
    // return [];
  }

  // 弹出框
  _alertDialog(keywords) async {
    var result = await showDialog(
        barrierDismissible: false, // 表示点击灰色背景的时候是否消失弹出框
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示信息'),
            content: Text('您确定要删除这条记录吗？'),
            actions: <Widget>[
              FlatButton(
                child: Text('取消', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                onPressed: () {
                  Navigator.pop(context, 'Cancle');
                },
              ),
              FlatButton(
                child: Text('确定', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                onPressed: () async {
                  await PublicStorage.replaceListHistoryData(
                      'searchList', keywords);
                  this._getHistoryData();
                  Navigator.pop(context, 'Ok');
                },
              )
            ],
          );
        });
  }

  // 确定删除
  _alertDeleteDialog() async {
    var result = await showDialog(
        barrierDismissible: false, // 表示点击灰色背景的时候是否消失弹出框
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示信息'),
            content: Text('您确定要删除全部记录吗？'),
            actions: <Widget>[
              FlatButton(
                child: Text('取消', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                onPressed: () {
                  Navigator.pop(context, 'Cancle');
                },
              ),
              FlatButton(
                child: Text('确定', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                onPressed: () async {
                  // 异步删除
                  PublicStorage.removeHistoryData('searchList');
                  _getHistoryData();
                  Navigator.pop(context, 'Ok');
                },
              )
            ],
          );
        });
  }

  // 是否展示搜索推荐
  Widget _isShowRecommend() {
    var searchDataProvider = Provider.of<SearchDataProvider>(context);
    // 如果没有数据，就返回推荐数组，如果有数据就返回数组当中查找到的
    // final suggestionList = _keywords.text.isEmpty
    //     ? recentSuggest
    //     : searchList
    //         .where((input) => input.startsWith(_keywords.text))
    //         .toList();
    if (!isSearch) {
      // 没有输入搜索内容
      return Padding(
          padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30), vertical: ScreenAdapter.setHeight(15)),
          child: ScrollConfiguration(
            behavior: OverScrollBehavior(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '最近搜索',
                        style: TextStyle(
                            fontSize: ScreenAdapter.size(30),
                            color: Color(0xff333333), 
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    IconButton(
                      icon: Icon(IconData(0xe653, fontFamily: 'myIcon'),
                          color: Color(0xffD3D3D3), size: ScreenAdapter.size(35)),
                      onPressed: () {
                        _alertDeleteDialog();
                      },
                    )
                  ],
                ),
                Wrap(
                  spacing: ScreenAdapter.setWidth(20), // 平行距离
                  children: _historyListData.map((value) {
                  return InkWell(
                    child: Container(
                      child: RawChip(
                        backgroundColor: Color(0xffEFEFEF),
                        padding: EdgeInsets.all(ScreenAdapter.setHeight(10)),
                        label: Text(value, style: TextStyle(fontSize: ScreenAdapter.size(30))),
                      )
                    ),
                    onLongPress: () {
                      this._alertDialog("${value}");
                    },
                    onTap: () {
                      // print(value);
                      setState(() {
                        _keywords.text = value;
                        isSearch = true;
                        searchMetod();
                      });

                      _getSearchData().then((v){
                        searchDataProvider.setSearchData(v);
                      });
                    },
                  );
                }).toList()),
                Container(
                  margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '热门搜索',
                          style: TextStyle(
                              fontSize: ScreenAdapter.size(30),
                              color: Color(0xff333333),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Wrap(
                  spacing: ScreenAdapter.setWidth(20), // 平行距离
                    children: _hotListData.map((value) {
                  return InkWell(
                    child: Container(
                      child: RawChip(
                        backgroundColor: int.parse(value['search_count']) > 500 ? Color(0xffFFEBEC) : Color(0xffEFEFEF),
                        padding: EdgeInsets.all(ScreenAdapter.setHeight(10)),
                        label: Text(value['keyword'], style: TextStyle(fontSize: ScreenAdapter.size(30), color:int.parse(value['search_count']) > 500 ? Color(0xffFF3641) : Color(0xff333333))),
                      )
                    ),
                    onLongPress: () {
                      this._alertDialog("${value}");
                    },
                    onTap: () {
                      // print(value);
                      setState(() {
                        _keywords.text = value['keyword'];
                        isSearch = true;
                        searchMetod();
                      });

                      _getSearchData().then((v){
                        searchDataProvider.setSearchData(v);
                      });
                    },
                  );
                }).toList()),
              ],
            ),
          ));
    } else {
      return SearchTabBar(data:searchData);
    }
  }

  @override
  Widget build(BuildContext context) {
     var searchDataProvider = Provider.of<SearchDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFAFAFA),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black45,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        brightness: Brightness.light,
        title: Container(
                child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                    child: Container(
                            height: ScreenAdapter.setHeight(70),
                            decoration: BoxDecoration(
                                color: Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.only(left: ScreenAdapter.setWidth(10)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center, // 上下居中
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: ScreenAdapter.setWidth(10)),
                                  child: Icon(
                                    Icons.search,
                                    size: ScreenAdapter.size(40),
                                    color: Color(0xffE5E5E5),
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: TextField(
                                      controller: _keywords,
                                      autofocus: false,
                                      // 去掉boder的默认边框
                                      style: TextStyle(fontSize: ScreenAdapter.size(30)),
                                      decoration: InputDecoration(
                                          // icon: Icon(Icons.search),
                                          border:
                                              OutlineInputBorder(borderSide: BorderSide.none),
                                          hintText: '请输入关键字',
                                          hintStyle: TextStyle(fontSize: ScreenAdapter.size(30), color:Color(0xffCECECE) ),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              0, 0, 0, ScreenAdapter.setHeight(30))),
                                      onChanged: (value) {
                                        if (value != '') {
                                          setState(() {
                                            isSearch = true;
                                          });
                                         _getSearchData().then((v){
                                           searchDataProvider.setSearchData(v);
                                         });
                                        } else {
                                          setState(() {
                                            isSearch = false;
                                          });
                                        }
                                      },
                                    ))
                              ],
                            ),
                          ),
                  ),
                  ),
                  SizedBox(
                    width: ScreenAdapter.setWidth(30),
                  ),
                  Container(
                      // height: ScreenAdapter.setHeight(60),
                      // width: ScreenAdapter.setWidth(80),
                      child: Row(
                        children: <Widget>[
                          isSearch ?  
                          InkWell(
                            child: Text(
                              '搜索',
                              style: TextStyle(fontSize: ScreenAdapter.size(30), color: Color(0xff666666))
                            ),
                            onTap: (){
                              searchMetod();
                              _getSearchData().then((v){
                                // print(v);
                                // searchDataProvider.setSearchData(v);
                              });
                            },
                          )
                          :
                          InkWell(
                            child: Text('取消', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Color(0xff666666))),
                            onTap: (){
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ), 
                ],
              ),
              ),
      ),
        body:_isShowRecommend()
        
         
    );
  }

  searchMetod() async {
    // var searchDataProvider = Provider.of<SearchDataProvider>(context);
    if (isSearch) {
      // 等待本地存储
      await PublicStorage.setHistoryList('searchList', this._keywords.text,
          isSearch: true);
      // 本地存储过后，在搜索页面再一次获取一遍数据
      await this._getHistoryData();

      var adcode = await PublicStorage.getHistoryList('LocationCityCode');
      var now = new DateTime.now();
      // Map arguments = {
      //   'keyword': this._keywords.text,
      //   'time': Plugins.stampTime(now),
      //   'pagesize': 8,
      //   'page': 1,
      //   'adcode': adcode[0]
      // };
      // print(arguments);
      // Navigator.pushNamed(context, '/register', arguments: arguments);
      
    } else {
      Fluttertoast.showToast(msg: '请输入内容');
    }
  }
}
