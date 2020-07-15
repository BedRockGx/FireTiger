import 'package:firetiger/customFlutter/fix_tabbar_view.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transparent_image/transparent_image.dart';

class MatchDetails extends StatefulWidget {
  var arguments;
  MatchDetails(this.arguments);
  
  @override
  _MatchDetailsState createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails>  with SingleTickerProviderStateMixin{

  PageController _pageController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: ScreenAdapter.setWidth(750),
                  height: ScreenAdapter.setHeight(430),
                  child: Image.asset('assets/images/MatchHeader.png', fit: BoxFit.cover,),
                ),
                Container(
                  margin: EdgeInsets.only(top:ScreenAdapter.setHeight(50)),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20)),
                  child: IconButton(
                    icon: Icon(
                      IconData(0xe654, fontFamily: 'myIcon'),
                      size: ScreenAdapter.size(60),
                      color: Colors.white,
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  width: ScreenAdapter.setWidth(750),
                  height: ScreenAdapter.setHeight(330),
                  bottom: 0,
                  child: Container(
                    margin: EdgeInsets.all(ScreenAdapter.setWidth(30)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(50), vertical:ScreenAdapter.setHeight(40)),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(100),
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage, 
                                        image: 'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top:ScreenAdapter.setHeight(20)),
                                      child: Text('阿森纳', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text('17/18赛季欧冠半决赛', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                                      ),
                                      Container(
                                        child: Text('3 : 0', style: TextStyle(fontSize: ScreenAdapter.size(90), fontWeight: FontWeight.bold),),
                                      ),
                                      Container(
                                        child: Text('2020年4月29日 18:00', style: TextStyle(fontSize:  ScreenAdapter.size(20), color: Color(0xffA4A4A4)),),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(100),
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage, 
                                        image: 'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top:ScreenAdapter.setHeight(20)),
                                      child: Text('纽卡斯尔', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(15),),
                                Container(
                                  margin:EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                                  padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(5)),
                                  color: Theme.of(context).primaryColor,
                                  child: Text('直播中', style: TextStyle(fontSize:ScreenAdapter.size(23), color: Colors.white),),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(width: ScreenAdapter.setHeight(0),  color: Colors.black12), bottom: BorderSide(width: ScreenAdapter.setHeight(0), color: Colors.black12))
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor:Theme.of(context).primaryColor,
                labelColor:Color(0xff333333),
                unselectedLabelColor:Color(0xff333333),
                indicatorSize:TabBarIndicatorSize.label,
                tabs: <Widget>[
                  Tab(
                    child: Container(
                      width: ScreenAdapter.setWidth(180),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('主播', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                          Text('共1位', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffAAAAAA),))
                        ],
                      ),
                    )
                  ),
                  Tab(
                    child: Container(
                      width: ScreenAdapter.setWidth(180),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('专家', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                          Text('共1位', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffAAAAAA),))
                        ],
                      ),
                    )
                  ),
                ],
                onTap: (index) {
                  _pageController.jumpToPage(index);
                },
                
              ),
            ),
           Expanded(
             child: FixTabBarView(
              pageController: _pageController,
              tabController: _tabController,
              children: [
                Center(
                  child: Text('1'),
                ),
                Center(
                  child: Text('2'),
                )
              ]
            ),
           )
          ],
        )
      )
    );
  }
}