/*
Navicat MySQL Data Transfer

Source Server         : may
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2018-07-10 23:07:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fatie
-- ----------------------------
DROP TABLE IF EXISTS `fatie`;
CREATE TABLE `fatie` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `titles` varchar(255) DEFAULT NULL,
  `fcontent` text,
  `userid` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `fforuser` (`username`),
  KEY `fforuserid` (`userid`),
  CONSTRAINT `fforuser` FOREIGN KEY (`username`) REFERENCES `user` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fforuserid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fatie
-- ----------------------------
INSERT INTO `fatie` VALUES ('20', '中国的哪方面比美国强？', '1. 美国非常不安全。美国是这样的，这个区域有钱就多交税警察多，就安全。没钱就警察少就不安全。比如底特律就没有警察。我在北京只要十一点回家爸妈就放心，在洛杉矶我天黑之后也就敢在westwood（夹在三个富人区中间）溜达溜达。洛杉矶downtown什么样呢？整条街道都弥漫着恶臭味，人行道完全没法走，全都是帐篷，我走路的话就只能走到马路的中央。', '6', '2017_9_1_16_53_41_id6_QQ截图20170901165256.png', '2017-09-01 16:53:41', '图书管理员');
INSERT INTO `fatie` VALUES ('21', '我是陈意涵', '陈意涵（Ivy Chen），1982年11月12日出生于台湾省新北市，华语影视女演员。2006年，她因主演银幕处女作《单车上路》而正式出道。2007年，凭借励志剧《奋斗》被更多内地观众认识。2009年，因主演警匪剧《痞子英雄》而获得韩国首尔国际电视剧奖最佳女演员提名。2010年，凭借剧情片《听说》获得第12届台北电影节最佳女主角。2012年，凭借爱情片《爱LOVE》获得第49届台湾电影金马奖最佳女配角提名。2014年，她又凭借现代片《军中乐园》获得第51届台湾电影金马奖最佳女配角提名。', '7', '2017_9_1_16_55_44_id7_29517865894105ba816934950e43e547.jpg', '2017-09-01 16:55:44', '陈意涵');
INSERT INTO `fatie` VALUES ('22', '你觉得哪些书值得我们去读？', '我在大学的时候，搜集了豆瓣top250的书单，看了不少书，但是很多没有留下什么深刻的印象，看书是好事，但是如果能够把书里的知识运用到现实当中，对自己以及身边的人有所助益就更好了。作为一个过来人，我很理解大家想要提升自己的愿望，今天就整理、推荐了一些豆瓣评分8分以上，广受我身边朋友、老师好评，并且我也觉得对我特别有帮助的书推荐给大家希望对你也能够有所帮助~', '7', '2017_9_1_16_57_31_id7_814f253234a906a1d422f3c4fe832fa1.jpg', '2017-09-01 16:57:31', '陈意涵');
INSERT INTO `fatie` VALUES ('23', '北方雪景', '1. 孤舟蓑笠翁，独钓寒江雪。\r\n2. 云横秦岭家何在，雪拥蓝关马不前\r\n3. 地白风色寒，雪花大入手\r\n4. 夜深知雪重，时闻折竹声。\r\n5. 北风吹雪四更初，嘉瑞天教及岁除。\r\n6. 战退玉龙三百万，败鳞残甲满天飞。\r\n7. 帘外雪初飘，翠幌香凝火未消。\r\n8. 雪照山城玉指寒，一声羌管怨楼间。\r\n9. 雪里已知春信至，寒梅点缀琼枝腻。\r\n10. 落尽琼花天不惜，封他梅蕊玉无香。\r\n11. 白雪却嫌春色晚，故穿庭树作飞花。\r\n12. 草枯鹰眼疾，雪尽马蹄轻。\r\n13. 欲渡黄河冰塞川，将登太行雪满山。', '8', '2017_9_1_17_05_36_id8_5fcd5b59420bd9fcd2eacf4074c07dc6.png', '2017-09-01 17:05:36', '马亮南生');
INSERT INTO `fatie` VALUES ('24', '有哪些常被认为是违法的其实是合法的事？', '学习不认真，工作不努力，怎么可能成功', '6', null, '2017-09-01 17:14:08', '图书管理员');
INSERT INTO `fatie` VALUES ('26', '我喜欢你', '十里春风不如你\r\n脑子进水因为你\r\n都是你\r\n你真可爱', '6', null, null, '图书管理员');
INSERT INTO `fatie` VALUES ('28', '奥斯维辛没有什么新闻', '2', '6', '2018_7_10_id6_t0123e949b866d28e54.jpg', null, '图书管理员');
INSERT INTO `fatie` VALUES ('29', '期末考试', '膜拜我超越大神啊啊啊啊啊\r\n求期末高分过呜呜┭┮﹏┭┮', '6', null, null, '图书管理员');
INSERT INTO `fatie` VALUES ('31', '奥斯维辛没有什么新闻', '从某种意义上说，在布热金卡，最可怕的事情是这里居然阳光明媚温暖，一行行白杨树婆娑起舞，在大门附近的草地上，还有儿童在追逐游戏。\r\n这真像一场噩梦，一切都可怕地颠倒了。在布热金卡，本来不该有阳光照耀，不该有光亮，不该有碧绿的草地，不该有孩子们的嬉笑。布热金卡应当是个永远没有阳光、百花永远凋谢的地方，因为这里曾经是人间地狱。\r\n每天都有人从世界各地来到布热金卡——这里也许是世间最可怕的旅游中心。来人的目的各不相同——有人为了亲眼看看事情是不是像说的那样可怕，有人为了不使自己忘记过去，也有人想通过访问死难者受折磨的场所，来向他们致敬。', '6', '2018_7_10_id6_t01da95ca23cf0f4361.jpg', null, '图书管理员');
INSERT INTO `fatie` VALUES ('32', '吉米的世界', 'Jimmy is 8 years old and a third-generation heroin addict, a precocious little boy with sandy hair, velvety brown eyes and needle marks freckling the baby-smooth skin of his thin brown arms.\r\nHe nestles in a large, beige reclining chair in the living room of his comfortably furnished home in Southeast Washington . There is an almost cherubic ex<x>pression on his small, round face as he talks about life -- clothes, money, the Baltimore Orioles and heroin. He has been an addict since the age of 5. His hands are clasped behind his head, fancy running shoes adorn his feet, and a striped Izod T-shirt hangs over his thin frame. \"Bad, ain\'t it,\" he boasts to a reporter visiting recently. \"I got me six of these.\"\r\nJimmy\'s is a world of hard drugs, fast money and the good life he believes both can bring. Every day, junkies casually buy herion from Ron, his mother\'s live-in-lover, in the dining room of Jimmy\'s home. They \"cook\" it in the kitchen and \"fire up\" in the bedrooms. And every day, Ron or someone else fires up Jimmy, plunging a needle into his bony arm, sending the fourth grader into a hypnotic nod.\r\nJimmy prefers this atmosphere to school, where only one subject seems relevant to fulfilling his dreams. \"I want to have me a bad car and dress good and also have me a good place to live,\" he says. \"So, I pretty much pay attention to math because I know I got to keep up when I finally get me something to sell.\"\r\nJimmy wants to sell drugs, maybe even on the District\'s meanest street, Condon Terrace SE, and some day deal heroin, he says, \"just like my man Ron.\"\r\nRon, 27, and recently up from the South, was the one who first turned Jimmy on.\"He\'d be buggin\' me all the time about what the shots were and what people was doin\' and one day he said, \'When can I get off?\'\" Ron says, leaning against a wall in a narcotic haze, his eyes half closed, yet piercing. \"I said, \'Well, s . . ., you can have some now.\' I let him snort a little and, damn, the little dude really did get off.\"\r\nSix months later, Jimmy was hooked. \"I felt like I was part of what was goin\' down,\" he says. \"I can\'t really tell you how it feel. You never done any? Sort of like them rides at King\'s Dominion . . . like if you was to go on all of them in one day.\r\n\"It be real different from herb (marijuana). That\'s baby s---. Don\'t nobody here hardly ever smoke no herb. You can\'t hardly get none right now anyway.\"\r\nJimmy\'s mother Andrea accepts her son\'s habit as a fact of life, although she will not inject the child herself and does not like to see others do it.\r\n\"I don\'t really like to see him fire up,\" she says. \"But, you know, I think he would have got into it one day, anyway. Everybody does. When you live in the ghetto, it\'s all a matter of survival. If he wants to get away from it when he\'s older, then that\'s his thing. But right now, things are better for us than they\'ve ever been. . . . Drugs and black folk been together for a very long time.\"\r\nHeroin has become a part of life in many of Washington\'s neighborhoods, affecting thousands of teen-agers and adults who feel cut off from the world around them, and filtering down to untold numbers of children like Jimmy who are bored with school and battered by life.\r\nOn street corners and playgrounds across the city, youngsters often no older than 10 relate with uncanny accuracy the names of important dealers in their neighborhoods, and the going rate for their wares. For the uninitiated they can recite the color, taste, and smell of things such as heroin, cocaine, and marijuana, and rattle off the colors in a rainbow made of pills.\r\nThe heroin problem in the District has grown to what some call epidemic proportions, with the daily influx of so-called \"Golden Crescent\" heroin from Iran, Pakistan, and Afghanistan, making the city fourth among six listed by the U.S. Drug Enforcement Agency as major points of entry for heroin in the United States. The Golden Crescent\" heroin is stronger and cheaper than the Southeast Asian and Mexican varieties previously available on the street, and its easy accessiblity has added to what has long been a serious problem in the nation\'s capital.', '6', '2018_7_10_id6_t0198d55bcab0c521c7.jpg', null, '图书管理员');
INSERT INTO `fatie` VALUES ('33', '包法利夫人', '小说描写的是一位小资产阶级妇女 因为不满足平庸的生活而逐渐堕落的过程。主人公爱玛为了追求浪漫和优雅的生活而自甘堕落与人通奸，最终因为负债累累无力偿还而身败名裂，服毒自杀。这里写的是一个无论在生活里还是在文学作品中都很常见的桃色事件，但是作者的笔触感知到的是旁人尚未涉及的敏感区域。爱玛的死不仅仅是她自身的悲剧，更是那个时代的悲剧。作者用很细腻的笔触描写了主人公情感堕落的过程，作者很努力地找寻着造成这种悲剧的社会根源。\r\n查理·包法利是个军医的儿子。他天资不高，但很勤勉、老实，为人懦弱无能。父亲对教育不重视。他在十二岁是由母亲为他争得了上学的权利，后来当了医生。这时他的父母又为他找了个每年有一千二百法郎收入的寡妇——杜比克夫人做妻子，她已四十五岁了，又老又丑，“柴一样干，象春季发芽一样一脸疙瘩”。但她因为有钱，并不缺少应选的夫婿。她和查理结婚后，便成了管束他的主人：查理必须顺从她的心思穿衣服，照她的吩咐逼迫欠款的病人；她拆阅他的信件，隔着板壁偷听他给妇女看病。\r\n一天，查理医生接到一封紧急的信件，要他到拜尔斗给一个富裕农民卢欧先生治病，他的一条腿摔断了。卢欧是个五十岁左右的矮胖子，他的太太二年前已去世了。家里由她的独生女爱玛料理。这是个具有浪漫气质的女孩子，面颊是玫瑰色的，头发黑油油的，在脑后挽成一个大髻，眼睛很美丽，由于睫毛的缘故，棕颜色仿佛是黑颜色，她“朝你望来，毫无顾虑，有一种天真无邪胆大的神情”。她给查理留下了深刻的印象。查理给卢欧诊治过后，答应他三天后再去拜访，但到第二天他就去了。此后，他一星期去两次。先后花了四十六天的时间，治好了卢欧的腿。\r\n查理妻子同丈夫常上拜尔斗去。免不了要打听病人的底细。当她知道卢欧小姐曾受过教育，懂得跳舞、地理、素描、刺绣和弹琴时，醋劲大发。她要丈夫把手放在弥撒书上，向她发誓，今后再也不去拜尔斗了。查理唯命是听，照样做了。但不久发生了一件意外的事，他妻子的财产保管人带着她的现金逃跑了。查理的父母发现媳妇一年并没有一千二百法郎的收入（她在订婚的时候撒了谎），于是跑来和她吵闹。她在一气之下，吐血死了。\r\n卢欧老爹给查理送诊费来，当他知道查理的不幸后，便尽力安慰他，说自己也曾经历过丧偶的痛苦。他邀请查理到拜尔斗去散散心。查理去了，并且爱上了爱玛。他向卢欧老爹提亲。卢欧感到查理不是理想的女婿，不过人家说他品行端正，省吃俭用，自然也不会太计较陪嫁，便答应了。开春后，查理和爱玛按当地的风俗举行了婚礼。。。', '6', '2018_7_10_id6_p2257350838.jpg', null, '图书管理员');
INSERT INTO `fatie` VALUES ('34', '仲夏夜之梦', '《仲夏夜之梦》讲述了一个有情人终成眷属的爱情故事。故事发生在古希腊的雅典，年轻的赫米娅与拉山德相爱，可是赫米娅的父亲却希望她嫁给狄米特律斯，为此赫米娅与拉山德逃到城外的一片森林里。此时，为了给雅典公爵提修斯和美丽的希波吕妲的盛大婚礼助兴，一群演员也在森林里排练一出喜剧。赫米娅的好友海伦娜爱着狄米特律斯，所以她把消息透露给了狄米特律斯，于是她们两个人也先后来到森林里。森林里住着许多可爱的小精灵，仙王奥布朗和仙后蒂泰妮霞正在闹别扭。为了捉弄仙后，仙王命令一个叫浦克的小淘气去采一种花汁，拿来滴在仙后的眼睛里，那么她醒来就会狂热地爱上第一眼看到的人或动物。正巧仙王还无意中得知海伦娜爱着狄米特律斯，所以他让浦克将一些花汁滴在狄米特律斯的眼里，可是浦克把拉山德误认为狄米特律斯。结果，拉山德醒来看到的是海伦娜，便不停地向她求爱，而把赫米娅忘掉了。仙王发现后。赶忙把花汁滴入正在熟睡的狄米特律斯的眼中。狄米特律斯醒来，看到正被拉山德追赶的海伦娜，于是两人争先恐后地向海伦娜求爱。看到这样的情景，海伦娜和赫米娅都很生气。与此同时，仙后也中了计，爱上了一个排戏的演员波顿。最后，仙王给所有人解除了魔法，大家如愿以偿都得到了属于自己的一份爱情', '6', '2018_7_10_id6_night dream.jpg', null, '图书管理员');

-- ----------------------------
-- Table structure for pinglun
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pcontent` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT '0',
  `byid` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `pforuser` (`userid`),
  KEY `pforft` (`byid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES ('13', '你好，我是小明。', '8', '21', '2017-09-01 17:08:47');
INSERT INTO `pinglun` VALUES ('14', '北方雪景很漂亮，1. 孤舟蓑笠翁，独钓寒江雪。 2. 云横秦岭家何在，雪拥蓝关马不前 3. 地白风色寒，雪花大入手 4. 夜深知雪重，时闻折竹声。 5. 北风吹雪四更初，嘉瑞天教及岁除。', '7', '21', '2017-09-01 17:09:43');
INSERT INTO `pinglun` VALUES ('16', '我可以给自己评论哦', '6', '21', '2017-09-01 17:15:41');
INSERT INTO `pinglun` VALUES ('17', '小伙子，不错哦。', '6', '21', '2017-09-01 17:16:05');
INSERT INTO `pinglun` VALUES ('18', '呀，，原来也可以给自己评论啊。', '7', '21', '2017-09-01 17:21:54');
INSERT INTO `pinglun` VALUES ('24', '真是好看', '6', '21', '2018-07-18 00:27:50');
INSERT INTO `pinglun` VALUES ('25', '我没怎么看过这些书', '6', '21', '2018-07-18 00:27:50');
INSERT INTO `pinglun` VALUES ('26', '23333', '6', '21', '2018-07-18 00:27:50');
INSERT INTO `pinglun` VALUES ('28', '陈意涵我好爱你！！！你好漂亮啊', '6', '21', '2018-07-18 00:27:50');
INSERT INTO `pinglun` VALUES ('29', '你真好看', '6', '21', '2018-07-18 00:27:50');
INSERT INTO `pinglun` VALUES ('30', '你是我喜欢的少年', '6', '26', null);
INSERT INTO `pinglun` VALUES ('32', '北方的雪景还是比南方的好看', '6', '23', null);
INSERT INTO `pinglun` VALUES ('34', 'xdczc', '6', '29', null);
INSERT INTO `pinglun` VALUES ('35', '咕咕咕', '6', '33', null);
INSERT INTO `pinglun` VALUES ('36', '啦啦啦', '6', '33', null);
INSERT INTO `pinglun` VALUES ('37', '1111111111111111111111111111111111', '6', '34', null);
INSERT INTO `pinglun` VALUES ('38', '122222222222222222222', '6', '34', null);
INSERT INTO `pinglun` VALUES ('39', '333333333333333333333333333333', '6', '34', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `family` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', '1', null, null, null, null);
INSERT INTO `user` VALUES ('6', '图书管理员', '123', '123456@qq.com', '东北师范大学', '三个热爱代码的女青年', '2017-09-01 16:47:16');
INSERT INTO `user` VALUES ('7', '陈意涵', '123456', '927654672@qq.com', '中国台湾', '漂亮，美丽，人见人爱。', '2017-09-01 16:48:26');
INSERT INTO `user` VALUES ('8', '马亮南生', '1234', '767676767@gmail.com', '四川成都', '克己复礼，帅气无比。', '2017-09-01 17:01:17');

-- ----------------------------
-- Table structure for via
-- ----------------------------
DROP TABLE IF EXISTS `via`;
CREATE TABLE `via` (
  `userid` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  KEY `上传图片` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of via
-- ----------------------------
INSERT INTO `via` VALUES ('6', '2017_9_1_17_14_51_id6_29517865894105ba816934950e43e547.jpg');
