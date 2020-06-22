

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Utils {

  static final ImagePicker _picker = ImagePicker();

  // 判断手机号
  static bool isChinaPhoneLegal(String str) {
    return new RegExp(
            '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
        .hasMatch(str);
  }

  // 判断密码 数字 字符组合 6 -20 位
  static bool isLoginPassword(String input) {
    RegExp mobile = new RegExp(r"(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$");
    return mobile.hasMatch(input);
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