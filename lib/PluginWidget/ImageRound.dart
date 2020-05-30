import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageRoud extends StatelessWidget {

  final String _url;
  final double _width;
  ImageRoud(this._url, this._width);

  @override
  Widget build(BuildContext context) {
    return Container(
              // width: 30, // 自适应占满全部
              width: _width,
              child: AspectRatio(
                  aspectRatio:1/1, // 图片宽高比 1/1
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:_url,
                      fit: BoxFit.cover,
                    ),
                  )));
  }
}