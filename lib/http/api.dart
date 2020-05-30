import 'dart:convert';

import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './api_url.dart';

class Api{
  Dio dio = new Dio();



  Future getData(context, url, {formData}) async {
    try{
      Response response;
      if(url != 'getUserCode'){
        dio.options.headers['Authorization'] = await PublicStorage.getHistoryList('token');
      }
      
      // dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded")    // 设置数据返回格式    
      if(formData == null){
        response = await dio.get(path[url]);
      }else{
        response = await dio.get(path[url], queryParameters:formData);
      }
    
      // print('----------------------返回Token---------------------------');
      // print( response.headers.value('authorization'));
       /*
        如果请求200,，并且返回了新的token，那么就替换掉
       */
      if(response.statusCode == 200 && response.headers.value('authorization') != null){
        await PublicStorage.setHistoryList('token', response.headers.value('authorization'));
      }
      
      return response;
    }on DioError catch(e){
      print('get错误：$e');
      // if(e == null){
      //   return null;
      // }
      // var msg = json.decode(e.response.toString());
      // if(e.response.statusCode == 401){
      //   Navigator.pushNamed(context, '/login');
      //   return null;
      // }
      // if(e.response.statusCode == 412){
      //   return null;
      // }
      
      // print(msg);
      // Fluttertoast.showToast(msg: msg['msg'],gravity:ToastGravity.CENTER, backgroundColor: Colors.black, textColor: Colors.white);
      
    }
  }

 // 统一Post请求
  Future postData(context, url, {formData}) async {
    try{
      Response response;
      // 登录不需要设置请求头
      if(url != 'login'){
        dio.options.headers['Authorization'] = await PublicStorage.getHistoryList('token');
      }
      
      if(formData == null){
        response = await dio.post(path[url]);
      }else{
        response = await dio.post(path[url], data:formData);
      }
      /*
        如果请求200,，并且返回了新的token，那么就替换掉
       */
      if(response.statusCode == 200 && response.headers.value('authorization') != null){
        await PublicStorage.setHistoryList('token', response.headers.value('authorization'));
      }

      return response;
    }on DioError catch(e){
      print('post错误：$e');
      // if (e.response != null) {
      //   if(e.response.statusCode == 401){
      //     // Navigator.pushNamed(context, '/login');
      //   }
      //   var msg = json.decode(e.response.toString());
      //   // Fluttertoast.showToast(msg: msg['msg'],gravity:ToastGravity.CENTER, backgroundColor: Colors.black, textColor: Colors.white);
        
      // } else {
      //   // Something happened in setting up or sending the request that triggered an Error
      //   print(e.request);
      //   print(e.message);
      // }
    }
  }
}