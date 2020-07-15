

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class Utils {

  static final ImagePicker _picker = ImagePicker();

  // 判断手机号
  static bool isChinaPhoneLegal(String str) {
    return new RegExp(
            '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
        .hasMatch(str);
  }

  // 时间戳转换成日期格式
  static  timeStamp(int time) {
      var newtime = DateTime.fromMillisecondsSinceEpoch(time * 1000).toString().split(' ');
      
      return newtime[0];
  }
  // 指定日期转时间戳
  static int currentTimeMillis(y, t, s, f, m) {
    var now = new DateTime.now();
    var n = now.year;
    var d =new DateTime(n, y, t, s, f, m);
    return d.millisecondsSinceEpoch;
  }

    // 时间戳转换成日期时间格式
  static  datetimeStamp( time) {
      var newtime = DateTime.fromMillisecondsSinceEpoch(int.parse(time) *  1000).toString().split(' ');
      var newtime1 = newtime[1].substring(0, 5);
      var sec = '${newtime[0]}  $newtime1';
      return sec;
  }
  

  // 计算时间差
  static handleDate(String oldTime) {
    String nowTime = new DateTime.now().toString().split('.')[0];
    int nowyear = int.parse(nowTime.split(" ")[0].split('-')[0]);
    int nowmonth = int.parse(nowTime.split(" ")[0].split('-')[1]);
    int nowday = int.parse(nowTime.split(" ")[0].split('-')[2]);
    int nowhour = int.parse(nowTime.split(" ")[1].split(':')[0]);
    int nowmin = int.parse(nowTime.split(" ")[1].split(':')[1]);
    
    int oldyear = int.parse(oldTime.split(" ")[0].split('-')[0]);
    int oldmonth = int.parse(oldTime.split(" ")[0].split('-')[1]);
    int oldday = int.parse(oldTime.split(" ")[0].split('-')[2]);
    int oldhour = int.parse(oldTime.split(" ")[1].split(':')[0]);
    int oldmin = int.parse(oldTime.split(" ")[1].split(':')[1]);

    var now = new DateTime(nowyear, nowmonth, nowday, nowhour, nowmin);
    var old = new DateTime(oldyear, oldmonth, oldday, oldhour, oldmin);
    var difference = now.difference(old);
    
    if(difference.inDays > 1) {
      return (difference.inDays).toString() + '天前';
    } else if(difference.inDays == 1) {
      return '昨天'.toString();
    } else if(difference.inHours >= 1 && difference.inHours < 24) {
      return (difference.inHours).toString() + '小时前';
    } else if(difference.inMinutes > 5 && difference.inMinutes < 60) {
      return (difference.inMinutes).toString() + '分钟前';
    } else if(difference.inMinutes <= 5) {
      return '刚刚';
    }
    // 返回具体时间
    // else if(difference.inDays > 3){
    //   return oldTime.toString();
    // }
  }


  // 判断密码 数字 字符组合 6 -20 位
  static bool isLoginPassword(String input) {
    RegExp mobile = new RegExp(r"(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$");
    return mobile.hasMatch(input);
  }

    /*裁剪图片 https://pub.dev/packages/image_cropper#-readme-tab-*/
  static Future cropImage(context, file, isForm) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: file,
      cropStyle:isForm ? CropStyle.rectangle : CropStyle.circle,
      aspectRatio: CropAspectRatio(ratioX: 8, ratioY: 8),
      compressQuality:0,
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: '图片裁剪',
          toolbarColor: Colors.white,
          toolbarWidgetColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.original,
          hideBottomControls:true,
          
          lockAspectRatio: false),
    );
    if (croppedFile != null) {
      print(croppedFile);
      return croppedFile;
    }
  }

    /*拍照*/
  static takePhoto() async {
    try{
      var image = await _picker.getImage(source: ImageSource.camera);
      return image;
    }catch(e){
      print('拍照出现错误:'+e);
    }

  }

  /*相册*/
  static openGallery() async {
    try{
      var image = await _picker.getImage(source: ImageSource.gallery);
      return image;
    }catch(e){
      print('照片选择出现错误:'+e);
    }
  }

   /*选取视频*/
  static getVideo() async {
    final PickedFile file = await _picker.getVideo(
          source: ImageSource.gallery, maxDuration: const Duration(seconds: 10));
          
    return file;
  }

  /*拍摄视频*/
  static takeVideo() async {
    var video = await _picker.getVideo(source: ImageSource.camera);
    // print('拍摄视频：' + image.toString());
    return video;
  }


    // 判断显示等级
  static ImageProvider panImage(n){
    if(n<11){
      return AssetImage('assets/images/tag1.png');
    }else if(10<n && n<31){
      return AssetImage('assets/images/tag2.png');
    }else if(30<n && n<51){
      return AssetImage('assets/images/tag3.png');
    }else if(50<n && n<71){
      return AssetImage('assets/images/tag4.png');
    }else if(70<n && n<101){
      return AssetImage('assets/images/tag5.png');
    }else{
      return AssetImage('assets/images/tag5.png');
    }
  }

}