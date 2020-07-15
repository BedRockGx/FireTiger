import 'dart:convert';

import 'package:firetiger/PluginWidget/Consultation.dart';
import 'package:firetiger/PluginWidget/consultationSwiper.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:firetiger/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:transparent_image/transparent_image.dart';

class ConsulationPage extends StatefulWidget {
  @override
  _ConsulationPageState createState() => _ConsulationPageState();
}

class _ConsulationPageState extends State<ConsulationPage> with  AutomaticKeepAliveClientMixin {

  var api = Api();

  List<Map> bannerArr = [];                             // 轮播图数组
  var newsArticlesData = [];                            // 资讯列表数组
  var _page = 1;
  // var size = 

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  bool get wantKeepAlive => true;

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    
    if(mounted)
    setState(() {
      _page++;
    });
    getConsultation();
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();
    getConsulationSwiper();       // 获取轮播图
    getConsultation();            // 获取最新资讯
  }

  getConsulationSwiper(){
    api.getData(context, 'getBanner', formData: {
      'cid':'10'
    }).then((val){
      var response = json.decode(val.toString());
      // 问题：如果直接切换到第三个的话，中间的这个也会渲染一遍，再关闭掉，导致setState没有及时的关闭，造成内存泄漏
      setState(() {
        bannerArr = (response['data']['info'] as List).cast();
      });
    });
  }

  getConsultation(){
    api.getData(context, 'getArticles', formData: {'page':_page}).then((res){
      var response = json.decode(res.toString());
      setState(() {
        newsArticlesData.addAll(response['data']['info']['articles']['list']);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    bannerArr = [];
  }

  @override
  Widget build(BuildContext context) {
    return   
    
          SmartRefresher(
              enablePullDown: false,
              enablePullUp: true,
              controller: _refreshController,
              onLoading: _onLoading,
              footer: ClassicFooter(
                loadStyle: LoadStyle.ShowWhenLoading,
                loadingText:'加载中……',
                idleText:'刷新完毕', 
                noDataText:'已经到底了~', 
                completeDuration: Duration(milliseconds: 500),
              ),
              child: CustomScrollView(
                slivers:<Widget>[
                  SliverToBoxAdapter(
                    child: Container(
                              margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
                              constraints: BoxConstraints(maxHeight: ScreenAdapter.setHeight(270), maxWidth:double.infinity),
                              child: ConsulationSwiper(bannerArr)
                            ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (c, i) {
                        return InkWell(
                                child: Container(
                                  margin:EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(15), horizontal: ScreenAdapter.setWidth(30)),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text('${newsArticlesData[i]['post_title']}',maxLines: 2, style: TextStyle(fontSize: ScreenAdapter.size(30)), overflow: TextOverflow.ellipsis,),
                                              SizedBox(height: ScreenAdapter.setHeight(20),),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Text('${newsArticlesData[i]['name']} · ${Utils.handleDate(newsArticlesData[i]['post_date'])}', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),),
                                                  Container(
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: <Widget>[
                                                        Icon(IconData(0xe685, fontFamily: "myIcon"), color: Color(0xffA4A4A4), size: ScreenAdapter.size(32),),
                                                        SizedBox(width: ScreenAdapter.setWidth(5),),
                                                        Text('${newsArticlesData[i]['post_hits']}', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)))
                                                      ],
                                                    ),
                                                  )
                                                  
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left:ScreenAdapter.setWidth(20)),
                                          width: ScreenAdapter.setWidth(250),
                                          child: AspectRatio(
                                            aspectRatio: 4/3,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child:FadeInImage.memoryNetwork(
                                                placeholder: kTransparentImage,
                                                image: '${newsArticlesData[i]['new_smeta']['thumb']}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  Navigator.pushNamed(context, '/consulationDetails', arguments: newsArticlesData[i]['id']);
                                },
                              );
                      },
                      childCount: newsArticlesData.length,
                    ),
                  )
                ]
              )
            );
            
  }
}