
import 'package:firetiger/component/search/search.dart';
import 'package:firetiger/component/userCenter/AnchorRelated.dart';
import 'package:firetiger/component/userCenter/Pay.dart';
import 'package:firetiger/component/userCenter/gradeDetails.dart';
import 'package:firetiger/component/userCenter/modifyUser.dart';
import 'package:firetiger/component/userCenter/myAccount.dart';
import 'package:firetiger/component/userCenter/myGrade.dart';
import 'package:firetiger/component/userCenter/myGuessingCompetition.dart';
import 'package:firetiger/component/userCenter/myMessage.dart';
import 'package:firetiger/component/userCenter/myVideo.dart';
import 'package:firetiger/component/userCenter/postVideo.dart';
import 'package:firetiger/component/userCenter/settings.dart';
import 'package:firetiger/component/userCenter/userCenterPage.dart';
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
  '/search':(context) => SearchPage(),
  '/userCenter':(context) => UserCenterPage(),
  '/myMessage':(context) => MyMessage(),
  '/myGrade':(context) => MyGrade(),
  '/pay':(context) => PayPage(),
  '/myAccount':(context) => MyAccount(),
  '/myGuessingCompetition':(context) => MyGuessingCompetition(),
  '/settings':(context) => SettingsPage(),
  '/modifyInfo':(context, {arguments}) => ModifyUserInfo(arguments),
  '/myVideo':(context) => MyVideo(),
  '/anchorRelated':(context) => AnchorRelated(),
  '/gradeDetails':(context) => GradeDetails(),
  '/postVideo':(context) => PostVideo(),
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