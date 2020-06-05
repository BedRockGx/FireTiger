

import 'dart:io';

import 'package:firetiger/PluginWidget/GreyDivider.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:firetiger/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';

class PostVideo extends StatefulWidget {
  @override
  _PostVideoState createState() => _PostVideoState();
}

class _PostVideoState extends State<PostVideo> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _detailsController = TextEditingController();

  var _classText = '请选择分类';                        // 选择器
  var temporaryClass = '';                             // 分类选择临时存储
  int titleFlex = 3;
  var _videoCoverUrl = false;
  final FijkPlayer player = FijkPlayer();          // 播放器
  bool _isClickBtn = false;

  List<String> classData = ['高尔夫', '网球', '足球', '篮球', '电竞'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _detailsController.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('发布视频', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xffFAFAFA),
        brightness: Brightness.light,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            IconData(0xe654, fontFamily: 'myIcon'),
            size: ScreenAdapter.size(60),
            color: Color(0xff333333),
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        )),
      body: ListView(
        children: <Widget>[
          videoSelect(),
          GreyDivider(),
          detailsInput()
        ],
      ),
    );
  }


  Widget videoSelect(){
    return Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
            child: Column(
              children: <Widget>[
                InkWell(
                  child: Container(
                    width: double.infinity,
                    height: ScreenAdapter.setHeight(400),
                    margin: EdgeInsets.only(top:ScreenAdapter.setHeight(15), bottom:ScreenAdapter.setHeight(20)),
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width:ScreenAdapter.setWidth(3), color:Color(0xffB8B8B8))
                    ),
                    child: !_videoCoverUrl ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(IconData(0xe676, fontFamily: 'myIcon'), color: Color(0xffD9D9D9), size: ScreenAdapter.size(120),),
                        SizedBox(height: ScreenAdapter.setHeight(20),),
                        Text('点击上传视频', style: TextStyle( color: Color(0xffD9D9D9), fontSize: ScreenAdapter.size(30)),)
                      ],
                    ):
                    AbsorbPointer(
                      child:FijkView(
                        player: player,
                        fit:FijkFit.cover
                      ),
                    )
                    // Image.file(File(_videoCoverUrl.path)),
                  ),
                  onTap:  () async {
                    player.reset();
                    var videoUrl = await Utils.getVideo();
                    print('数据返回');
                    await player.setDataSource(videoUrl.path, autoPlay: false, showCover:true);
                    setState(() {
                      _videoCoverUrl = true;
                    });
                  } 
                ),
                
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: titleFlex,
                      child: Text('标题', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          hintText: '请输入标题',
                          hintStyle: TextStyle(color:Color(0xffA4A4A4), fontSize: ScreenAdapter.size(30)),
                          border: InputBorder.none,
                          // prefixText:'我是填充'
                        ),
                        onChanged: (v){
                          print(v.length);
                          if(v.length > 5){
                            titleFlex = 1;
                          }else{
                            titleFlex = 3;
                          }
                          setState(() {});
                        },
                        
                      ),
                    )
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text('分类', style: TextStyle(fontSize: ScreenAdapter.size(30))),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right:ScreenAdapter.setWidth(15)),
                          child: Text('$_classText', style: TextStyle(color:Color(0xffA4A4A4), fontSize: ScreenAdapter.size(30)),),
                        ),
                        onTap: showBottom,
                      )
                    )
                  ],
                ),
              ],
            ),
          );
  }

  Widget detailsInput(){
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _detailsController,
            maxLength: 140,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: '请输入视频介绍',
              border: InputBorder.none
            ),
            onChanged: (v){
              if(v.length > 0){
                _isClickBtn = true;
              }else{
                _isClickBtn = false;
              }
              setState(() {
                
              });
            },
          ),
          Container(
            width: ScreenAdapter.setWidth(400),
            margin: EdgeInsets.only(top:ScreenAdapter.setHeight(100)),
            child: RaisedButton(
              child: Text('确认发布', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
              textColor: Colors.white,
              highlightColor:!_isClickBtn ? Color(0xffDFDFDF) : Theme.of(context).primaryColor,
              color:!_isClickBtn ? Color(0xffDFDFDF) : Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              elevation: 0,
              onPressed: () {
                
              },
            ),
          )
        ],
      ),
    );
  }

  showBottom(){
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 10,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: ScreenAdapter.setHeight(500),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  border:Border(
                    bottom: BorderSide(
                      width: ScreenAdapter.setHeight(1),
                      color: Color(0xffE5E5E5)
                    )
                  )
                ),
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10), horizontal:ScreenAdapter.setWidth(30)),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Text('确定', style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(25)),),
                  ),
                  onTap: (){
                    var valText;
                    
                    temporaryClass == '' ?  valText = classData[0] : valText = temporaryClass;
                    
                    setState(() {
                      _classText = valText;
                    });
                    Navigator.pop(context);
                  },
                )
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: ScreenAdapter.setHeight(400)
                ),
                child: CupertinoPicker(
                  itemExtent: ScreenAdapter.setHeight(70),
                  diameterRatio: 1,
                  backgroundColor: Colors.white,
                  onSelectedItemChanged: (index){
                    print('选中下标:${classData[index]}');
                    setState(() {
                      temporaryClass = classData[index];
                    });
                  },
                  children: classData.map((item){
                    return Center(
                      child: Text(item),
                    );
                  }).toList()
                )
              )
            ],
          ),
        );
      });
  }

}