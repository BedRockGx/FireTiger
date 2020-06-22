
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';


class Alert {
  static alertDialog(context, price){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          content: Text('确认支付$price火虎币？', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(30))),
          backgroundColor: Colors.white,
          elevation: 24,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actions: <Widget>[
            Container(
              width: ScreenAdapter.setWidth(200),
              child:OutlineButton(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
                highlightedBorderColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Text('取消', style: TextStyle(color: Theme.of(context).primaryColor),),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              width:ScreenAdapter.setWidth(10)
            ),
            Container(
              width: ScreenAdapter.setWidth(200),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                highlightColor:Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Text('确认', style: TextStyle(color: Colors.white),),
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/shoppingOver');
                },
              ),
            )
          ],
        );
      }
    );
  }
}