import 'package:firetiger/PluginWidget/GreyDivider.dart';
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class UserCenterPage extends StatefulWidget {
  @override
  _UserCenterPageState createState() => _UserCenterPageState();
}

class _UserCenterPageState extends State<UserCenterPage> {
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;

    return Scaffold(
      body: MainPage(
        rpx: rpx,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.rpx});
  final double rpx;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  double extraPichHeight = 0; // 图片变化的高度
  double prevdy; // 初始点击位置
  BoxFit fitType; // 图片的适应方式
  Color _customappBarColor = Color(0xffFAFAFA); // 颜色
  bool _isLogin = false;                // 是否已登录
  bool _isShowDJ = true;               // 是否显示等级
  // Color clipColor = Color()

  AnimationController animationcontroller; // 动画控制器
  Animation<double> animation; // 动画

  @override
  void initState() {
    super.initState();
    prevdy = 0;
    fitType = BoxFit.fitWidth;
    animationcontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300)); // 动画时间
    animation =
        Tween(begin: 0.0, end: 0.0).animate(animationcontroller); // 效果绑定动画时间
  }

  // 手饰点击的时候执行
  updatePicHeight(changed) {
    // print('prevdy：$prevdy');
    // 如果初始点击位置为0，那么记录传入进来的点击的值
    // 如果之前没有点过，那么首次点击的位置就是手饰按下去的位置
    if (prevdy == 0) {
      prevdy = changed;
    }
    //计算图片应该变化的高度
    // 图片容器增长的高度 += 改变的高度坐标 - 鼠标上一个点的坐标（也就代表一直增长）
    extraPichHeight += changed - prevdy;
    // 如果下拉过了200后，就修改图片的适应格式
    if (extraPichHeight >= 50 * widget.rpx) {
      fitType = BoxFit.fitHeight;
    } else {
      fitType = BoxFit.fitWidth;
    }
    setState(() {
      prevdy = changed;
      extraPichHeight = extraPichHeight;
      fitType = fitType;
      _isShowDJ = false;
    });
  }

  // 手饰抬起的时候执行
  runAnimate() {
    if(extraPichHeight > -300 * widget.rpx){
      setState(() {
        _isShowDJ = true;
      });
    }
    setState(() {
      animation =
          Tween(begin: extraPichHeight, end: 0.0).animate(animationcontroller)
            ..addListener(() {
              if (extraPichHeight >= 50 * widget.rpx) {
                fitType = BoxFit.fitHeight;
              } else {
                fitType = BoxFit.fitWidth;
              }
              if (extraPichHeight < -300 * widget.rpx) {
                setState(() {
                  _customappBarColor = Colors.redAccent;
                });
                return;
              } else {
                setState(() {
                  extraPichHeight = animation.value;
                  fitType = fitType;
                  _customappBarColor = Color(0xffFAFAFA);
                });
              }
            });
      // 执行完回弹之后，初始点击变化值 再次初始化为0（保证移动-鼠标位置 = 增长的高度）
      //（避免保留着上一次的鼠标点击值，造成下一次点击的时候，移动的高度比点击的位置小）
      prevdy = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Listener(
        onPointerMove: (result) {
          updatePicHeight(result.position.dy);
        },
        onPointerUp: (_) {
          runAnimate();
          animationcontroller.forward(from: 0); //
        },
        child: _isLogin ? loginAppBar() : noLoginAppBar());
  }

  // 未登录状态下
  Widget noLoginAppBar() {
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.only(top: ScreenAdapter.setHeight(60)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: ScreenAdapter.setWidth(30)),
            alignment: Alignment.centerLeft,
            child: Icon(
              IconData(0xe654, fontFamily: 'myIcon'),
              size: ScreenAdapter.size(60),
              color: Color(0xff333333),
            ),
          ),
          Container(
            width: ScreenAdapter.setWidth(300),
            height: ScreenAdapter.setHeight(70),
            margin: EdgeInsets.symmetric(vertical: ScreenAdapter.setHeight(40)),
            child: RaisedButton(
              child: Text(
                '立即登录',
                style: TextStyle(fontSize: ScreenAdapter.size(30)),
              ),
              textColor: Colors.white,
              highlightColor:Theme.of(context).primaryColor,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              elevation: 0,
              onPressed: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: ScreenAdapter.setHeight(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    '你也可以使用设计账号登录 或 ',
                    style: TextStyle(
                        color: Color(0xffA4A4A4),
                        fontSize: ScreenAdapter.size(26)),
                  ),
                ),
                InkWell(
                  child: Container(
                    child: Text(
                      '账号密码登录',
                      style: TextStyle(
                          color: Color(0xffA4A4A4),
                          decoration: TextDecoration.underline,
                          fontSize: ScreenAdapter.size(26)),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/passwordlogin');
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: ScreenAdapter.setHeight(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  IconData(0xe64f, fontFamily: 'myIcon'),
                  color: Color(0xff00C785),
                  size: ScreenAdapter.size(70),
                ),
                SizedBox(
                  width: ScreenAdapter.setWidth(20),
                ),
                Icon(
                  IconData(0xe64e, fontFamily: 'myIcon'),
                  color: Color(0xff30A5DD),
                  size: ScreenAdapter.size(70),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: ScreenAdapter.setHeight(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    '登录即代表同意 ',
                    style: TextStyle(
                        color: Color(0xffA4A4A4),
                        fontSize: ScreenAdapter.size(23)),
                  ),
                ),
                InkWell(
                  child: Container(
                    child: Text(
                      '隐私政策',
                      style: TextStyle(
                          color: Color(0xffA4A4A4),
                          decoration: TextDecoration.underline,
                          fontSize: ScreenAdapter.size(23)),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/passwordlogin');
                  },
                ),
              ],
            ),
          ),
          GreyDivider(),
          ActionBar(),
          GreyDivider(),
          ActionList()
        ],
      ),
    ));
  }

  // 已登录的AppBar
  Widget loginAppBar() {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              leading: Text(''),
              brightness: _isLogin ? Brightness.dark : Brightness.light,
              backgroundColor: _customappBarColor,
              pinned: true,
              floating: true,
              expandedHeight: ScreenAdapter.setHeight(380) + extraPichHeight,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: <Widget>[
                    ClipPath(
                  clipper: BottomClipper(),
                  child: Container(
                      child: Stack(
                        children: <Widget>[
                      SliverTopBar(
                          extraPicHeight: extraPichHeight,
                          fitType: fitType,
                          customColor: _customappBarColor),
                      Positioned(
                        top: ScreenAdapter.setHeight(90),
                        width: ScreenAdapter.setWidth(750),
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ImageRoud(
                                  'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3256100974,305075936&fm=26&gp=0.jpg',
                                  70),
                              Container(
                                width: ScreenAdapter.setWidth(400),
                                margin: EdgeInsets.symmetric(
                                    vertical: ScreenAdapter.setHeight(20)),
                                child: Text(
                                  'UziGodV的颜值粉',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenAdapter.size(30)),
                                ),
                              ),
                              Container(
                                width: ScreenAdapter.setWidth(400),
                                margin: EdgeInsets.symmetric(
                                    vertical: ScreenAdapter.setHeight(5)),
                                child: Text(
                                  'RNG电子竞技超话主持人',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: ScreenAdapter.size(23)),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: ScreenAdapter.setHeight(20)),
                                  width: ScreenAdapter.setWidth(150),
                                  height: ScreenAdapter.setHeight(15),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  padding:
                                      EdgeInsets.all(ScreenAdapter.setWidth(5)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: LinearProgressIndicator(
                                      value: 0.75,
                                      backgroundColor: Colors.white,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.red),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
                  ],
                )
                
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: ScreenAdapter.setHeight(20)),
                child: Column(
                  children: <Widget>[ActionBar(), ActionList()],
                ),
              ),
            ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate((context, index){
            //     return Container(height: 30, child:Text('内容'),);
            //   }, childCount: 3)
            // )
          ],
        ),
        _isShowDJ ? Positioned(
              top: ScreenAdapter.setHeight(340),
              width: ScreenAdapter.setWidth(750),
              height: ScreenAdapter.setHeight(130),
              child: Container(
                // width: ScreenAdapter.setWidth(300),
                height: ScreenAdapter.setHeight(130),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/banner.png')
                  )
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(bottom:ScreenAdapter.setHeight(30)),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(IconData(0xe661, fontFamily: 'myIcon'),size: ScreenAdapter.size(25), color: Color(0xffFF3641),),
                      SizedBox(width: ScreenAdapter.setWidth(10),),
                      Text('120', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffFF3641), fontWeight: FontWeight.bold))
                    ],
                  )
                
                )
              ),
            )
            :Text('')
      ],
    );
  }
}

// 操作界面
class ActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.setWidth(30)),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: InkWell(
                child: Column(
                children: <Widget>[
                  Container(
                    width: ScreenAdapter.setWidth(70),
                    height: ScreenAdapter.setHeight(60),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 7,
                          child: Container(
                            child: Image.asset('assets/images/xx.png'),
                            margin: EdgeInsets.only(
                                bottom: ScreenAdapter.setHeight(10)),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            width: ScreenAdapter.setWidth(40),
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  color: Theme.of(context).primaryColor,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '99',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenAdapter.size(23)),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Text(
                    '我的消息',
                    style: TextStyle(fontSize: ScreenAdapter.size(25)),
                  )
                ],
              ),
                onTap: (){
                  Navigator.pushNamed(context, '/myMessage');
                },
              ),
              
            ),
          
          bar('assets/images/dj.png', '我的等级', (){
            Navigator.pushNamed(context, '/myGrade');
          }),
          bar('assets/images/lw.png', '火花充值', (){
            Navigator.pushNamed(context, '/pay');
          }),
          bar('assets/images/wd.png', '主播信息', (){
            Navigator.pushNamed(context, '/anchorRelated');
          }),
        ],
      ),
    );
  }

  Widget bar(img, title, fn) {
    return Expanded(
      flex: 1,
      child: InkWell(
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenAdapter.setHeight(60),
              padding: EdgeInsets.only(top: 7),
              child: Image.asset(img),
              margin: EdgeInsets.only(bottom: ScreenAdapter.setHeight(10)),
            ),
            Text(
              title,
              style: TextStyle(fontSize: ScreenAdapter.size(25)),
            )
          ],
        ),
        onTap: fn,
      )
    );
  }
}

class ActionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.setWidth(30)),
      child: Column(
        children: <Widget>[
          mylistTile('我的关注', () {

          }, 'assets/images/gz.png'),
          Divider(),
          mylistTile('我的视频', () {
            Navigator.pushNamed(context, '/myVideo');
          }, 'assets/images/sp.png'),
          Divider(),
          mylistTile('我的账户', () {
            Navigator.pushNamed(context, '/myAccount');
          }, 'assets/images/qb.png'),
          Divider(),
          mylistTile('我的竞猜', () {
            Navigator.pushNamed(context, '/myGuessingCompetition');
          }, 'assets/images/jc.png'),
          Divider(),
          mylistTile('设置', () {
            Navigator.pushNamed(context, '/settings');
          }, 'assets/images/sz.png'),
        ],
      ),
    );
  }

  Widget mylistTile(String title, Function fn, String iconImage) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  // Icon(IconData(0xe65c, fontFamily: 'myIcon'), color: Color(0xff777777), size: ScreenAdapter.size(30),),
                  Container(
                    width: ScreenAdapter.setWidth(50),
                    child: Image.asset(iconImage, fit:BoxFit.cover),
                  ),
                  SizedBox(
                    width: ScreenAdapter.setWidth(20),
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: ScreenAdapter.size(30)),
                  )
                ],
              ),
            ),
            Icon(
              IconData(0xe655, fontFamily: 'myIcon'),
              color: Color(0xffCACACA),
              size: ScreenAdapter.size(30),
            )
          ],
        ),
      ),
      onTap: fn,
    );
  }
}



// Sliver可拖动顶部
class SliverTopBar extends StatefulWidget {
  const SliverTopBar(
      {Key key,
      @required this.extraPicHeight,
      @required this.fitType,
      @required this.customColor});
  final double extraPicHeight;
  final BoxFit fitType;
  final Color customColor;

  @override
  _SliverTopBarState createState() => _SliverTopBarState();
}

class _SliverTopBarState extends State<SliverTopBar> {
  var _phone;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: ScreenAdapter.setHeight(70)),
        // color:Theme.of(context).primaryColor,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xffFFABAB),
              Color(0xffFF7575),
              Color(0xffFF1414)
            ])),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: ScreenAdapter.setWidth(30)),
              alignment: Alignment.centerLeft,
              child: Icon(
                IconData(0xe654, fontFamily: 'myIcon'),
                size: ScreenAdapter.size(60),
                color: Colors.white,
              ),
            ),
          ],
        )
        // Stack(
        // children: <Widget>[

        // Positioned(
        //   top:ScreenAdapter.setHeight(120) + widget.extraPicHeight,
        //   left: ScreenAdapter.setWidth(30),
        //   child: InkWell(
        //     onTap: (){

        //     },
        //     child: Row(
        //       children: <Widget>[
        //         Container(
        //           width: ScreenAdapter.setWidth(130),
        //           margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
        //           child: AspectRatio(
        //             aspectRatio: 1/1,
        //             child: ClipRRect(
        //               borderRadius: BorderRadius.circular(70),
        //               child: FadeInImage.memoryNetwork(
        //                 placeholder: kTransparentImage,
        //                 image: 'http://img.mp.itc.cn/upload/20170724/cf678e09eb384401aa616ba134126357_th.jpg',
        //                 fit: BoxFit.cover,
        //               )
        //           ),
        //           )
        //         ),

        //       ],
        //     ),
        //   )
        // )
        //   ],
        // ),
        );
  }
}

// 曲线
class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 30);
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 30);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
