import 'package:flutter/material.dart';

// 用户信息状态管理

class UserInfoProvider extends ChangeNotifier {
  var _userInfo;
  var _islogin;                                   // 是否登录;
  var _isAuthentication;                          // 是否认证过

  UserInfoProvider(){
    _userInfo = [];
    _islogin = false;
    _isAuthentication = false;
  }

  get userInfo => _userInfo;
  get islogin => _islogin;
  get isAuthentication => _isAuthentication;

  setUserInfo(i){
    this._userInfo = i;
    notifyListeners();
  }

  setIsLogin(v){
    this._islogin = v;
    notifyListeners();
  }

  setIsAuthentication(v){
    this._isAuthentication = v;
    notifyListeners();
  }

}