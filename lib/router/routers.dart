
import 'package:firetiger/component/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firetiger/page/BottomBar.dart';

import 'package:firetiger/component/user/register.dart';
import 'package:firetiger/component/user/login.dart';
import 'package:firetiger/component/user/PasswordLogin.dart';
import 'package:firetiger/component/user/RetrievePassword.dart';


final routers = {
  '/':(context) => BottomBarPage(),
  '/login':(context) => LoginPage(),
  '/passwordlogin':(context) => PasswordLoginPage(),
  '/register':(context) => RegisterPage(),
  '/retrieve':(context) => RetrievePage(),
  '/search':(context) => SearchPage()
};

final onGenerateRoute = (RouteSettings settings){
  final String router_url = settings.name;
  final Function router_fn = routers[router_url];

  if(router_fn != null && settings.arguments != null){
      final router = MaterialPageRoute(
        builder: (context) => router_fn(context, arguments:settings.arguments)
      );
      return router;
  }else{
      final router = MaterialPageRoute(
        builder: (context) => router_fn(context)
      );
      return router;
  }

};