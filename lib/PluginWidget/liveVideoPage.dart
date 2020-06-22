import 'package:fijkplayer/fijkplayer.dart';
import 'package:firetiger/Bus/videoUi.dart';
import 'package:firetiger/customFlutter/customLiveVideo.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'custom_ui.dart';

class VideoScreen extends StatefulWidget {
  final FijkPlayer player;

  VideoScreen({@required this.player});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,                                   // 为避免布局UI混乱采用自动获取
        // height: MediaQuery.of(context).size.width*0.5625,
        child: Center(
          child:FijkView(
              player: widget.player,
              panelBuilder: fijkPanel3Builder(title: '我是直播标题'),    //snapShot: true :开启截图
              fsFit: FijkFit.fill,
              // panelBuilder: simplestUI,
              // panelBuilder: (FijkPlayer player, BuildContext context,
              //     Size viewSize, Rect texturePos) {
              //   return CustomFijkPanel(
              //       player: player,
              //       buildContext: context,
              //       viewSize: viewSize,
              //       texturePos: texturePos);
              // },
            ),
          
        ),
      ),
    );
  }

    @override
  void dispose() {
    widget.player.release();
    super.dispose();
  }
}
