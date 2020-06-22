import 'dart:io';

import 'package:firetiger/provider/matchBarProvider.dart';
import 'package:firetiger/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main(){

  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，
    // 是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    
  }


  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_)=>MatchBarProvider(),)
      ],
      child: MaterialApp(
        title: 'fireTiger',
        initialRoute: '/',
        theme: ThemeData(
          // platform: TargetPlatform.iOS,
          highlightColor: Color(0xffFFFFFF),
          splashColor: Color(0xffFFFFFF),
          primaryColor: Color(0xffFF3641)
        ),
        onGenerateRoute: onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
    
    
  }
}