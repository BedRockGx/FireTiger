
import 'package:firetiger/component/videoTab/comment.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:like_button/like_button.dart';
import 'package:share/share.dart';

class CustomSliverHeaderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
              title: '足球带我奔跑，一停一拉一传，萨拉赫背身做球的梦幻三连',
              collapsedHeight: 50,
              expandedHeight: ScreenAdapter.setHeight(400),
              paddingTop: MediaQuery.of(context).padding.top,
              coverImgUrl: 'https://img.zcool.cn/community/01c6615d3ae047a8012187f447cfef.jpg@1280w_1l_2o_100sh.jpg'
            ),
          ),
          SliverFillRemaining(
            child: FilmContent(),
          )
        ],
      ),
    );
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String coverImgUrl;
  final String title;
  String statusBarMode = 'light';

  SliverCustomHeaderDelegate({
    this.collapsedHeight,
    this.expandedHeight,
    this.paddingTop,
    this.coverImgUrl,
    this.title,
  });

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  void updateStatusBarBrightness(shrinkOffset) {
    if(shrinkOffset > 50 && this.statusBarMode == 'light') {
      this.statusBarMode = 'dark';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    } else if(shrinkOffset <= 50 && this.statusBarMode == 'dark') {
      this.statusBarMode = 'light';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));
    }
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if(shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    this.updateStatusBarBrightness(shrinkOffset);
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(child: Image.network(this.coverImgUrl, fit: BoxFit.cover)),
          Positioned(
            left: 0,
            top: this.maxExtent / 2,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00000000),
                    Color(0x90000000),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: this.makeStickyHeaderBgColor(shrinkOffset),
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: this.collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: this.makeStickyHeaderTextColor(shrinkOffset, true),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Container(
                        width: ScreenAdapter.setWidth(500),
                        child: Text(
                          this.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: this.makeStickyHeaderTextColor(shrinkOffset, false),
                          ),
                        ),
                      ),
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.share,
                      //     color: this.makeStickyHeaderTextColor(shrinkOffset, true),
                      //   ),
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilmContent extends StatefulWidget {
  @override
  _FilmContentState createState() => _FilmContentState();
}

class _FilmContentState extends State<FilmContent> {

  var data = """
    <div>
      <h1>Demo Page</h1>
      <p>This is a fantastic nonexistent product that you should buy!</p>
      <h2>Pricing</h2>
      <p>Lorem ipsum <b>dolor</b> sit amet.</p>
      <h2>The Team</h2>
      <p>There isn't <i>really</i> a team...</p>
      <h2>Installation</h2>
      <img src="https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=194233767,3078416653&fm=26&gp=0.jpg" ></img>
      <p>You <u>cannot</u> install a nonexistent product!</p>
      <!--You can pretty much put any html in here!-->
    </div>
  """;

  TextEditingController _comment = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30)),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:ScreenAdapter.setHeight(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text('足球带我奔跑，一停一拉一传，萨拉赫背身做球的梦幻三连', style: TextStyle(fontSize: ScreenAdapter.size(40), fontWeight: FontWeight.bold),),
                ),
                Container(
                  margin: EdgeInsets.only(top:ScreenAdapter.setHeight(20)),
                  child: Text('来源名称 · 30分钟前', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),),
                ),
                Container(
                  child: Html(
                    data:data,
                    // padding: EdgeInsets.all(8.0),
                    defaultTextStyle: TextStyle(fontFamily: 'serif'),
                    linkStyle: const TextStyle(
                      color: Colors.redAccent,
                    ),
                    onLinkTap: (url) {
                      print(url);
                      // open url in a webview
                    },
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            width: ScreenAdapter.setWidth(690),
            child: Container(
              width: ScreenAdapter.setWidth(690),
              height: ScreenAdapter.setHeight(100),
              color: Color(0xffF9F9F9),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30)),
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: _comment,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '请输入评论',
                          hintStyle: TextStyle(color: Color(0xffCECECE), fontSize: ScreenAdapter.size(25))
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(15)),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(ScreenAdapter.setWidth(15)),
                            child: Icon(IconData(0xe67f, fontFamily: 'myIcon'), size: ScreenAdapter.size(40),),
                          ),
                          Positioned(
                            right: 0,
                            top:0,
                            child: Container(
                              color: Color(0xffF9F9F9),
                              child: Text('32', style: TextStyle(color: Color(0xffFF3641), fontSize: ScreenAdapter.size(25)),),
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: showBottomSheet,
                  ),
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(ScreenAdapter.setWidth(15)),
                          child: LikeButton(
                                likeBuilder: (bool isLiked){
                                    return Icon(IconData(0xe67e, fontFamily: 'myIcon'),size: ScreenAdapter.size(40) ,color: isLiked ? Color(0xffFF3641) : Colors.black,);
                                },
                                circleColor:CircleColor(start: Color(0xff00ddff), end: Color(0xffFF3641)),
                                bubblesColor: BubblesColor(
                                    dotPrimaryColor: Color(0xffFF3641),
                                    dotSecondaryColor: Color(0xffFF3641),
                                ),
                                onTap: (bool isLiked) async{
                                  return !isLiked;
                                }
                            )
                          // Icon(IconData(0xe67e, fontFamily: 'myIcon'), size: ScreenAdapter.size(40),),
                        ),
                        Positioned(
                          right: 0,
                          top:15,
                          child: Container(
                            color: Color(0xffF9F9F9),
                            child: Text('189', style: TextStyle(color: Color(0xffFF3641), fontSize: ScreenAdapter.size(25)),),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon:  Icon(IconData(0xe67d, fontFamily: 'myIcon'), size: ScreenAdapter.size(40),),
                      onPressed: (){
                        final RenderBox box = context.findRenderObject();
                        Share.share('我是分享的链接内容',
                                  subject: '我是分享邮箱时的用户名',
                                  sharePositionOrigin:box.localToGlobal(Offset.zero) & box.size);
                      },
                    )
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  showBottomSheet(){
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 10,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: ScreenAdapter.setHeight(700),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                decoration: BoxDecoration(
                  border:Border(
                    bottom: BorderSide(
                      width: ScreenAdapter.setHeight(1),
                      color: Color(0xffE5E5E5)
                    )
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text('全部评论(12)', style: TextStyle(fontSize:ScreenAdapter.size(30)),),
                    ),
                    InkWell(
                      child: Container(
                        child: Icon(Icons.close, size: ScreenAdapter.size(40), color: Color(0xffA4A4A4),),
                      ),
                      onTap: (){
                        
                      
                      },
                    )
                  ],
                )
              ),
              Expanded(
                child: Comment(1),
              )
            ],
          )
        );
      });
  }
}