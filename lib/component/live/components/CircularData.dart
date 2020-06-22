import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Container(
            margin: EdgeInsets.all(30 * rpx),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex:1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text('5', style: TextStyle(fontSize:35 * rpx),),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal:10 * rpx),
                          child: CircularPercentIndicator(
                            radius: 120 * rpx,
                            lineWidth: 10 * rpx,
                            animation: true,
                            percent: 0.7,
                            animateFromLastPercent: true,
                            center: Text(
                              "射正",
                              style: TextStyle( fontSize: 30 * rpx),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Color(0xffFFAC3A),
                          ),
                        ),
                        Container(
                          child: Text('8', style: TextStyle(fontSize:35 * rpx),),
                        ),
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text('8', style: TextStyle(fontSize:35 * rpx),),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal:10 * rpx),
                          child: CircularPercentIndicator(
                            radius: 120 * rpx,
                            lineWidth: 10 * rpx,
                            animation: true,
                            percent: 0.6,
                            animateFromLastPercent: true,
                            center: Text(
                              "射偏",
                              style: TextStyle( fontSize: 30 * rpx),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Color(0xff0074FF),
                          ),
                        ),
                        Container(
                          child: Text('6', style: TextStyle(fontSize:35 * rpx),),
                        ),
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text('56', style: TextStyle(fontSize:35 * rpx),),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal:10 * rpx),
                          child: CircularPercentIndicator(
                            radius: 120 * rpx,
                            lineWidth: 10 * rpx,
                            animation: true,
                            percent: 0.3,
                            reverse: true,
                            animateFromLastPercent: true,
                            center: Text(
                              "控球",
                              style: TextStyle( fontSize: 30 * rpx),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Color(0xff0074FF),
                          ),
                        ),
                        Container(
                          child: Text('44', style: TextStyle(fontSize:35 * rpx),),
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
          );
  }
}