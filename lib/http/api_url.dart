const base_url = 'http://live.huohujj.net/api/public/?service=';

const path = {
  'uploadFile':base_url + 'File.UploadImage',                                                 // 上传文件

  'getLoginCode':base_url + 'Login.GetLoginCode',                                             // 获取验证码                        
  'getCode':base_url + 'Login.GetCode',                                                       // 获取注册验证码                        
  'userRegister':base_url + 'Login.UserRegister',                                             // 注册验证码注册                       
  'codeLogin':base_url + 'Login.CodeLoginRong',                                               // 融云验证码 登录
  'userLogin':base_url + 'Login.UserLogin',                                                   // 账号密码登录
  'getLiveClass':base_url + 'PcHome.GetLiveClass',                                            // 获取直播分类列表
  'getBanner':base_url +'PcHome.GetBanner',                                                   // 获取轮播图
  // 'getNewsArticles':base_url +'News.GetBestNewArticles',                                   // 获取最新资讯
  'getArticles':base_url +'PcNews.GetArticles',                                               // 获取资讯列表
  'getGuessLike':base_url +'PcHome.GetGuessLike',                                             // 猜你喜欢
  'getArticlesDetails':base_url + 'PcTopic.GetArticleDetail',                                 // 获取资讯详情
  'getVideoClass':base_url + 'PcHome.GetVideoClass',                                          // 获取视频分类
  'getVideoList':base_url + 'PcHome.GetVideoList',                                            // 获取视频列表
  'getVideoDetails':base_url + 'Video.GetVideo',                                              // 获取视频详情
  'getLiveList':base_url + 'PcLive.GetLive',                                                  // 热门直播
  'getRecommend':base_url + 'PcLive.GetRecommend',                                            // 推荐直播
  'getRank':base_url + 'PcHome.GetRank',                                                      // 获取主播排行
  'getLiveComments':base_url + 'Live.GetLiveComments',                                        // 获取视频评论
  'addLike':base_url + 'Video.AddLike',                                                       // 视频点赞
  'getLoginUserInfo':base_url + 'PcUser.GetLoginUserInfo',                                    // 获取用户信息
  'getLiveRoom':base_url + 'PcLive.LiveRoom',                                                 // 获取直播间信息
  'getRelatedVideo':base_url + 'Video.GetRelatedVideo',                                       // 获取用户相关视频
  'setNewComment':base_url + 'Video.SetNewComment',                                           // 发表评论
  'getUserHostGrade':base_url + 'User.GetUserHostGrade',                                      // 主播等级详情
  'getMyLevel':base_url + 'User.GetMyLevel',                                                  // 用户等级详情
  'getRecharge':base_url + 'User.GetRecharge',                                                // 用户余额
  'doRecharge':base_url + 'Pay.DoRecharge',                                                   // 返回订单信息和支付信息
  'getBaseInfo':base_url + 'User.GetBaseInfo',                                                // 获取用户信息
  'getMyVideo':base_url + 'Video.GetMyVideo',                                                 // 获取我的视频
  'setVideo':base_url + 'Video.SetVideo',                                                     // 发布视频
  'getUserNotice':base_url + 'User.GetUserNotice',                                            // 我的消息（通知）
  'getCommentsList':base_url + 'User.GetCommentsList',                                        // 我的通知（评论）
  'getUserAccount':base_url + 'User.GetUserAccount',                                          // 我的账户
  'updateNickname':base_url + 'User.UpdateNickname',                                          // 修改用户名
  'updateSignature':base_url + 'User.UpdateSignature',                                        // 修改签名
  'updateSex':base_url + 'User.UpdateSex',                                                    // 修改性别
  'updateBirthday':base_url + 'User.UpdateBirthday',                                          // 修改生日
  'updateCity':base_url + 'User.UpdateCity',                                                  // 修改所在地
  'getBindMobileCode':base_url + 'User.GetBindMobileCode',                                    // 获取绑定手机号验证码
  'updateMobile':base_url + 'User.UpdateMobile',                                              // 绑定手机号
  'updateEmail':base_url + 'User.UpdateEmail',                                                // 绑定邮箱
  'getForgetCode':base_url + 'Login.GetForgetCode',                                           // 获取忘记密码验证码
  'userForget':base_url + 'Login.UserForget',                                                 // 找回密码
  'getAncLevel':base_url + 'Anchor.GetAncLevel',                                              // 主播信息
  'getFootBallLeague':base_url + 'Football.GetLeague',                                        // 赛事足球分类
  'getBasketBallLeague':base_url + 'Basketball.GetLeague',                                    // 赛事足球分类
  'getFootBallMatch':base_url + 'Football.GetMatch',                                          // 获取足球比赛数据
  'getBasketBallMatch':base_url + 'Basketball.GetMatch',                                      // 获取篮球比赛数据
  'getFootTeamRank':base_url + 'Football.GetTeamRank',                                        // 获取足球积分数据
  'getBasketTeamRank':base_url + 'Basketball.GetTeamRank',                                    // 获取篮球积分数据
  'getFootBallPlayerRank':base_url + 'Football.GetPlayerRank',                                // 获取足球球员榜数据
  'getBasketBallPlayerRank':base_url + 'Basketball.GetPlayerRank',                            // 获取篮球球员榜数据
  'createRoomChat':base_url + 'Live.CreateRoomChat',                                          // 创建直播房间
  'getAuthState':base_url + 'PersonalCenter.GetAuthState',                                    // 用户认证状态
  'setUserAuth':base_url + 'Anchor.SetUserAuth',                                              // 提交认证
  'getUserLevel':base_url + 'User.GetUserLevel',                                              // IM获取用户信息
  'getNewFollow':base_url + 'Home.GetNewFollow',                                              // 获取用户关注的列表
  'getHotSearch':base_url + 'PcSearch.GetHotSearch',                                          // 获取最近搜索
  'getSearchList':base_url + 'PcSearch.GetSearchList',                                        // 获取搜索数据
  'getReservationList':base_url + 'Match.GetReservationList',                                 // 赛事获取预约数据
  'reservation':base_url + 'Match.Reservation',                                               // 赛事预约
  'followAdd':base_url + 'PcUser.FollowAdd',                                                  // 关注主播
  'getGiftList':base_url + 'Live.GetGiftList',                                                // 获取礼物
  'SendGift':base_url + 'Live.SendGift',                                                      // 送礼物
  'getMyGuess':base_url + 'UserInfo.GetMyGuess',                                              // 我的助威
  'getList':base_url + 'Quiz.GetList',                                                        // 我的助威
  'getLiveType':base_url + 'Match.GetLiveType',                                               // 直播页面分类
  'getUserLivelist':base_url + 'Live.GetUserLivelist',                                        // 直播回放
  'getCoinTop':base_url + 'Anchor.GetCoinTop',                                                // 直播间贡献榜
  'addArticleLike':base_url + 'PcNews.AddLike',                                               // 点赞文章
  'commentAddLike':base_url + 'User.CommentAddLike',                                          // 评论点赞
  'GetSeason':base_url + 'Home.GetSeason',                                          // 评论点赞
};


