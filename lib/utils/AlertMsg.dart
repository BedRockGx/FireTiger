
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';


class AlertMsg {
  static alertDialog(context, text, confirmText, cancelText, confirmFn){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          content: Text('$text', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(30))),
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
                child: Text('$cancelText', style: TextStyle(color: Theme.of(context).primaryColor),),
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
                child: Text('$confirmText', style: TextStyle(color: Colors.white),),
                onPressed:confirmFn
              ),
            )
          ],
        );
      }
    );
  }
}