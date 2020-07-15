import 'dart:convert';

import 'Storage.dart';

class PublicStorage {
  /*
    1.获取本地存储里面的数据
    2.判断本地存储是否有数据
    3.判断是不是搜索存储

      2.1 如果有数据
        1、读取本地存储的数据
        2、判断本地存储中有没有当前的数据,
            如果有，不做操作
            如果没有当前数据，本地存储的数据和当前数据拼接后重新写入
      2.2、 如果没有数据
          直接把当前数据放在数组中写入到本地存储
   */

   static setHistoryList(key, value, {isSearch}) async {
    try{
      // 首先获取一下判断有没有数据
      var searchListData = json.decode(await Storage.getString(key));

    // 如果本地存储有值，判断是否有这个值
       var hasData = searchListData.any((v){
          // 如果有就返回true，如果没有返回false
          return v == value;
        });
      
      // 本地存储判断
      if(!hasData){
        if(isSearch){
          searchListData.add(value);        // 搜索存储便增加
        }else{
          searchListData[0] = value;        // 普通存储替换
        }
        await Storage.setString(key, json.encode(searchListData));
      }
    }catch(e){
      // 没有数据
      List tempList = new List();
      tempList.add(value);
      // json.encode:数组转为字符串
      await Storage.setString(key, json.encode(tempList));
    }
  }

  static getHistoryList(key) async {
    try{
      List searchListData = json.decode(await Storage.getString(key));
      return searchListData;
    }catch(e){
      return [];
    }
  }

  // 清空全部
  static clearHistoryList() async {
    
      await Storage.clear();
     
  }

  // 搜索记录 替换
  static replaceListHistoryData(key, value) async {

      // 首先获取
      // 删除掉指定的值，
      // 再次存储进去新的值
      List searchListData = json.decode(await Storage.getString(key));
      
      searchListData.remove(value);
      // print(searchListData);
      await Storage.setString(key, json.encode(searchListData));
     
  }

  // 删除指定key
  static removeHistoryData(key) async {
    Storage.remove(key);
  }

}
