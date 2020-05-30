import 'package:flutter/material.dart';

class Follow extends StatefulWidget {
  @override
  _FollowState createState() => _FollowState();
}

class _FollowState extends State<Follow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('注册'),
            onPressed: (){
              Navigator.pushNamed(context, '/register');
            },
          ),
          RaisedButton(
            child: Text('找回密码'),
            onPressed: (){
              Navigator.pushNamed(context, '/retrieve');
            },
          ),
          RaisedButton(
            child: Text('登录'),
            onPressed: (){
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      )
    );
  }
}