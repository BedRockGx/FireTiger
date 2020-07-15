import 'package:fijkplayer/fijkplayer.dart';
import 'package:firetiger/customFlutter/customVideo.dart';
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

static const FijkFit cover = FijkFit(
    sizeFactor: -0.5,
    aspectRatio: 1,
    alignment: Alignment.center,
);
  

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1/1,
      child: Container(
        // width: MediaQuery.of(context).size.width,                                   // 为避免布局UI混乱采用自动获取
        // height: MediaQuery.of(context).size.width*0.5625,
        child: Center(
          child:FijkView(
              player: widget.player,
              panelBuilder: fijkPanel3Builder(),    //snapShot: true :开启截图
              fsFit: cover,
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
