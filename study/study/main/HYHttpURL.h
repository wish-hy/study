//
//  ZLHttpURL.h
//  ZhiLiao
//
//  Created by BaoWanPei on 2017/4/28.
//  Copyright © 2017年 XiaoHaiBao. All rights reserved.
//

#ifndef HYHttpURL_h
#define HYHttpURL_h

// 网络接口配置

// 测试接口     192.168.1.121    http://www.jialiaojy.com/app/index.php/
#define BaseUrl(url)  [NSString stringWithFormat:@"http://192.168.23.1:8080/tiany/%@",(url)]

////正式接口
//#define BaseUrl(url)  [NSString stringWithFormat:@"http://www.jialiaojy.com/app/index.php/Home/%@",(url)]


// 登陆测试
#define login @"user/phoneLogin.do"

// 手机注册
#define phoneregister @"user/phoneReg.do"

// 邮箱注册
#define emailregister @"user/emailReg.do"

// 修改用户信息
#define changeUserInfo @"user/updateUsers.do"
//// 注册
//#define Register @"User/register"
//
//
////三方登录时查找数据库是否有该登录的记录
//#define findthird @"User/findthird"
//
//// 三方登陆
//#define QuickLogin @"User/quickLogin"
//
//// 登录
//#define Login  @"User/login"
//
////修改密码
//#define RevisePass  @"User/RevisePass"
//// 发送经纬度
//#define PostCurrentLocation @"User/logPosition"
//
//// 退出登录
//#define Logout @"User/quit"
//
//// 融云相关
//#define GetRongToken @"Operate/getRongToken" // 获取融云token
//#define RefreshRongToken @"Operate/RefreshUserProfile" // 刷新融云token
//
//// 通话结束之后信息反馈到后台
//#define CallRecord @"Call/addCallRecord"
//// 获取通话列表
//#define GetCallList @"Call/getCallList"
//
//// 获取首页数据
//#define Home @"Index/index"
//
//// 获取黑名单列表
//#define Blacklist @"Operate/blackList"
//// 获取黑名单状态
//#define BlackStatus @"Operate/blackStatus"
//// 检测我是否在对方黑名单里面
//#define CheckAmInBlacklist @"Operate/checkAmInBlacklist"
//// 加入/移除 黑名单
//#define UseBlackStatus @"Operate/useBlackList"
//
//// 举报
//#define GetReportlist @"operate/reportlist" // 获取举报列表
//#define Report @"operate/report"
//
//// 条件查找 / ID搜索
//#define Search @"Contacts/search"
//
//// 置顶
//#define Top @"Operate/toTop"
//
//// 展示礼物商城列表
//#define GiftShop @"Gift/GiftShow"
//// TA收到的礼物
//#define GiftPersonalShow @"Gift/GiftPersonalShow"
//// 送别人礼物
//#define GiveGift @"Gift/GiveGift"
//
//// 获取个人 个人信息
//#define GetInfo @"Base/base"
//
//// 获取个人信息完善度
//#define GetInfoPerpect @"base/BaseNum"
//
//// 男神/女神 资料提交
//#define SubmitStars @"Stars/SubmitStars"
//// 获取男神/女神 审核状态
//#define CheckBoyOrGirlIsGodStatus @"Image/StarsCheckStatus"
//
//#pragma mark - 个人信息相关
//// 修改开关状态
//#define ModifySwitchStatus @"Base/setup"
//// 修改价格
//#define ModifyPrice @"Base/setMoney"
//
//// 获取钱包总额
//#define GetTotalMoney @"wallet/Money"
//
//// 获取聊天能力推荐列表
//#define GetChatAbility @"Personaltags/show"
//
//// 保存已选择的标签
//#define SaveSelectedChatAbiloty @"Personaltags/choose"
//
//// 个人信息修改
//#define ModifyUserInfo @"Base/baseSave"
//
//// 谁送过我礼物
//#define WhoGaveMeGift @"Base/FromGift"
//
//// 谁看过我
//#define WhoSeeMeList @"Base/look"
//
//// 添加/取消 关注
//#define AddOrCancleConcern @"Base/doAttention"
//
//// 粉丝列表展示(谁关注了我)
//#define FansList @"Base/fan"
//
//// 关注列表展示(我关注了谁)
//#define ConcernList @"Base/attention"
//
//// 附近聊友
//#define NearFriend @"FriendCircle/circle"
//
//// 排行榜
//#define Charm @"charm/personCharm"
//
//// 邀请奖励
//#define InviteRewardsHeader @"invite/PersonInvite"// 邀请人数/奖励
//#define InviteRewards @"Invite/InviteNum"// 邀请 - 列表数据
//
//#define createUrlShare @"User/createUrlShare"// 分享链接的获取接口
//
//// 点赞
//#define FriendCircleLove @"FriendCircle/love"
//
//// 发表评论
//#define SendAttention @"FriendCircle/SendAttention"
//
//// 朋友圈动态
//#define FriendCiecleDynamic @"FriendCircle/dynamic"
//
//// 单条动态详情
//#define DynamicDetail @"FriendCircle/dynamic_detail"
//
//// 查看图片付费
//#define SeeImagePay @"FriendCircle/img_pay"
//
//// 发布动态
//#define PushDynamic @"FriendCircle/Push_dynamic"
//
//// 头像修改
//#define ModifyHeadPortrait @"Base/filePic"
//
//// 相册修改
//#define ModifyPhotos @"Base/filePic"
//
//// 自拍认证
//#define SelfieCertification @"Image/check"
//
//// 自拍认证审核是否通过
//#define SelfieCertificationStatus @"Image/checkStatus"
//
//// VIP价格充值 （得到vip的价格接口）
//#define GetVIPFee @"Member/getVIPFeeSetting"
//
//// ------- 设置 --------
//// 提交反馈建议
//#define FeedBack @"Operate/feedback"
//
//// 一键隐身
//#define HiddenMe @"Operate/hiddenMe"
//
//// 消息展示列表
//#define LetterList @"letter/Showletterlist"
//
//// 查看消息记录
//#define readLetter @"letter/readletter"
//
//// 发送消息
//#define sendLetter @"letter/Sendletter"
//
////钱包明细
//#define walletDetail @"wallet/ShowAllDetail"
//
////支付宝orderString
//#define AlipayOrderString @"money/parameter"
//
////支付宝提现接口
//#define TransferToAccount @"Money/transferToAccount"
//
//// 绑定QQ/微信
//#define BuildingQQ_WX  @"task/building"
//// 绑定手机号码
//#define BuildPhone @"task/buildPhone"
//
//// 获取分享的 URL 地址
//#define GetShareUrl @"User/createUrlShare"
//
//// 获取通话评价 - 原因 列表
//#define GetCallReasonList @"operate/appraiselist"
//// 发送通话评价
//#define PostCallReason @"operate/appraise"
//
//// 显示轮播图
//#define LunBoShow @"lunbo/lunboshow"
//
//// 获取个人余额
//#define GetMyMoney @"call/getMyMoney"
//
//// 获取男神女神分成比例和等级值
//#define Godinfo @"base/godinfo"
//
//// 获取男神/女神对应的价格列表
//#define GetPriceByLevel @"base/GetPriceByLevel"
//
//// 获取QQ/微信 昵称
//#define GetQQ_WX_NickName @"task/GetName"
//
//// 将监黄的图片发送至服务器
//#define IdentifyPhotoDirty @"IdentifyPhotoDirty/main"
//
//// 内购票据验证接口
//#define VerificationReceipt @"Money/VerificationReceipt"
//
//// 使用聊币充值VIP
//#define Fvip @"Money/Fvip"
//
//#define DeleteCallList @"Call/DeleteCallList"

#endif /* ZLHttpURL_h */

