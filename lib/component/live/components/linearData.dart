import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:percent_indicator/percent_indicator.dart';

class LinearData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Container(
            margin: EdgeInsets.only(bottom:20 * rpx),
            padding: EdgeInsets.symmetric(horizontal:20 * rpx),
            child: Row(
              children: <Widget>[
                Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/jg.png', fit:BoxFit.contain),
                            SizedBox(height:10 * rpx),
                            Text('5', style: TextStyle(fontSize: 30 * rpx, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/yellowP.png', fit:BoxFit.contain),
                            SizedBox(height:10 * rpx),
                            Text('5', style: TextStyle(fontSize: 30 * rpx, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/redP.png', fit:BoxFit.contain),
                            SizedBox(height:10 * rpx),
                            Text('0', style: TextStyle(fontSize: 30 * rpx, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: <Widget>[
                      Container(
                        child: Text('进攻', style: TextStyle(fontSize: 25 * rpx, color: Color(0xffA4A4A4)),),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text('153', style: TextStyle(fontSize: 30 * rpx, fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20 * rpx),
                              child: LinearPercentIndicator(
                                width: 150 * rpx,
                                padding: EdgeInsets.all(0),
                                animation: true,
                                lineHeight: 10.0 * rpx,
                                animationDuration: 2000,
                                percent: 0.8,
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Color(0xff0074FF),
                              ),
                            ),
                            Container(
                              child: Text('101', style: TextStyle(fontSize: 30 * rpx, fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Text('危险进攻', style: TextStyle(fontSize: 25 * rpx, color: Color(0xffA4A4A4)),),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text('18', style: TextStyle(fontSize: 30 * rpx, fontWeight: FontWeight.bold),),
                            ),
                            Transform.rotate(
                              angle: math.pi / 1,
                              child: Padding(
                                padding: EdgeInsets.all(20 * rpx),
                                child: LinearPercentIndicator(
                                  width: 150 * rpx,
                                  padding: EdgeInsets.all(0),
                                  animation: true,
                                  lineHeight: 10.0 * rpx,
                                  animationDuration: 2000,
                                  percent: 0.6,
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Color(0xffFFAC3A),
                                ),
                              ),
                            ),
                            
                            Container(
                              child: Text('44', style: TextStyle(fontSize: 30 * rpx, fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/redP.png', fit:BoxFit.contain),
                            SizedBox(height:10 * rpx),
                            Text('0', style: TextStyle(fontSize: 30 * rpx, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/yellowP.png', fit:BoxFit.contain),
                            SizedBox(height:10 * rpx),
                            Text('5', style: TextStyle(fontSize: 30 * rpx, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/jg.png', fit:BoxFit.contain),
                            SizedBox(height:10 * rpx),
                            Text('5', style: TextStyle(fontSize: 30 * rpx, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}