/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : book_dinner

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-04-26 19:35:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) NOT NULL COMMENT '菜品ID',
  `dname` varchar(255) NOT NULL COMMENT '菜品名',
  `price` varchar(255) NOT NULL COMMENT '单价',
  `num` int(11) NOT NULL COMMENT '数量',
  `uid` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('39', '7', '香椿鸡蛋饼', '20', '5', '2');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `did` int(11) NOT NULL COMMENT '菜品id',
  `comment` varchar(255) NOT NULL COMMENT '评论内容',
  `distribution` int(255) NOT NULL COMMENT '配送评分',
  `taste` int(255) NOT NULL COMMENT '口味评分',
  `packing` int(255) NOT NULL COMMENT '包装评分',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('5', '38', '聂', '17', '该用户很懒，默认好评！', '5', '5', '5');
INSERT INTO `comment` VALUES ('6', '38', '聂', '17', '该用户很懒，默认好评！', '5', '5', '5');
INSERT INTO `comment` VALUES ('7', '38', '聂', '17', '该用户很懒，默认好评！', '5', '5', '5');
INSERT INTO `comment` VALUES ('8', '38', '聂', '17', '该用户很懒，默认好评！', '5', '5', '5');
INSERT INTO `comment` VALUES ('9', '38', '聂', '9', '该用户很懒，默认好评！', '5', '5', '5');
INSERT INTO `comment` VALUES ('10', '38', '聂', '12', '很好！', '5', '5', '5');
INSERT INTO `comment` VALUES ('11', '40', '聂某某', '14', '味道不错，真心推荐。', '5', '5', '5');

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish` (
  `did` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜品ID',
  `name` varchar(255) NOT NULL COMMENT '菜品名',
  `price` varchar(255) NOT NULL COMMENT '单价',
  `describe` varchar(255) NOT NULL COMMENT '描述',
  `category` int(11) NOT NULL COMMENT '分类：1.凉菜系列，2.热菜系列，3.海鲜系列，4.酒水系列，5.主食系列',
  `imgPath` varchar(255) NOT NULL DEFAULT '../../../static/logo.png' COMMENT '图片地址',
  `sale` int(11) NOT NULL COMMENT '销售量',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES ('7', '香椿鸡蛋饼', '20', '春天的野菜最有味道，而菜市最受欢迎的当属香椿了！\n最好的香椿芽是香椿第一茬嫩芽。它蕴藏了整个冬天的营养，伴随着春的到来一股脑的都释放了出来；此时的芽色泽好，口感多汁，香气浓郁，营养价值也最高。', '5', 'http://localhost/book_dinner_backstage/assets/images/uploads/1211835_255405.jpg', '63');
INSERT INTO `dish` VALUES ('9', '红油冻豆腐', '28', '冻豆腐由新鲜豆腐冷冻而成，孔隙多多，历尽沧桑貌。\n将水豆腐冷冻，即为冻豆腐。解冻并脱水干燥的冻豆腐又称海绵豆腐，孔隙多、弹性好、营养丰富，味道也很鲜美。\n豆腐及豆腐制品的蛋白质含量丰富，而且豆腐蛋白属完全蛋白，不仅含有人体必需的八种氨基酸，而且比例也接近人体需要，常食可减轻血管系统的破坏，预防骨质疏松、乳腺癌和前腺癌的发生，是更年期妇女的保护神。\n可是它经过冷冻，与它的前世相比，味道也变的鲜美起来。不仅美味，而且冻豆腐，有吸收胃肠道及全身组织脂肪的作用，从而使体内堆积的脂肪不断消减，达', '1', 'http://localhost/book_dinner_backstage/assets/images/uploads/1208777_086760.jpg', '30');
INSERT INTO `dish` VALUES ('10', '贵州茅台酒新飞天53度500ml', '1688', '贵州茅台酒新飞天53度500ml', '4', 'http://localhost/book_dinner_backstage/assets/images/uploads/ftmt.jpg', '80');
INSERT INTO `dish` VALUES ('12', '东坡肉', '50', '东坡肉属于浙菜系，成品薄皮嫩肉，色泽红亮，味醇汁浓，酥烂而形不碎，香糯而不腻口。东坡肉选料很讲究，要选择皮猪肉为主要原料，猪肉要选择肥瘦相间的，先焯水定型后再切方块烹制，特点是使用绍兴黄酒为主要炖煮材料，小火长时间慢炖，味道才地道。\n    这道菜据说是苏东坡发明的，苏东坡的《炖肉歌》道：“黄州好猪肉，价贱如粪土。富者不肯吃，贫者不解煮。慢着火、少着水，柴火罨焰烟不起，待它自熟莫催它，火候足时它自美。”', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/dpr.jpg', '70');
INSERT INTO `dish` VALUES ('13', '干锅土豆片', '30', '干锅土豆片，健康美食。', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/s12686849_152248758828993.jpg', '77');
INSERT INTO `dish` VALUES ('14', '红烧大闸蟹', '88', '红烧大闸蟹', '3', 'http://localhost/book_dinner_backstage/assets/images/uploads/timg.jpg', '108');
INSERT INTO `dish` VALUES ('15', '避风塘炒虾', '42', '避风塘炒虾，它源自于香港避风塘地区的一种烹饪方法，港式茶餐厅中很流行的一道菜，以蒜末和面包糠为原料，炸得金黄的大蒜末又香又脆，佐以面包糠，酥脆的口感，香气四溢，让普通的菜肴变得不再平庸，摇身一变介入高档菜肴的行业中了。此类避风塘系的菜，只需要掌握最重要的蒜末和面包糠，就可以衍生出诸多，如避风塘炒蟹，避风塘茄子，避风塘排骨等等一系列的菜肴。', '3', 'http://localhost/book_dinner_backstage/assets/images/uploads/s9087269_152032545907730.jpg', '80');
INSERT INTO `dish` VALUES ('16', '双腊味荷兰豆', '48', '双腊味荷兰豆，绿色健康', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/s1036875_152100019438748.jpg', '80');
INSERT INTO `dish` VALUES ('17', '水煮花生米', '16', '清淡爽口小凉菜，佐粥下酒都适合。', '1', 'http://localhost/book_dinner_backstage/assets/images/uploads/s6030800_152032406399123.jpg', '28');
INSERT INTO `dish` VALUES ('18', '剁椒蒜苗', '20', '蒜苗具有醒胃、消食、杀菌、抑菌的作用， 春季易发生流行性感冒的时节，多吃能有效预防流感，白焯的方法吃蒜苗不知道有没有人试过，有次因家中没啥青菜，只有蒜苗，不想炒，就用开水烫了一下，沾点香辣的调味汁，哗！这样做法下的蒜苗竟然吃出了一种特别的甜味，很好吃，这个菜的热量也不高，只有124.5卡，纤维也多，减肥的人吃下正好', '1', 'http://localhost/book_dinner_backstage/assets/images/uploads/s4152544_152032675123360.jpg', '56');
INSERT INTO `dish` VALUES ('19', '蒜蓉苋菜', '39', '苋菜按照颜色分为红苋菜，绿苋菜，和红绿杂色三种，它富含铁，钙，蛋白质，具有清热解毒，补血止血，抗菌止泻，消炎消肿的功效。民间一向视苋菜为补血佳蔬，故有长寿菜的美称。\n入夏吃它比啥补药都好，苋菜味甘，性凉，夏天天气热，吃一些凉性食物是很有好处的。苋菜富含多种人体需要的维生素和矿物质，容易吸收，能够有效补充夏季因流汗损失的多种营养素。苋菜叶内富含容易被人体吸收的天然钙物质，可谓是小孩子的天然钙片。可以促进牙齿和骨骼的生长，帮助发育。苋菜还含有各种膳食纤维，可以促进肠胃蠕动，帮助排便，所以对减肥人士来说，也是一', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/s1025708_152031599078063.jpg', '80');
INSERT INTO `dish` VALUES ('20', '宫保豆腐', '36', '大家都很熟悉宫保鸡丁吧，它还有几个传说。其中一个还要从清朝后期的山东巡抚丁宝桢说起。  丁宝桢两袖清风，却独独钟爱美食。为官一处，一定微服私访，四处大快朵颐。一天，他又换上青衣小帽到大明湖转一圈，看见附近农家院中有一个老妇正在喂鸡，济南人素有好客之风，一面把他让进屋里，还让人把在酒楼做大厨的儿子叫了回来。\n  老妇招待的九转大肠、红烧肘子，丁宝桢都已尝过，惟有一个是他吃遍大江南北却是闻所未闻的，尝了一口感觉舌尖微麻，脆嫩可口，询问之后知道菜名叫“爆炒鸡丁”。这顿饭令他回味悠长，后来，他被调任为四川总督，这', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/s1036875_151995470751357.jpg', '90');
INSERT INTO `dish` VALUES ('21', '土豆丝炒莜面', '18', '莜面中含有钙、磷、铁、核黄素等多种人体需要的营养元素和药物成份，可以治疗和预防糖尿病、冠心病、动脉硬化、高血压等多种疾病。同时莜面中含有一种特殊物质——亚油酸，它对于人体新陈代谢具有明显的功效。', '5', 'http://localhost/book_dinner_backstage/assets/images/uploads/s2728143_151972014270036.jpg', '48');
INSERT INTO `dish` VALUES ('22', '爆炒猪肝', '59', '猪肝是补血的，香爆猪肝，那一片片切的好薄，炒的嫩嫩的 相当的好吃.', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/s3542197_151945484596661.jpg', '99');
INSERT INTO `dish` VALUES ('23', '四喜烤麸', '46', '四喜烤麸是一道上海名菜，也是上海人年夜饭中的常见冷菜之一，哈哈，之前我家养的小狗也非常喜欢烤麸。', '1', 'http://localhost/book_dinner_backstage/assets/images/uploads/s3542197_151851140206106.jpg', '78');
INSERT INTO `dish` VALUES ('24', '蒜香啤酒小龙虾', '50', '蒜香啤酒小龙虾，夏季必备。', '3', 'http://localhost/book_dinner_backstage/assets/images/uploads/s1210797_151789552629500.jpg', '70');
INSERT INTO `dish` VALUES ('25', '菜椒烧鸡腿', '40', '烧鸡腿根，简单又美味。', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/s2378495_151771994245933.jpg', '80');
INSERT INTO `dish` VALUES ('26', '韭菜炒蛤蜊', '49', '韭菜炒蛤蜊，鲜美。', '3', 'http://localhost/book_dinner_backstage/assets/images/uploads/s10535680_151779879319808.jpg', '90');
INSERT INTO `dish` VALUES ('27', '彩椒鸡柳', '40', '彩椒鸡柳，健康美味。', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/s10319479_151765944697965.jpg', '99');
INSERT INTO `dish` VALUES ('28', '葱油龙利鱼', '60', '鱼，主要有淡水鱼和海水鱼之分，但都具有肉质细嫩鲜美，营养丰富的特点；是维生素，矿物质的良好来源，经常吃鱼肉可以有效的防止心脏病的发生，强健大脑和神经组织。', '3', 'http://localhost/book_dinner_backstage/assets/images/uploads/s9087269_151770918722436.jpg', '90');
INSERT INTO `dish` VALUES ('30', '自制皮冻', '30', '猪皮富含丰富的胶原蛋白，而且不含脂肪经常吃可以滋润皮肤提高皮肤弹性。', '1', 'http://localhost/book_dinner_backstage/assets/images/uploads/s5970830_151774787728099.jpg', '88');
INSERT INTO `dish` VALUES ('31', '小白鸽馒头', '10', '小白鸽馒头，造型新颖。', '5', 'http://localhost/book_dinner_backstage/assets/images/uploads/s8615746_151758527788692.jpg', '160');
INSERT INTO `dish` VALUES ('32', '奥利奥酸奶红薯泥', '16', '一款零失败的健康小甜点，无论诱人的颜色还是美味的口感，都不要错过尝试哦。', '5', 'http://localhost/book_dinner_backstage/assets/images/uploads/s2728143_151746888473226.jpg', '80');
INSERT INTO `dish` VALUES ('33', '干锅鸡翅', '45', '超级下饭干锅鸡翅~足以满足你对鸡的一切幻想，这样一份鸡翅可以比平时多吃掉两碗米饭。鸡翅皮焦肉嫩，麻香味十足。佐酒配饭都是不错的选择。', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/s10518542_151739026155308.jpg', '99');
INSERT INTO `dish` VALUES ('34', '雪菜黄鱼', '39', '黄鱼含有丰富的蛋白质、矿物质和维生素，对人体有很好的补益作用。所以作为家常菜做给7、8岁的孩子吃，真心不错的！', '3', 'http://localhost/book_dinner_backstage/assets/images/uploads/s2913238_151731883126640.jpg', '99');
INSERT INTO `dish` VALUES ('35', '鱼炖茄子', '39', '鲤鱼的蛋白质不但含量高，而且质量也佳，人体消化吸收率可达96%，并能供给人体必需的氨基酸、矿物质、维生素A和维生素D，而且鲤鱼的脂肪多为不饱和脂肪酸，能很好的降低胆固醇，可以防治动脉硬化、冠心病，因此，多吃鱼可以健康长寿', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/s410583_151732660884438.jpg', '90');
INSERT INTO `dish` VALUES ('36', '木耳鹰嘴豆', '19', '下酒菜。', '1', 'http://localhost/book_dinner_backstage/assets/images/uploads/s4073322_151736208311480.jpg', '80');
INSERT INTO `dish` VALUES ('37', '四季豆炒鸡蛋', '30', '绿色美食', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/s410583_151724391138626.jpg', '76');
INSERT INTO `dish` VALUES ('38', '蛋黄南瓜', '38', '蛋黄南瓜，一道美食。', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/s3542197_151730128622820.jpg', '90');
INSERT INTO `dish` VALUES ('39', '茄汁什锦龙利鱼', '60', '这是送给小朋友的一道菜，龙利鱼搭配什锦蔬菜，不仅颜色好，而且营养也丰富，绝对会让小朋友们爱上吃饭哦', '3', 'http://localhost/book_dinner_backstage/assets/images/uploads/s8089963_151729886056569.jpg', '88');
INSERT INTO `dish` VALUES ('40', '八卦双拼蔬菜阵', '20', '健康绿色。', '1', 'http://localhost/book_dinner_backstage/assets/images/uploads/s3542197_151729873088183.jpg', '88');
INSERT INTO `dish` VALUES ('41', '地三鲜', '39', '东北家常菜，味道咸鲜，老少皆宜', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/s6829565_151701678401216.jpg', '99');
INSERT INTO `dish` VALUES ('42', '煎小刀鱼', '40', '好吃不贵，物美价廉，鲜香酥脆', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/s6092181_151718501340460.jpg', '80');
INSERT INTO `dish` VALUES ('43', '干锅孜然排骨', '60', '干锅孜然排骨.美食新风尚。', '2', 'http://localhost/book_dinner_backstage/assets/images/uploads/s5696920_151720527922548.jpg', '80');
INSERT INTO `dish` VALUES ('44', '家常凉菜', '39', '几乎零热量，即使吃上一大盘也不会发胖。', '1', 'http://localhost/book_dinner_backstage/assets/images/uploads/s6030800_152213893595931.jpg', '80');
INSERT INTO `dish` VALUES ('45', '捞拌鲍鱼', '90', '鲍鱼肉质丰腴肥厚，再配上黄瓜的青爽、与捞拌汁的鲜美，入口后鲜而不腻、清而味浓、食之令人过舌难忘。', '3', 'http://localhost/book_dinner_backstage/assets/images/uploads/s30078_152039215343847.jpg', '89');
INSERT INTO `dish` VALUES ('46', '爽口蒜香大拌菜', '20', '健康美食', '1', 'http://localhost/book_dinner_backstage/assets/images/uploads/s5391199_152031172270447.jpg', '80');
INSERT INTO `dish` VALUES ('47', '糖醋心里美萝卜丝', '30', '心里美萝卜是北方的一个地方萝卜品种。肉为鲜艳的紫红色，艳丽如花，极惹人喜爱，是我国著名的水果萝卜品种。其皮薄肉脆、多汁，一般都喜欢生吃。选购时以分量沉，水分足的为佳。\n在过年的餐桌上少不了大鱼大肉，难免有点腻口，来这么一道爽口、解酒、除腥去腻的小菜，那肯定受欢迎。', '1', 'http://localhost/book_dinner_backstage/assets/images/uploads/s1306355_151783194176574.jpg', '88');
INSERT INTO `dish` VALUES ('48', '啤酒烧鲍鱼', '99', '啤酒烧鲍鱼,新鲜美味。', '3', 'http://localhost/book_dinner_backstage/assets/images/uploads/s9805402_151487799185785.jpg', '88');
INSERT INTO `dish` VALUES ('49', '椒盐皮皮虾', '60', '皮皮虾又名虾婆婆，肉质肥美鲜嫩', '3', 'http://localhost/book_dinner_backstage/assets/images/uploads/s9905484_151446301441713.jpg', '99');
INSERT INTO `dish` VALUES ('50', '白灼竹节虾', '49', '竹节虾富含多种营养成分，具有较高的食用价值与保健作用。用白灼的做法，能够更好的保留竹节虾原有的鲜美滋味，搭配自己喜欢的蘸料，很美味哦~', '3', 'http://localhost/book_dinner_backstage/assets/images/uploads/s2677343_151314946418818.jpg', '99');
INSERT INTO `dish` VALUES ('51', '发粑粑', '5', '发粑粑美味主食', '5', 'http://localhost/book_dinner_backstage/assets/images/uploads/s10337364_151349931590435.jpg', '89');
INSERT INTO `dish` VALUES ('52', '五常大米饭', '3', '五常大米饭', '5', 'http://localhost/book_dinner_backstage/assets/images/uploads/mifan.jpg', '90');
INSERT INTO `dish` VALUES ('53', '汾酒55度', '78', '汾酒55度', '4', 'http://localhost/book_dinner_backstage/assets/images/uploads/15355671.jpg', '30');
INSERT INTO `dish` VALUES ('54', '牛栏山', '38', '牛栏山', '4', 'http://localhost/book_dinner_backstage/assets/images/uploads/nls.jpg', '66');
INSERT INTO `dish` VALUES ('55', '茉莉花茶', '5', '茉莉花茶', '4', 'http://localhost/book_dinner_backstage/assets/images/uploads/mlh.jpg', '45');
INSERT INTO `dish` VALUES ('56', '营养快线', '8', '营养快线', '4', 'http://localhost/book_dinner_backstage/assets/images/uploads/hahah.jpg', '65');
INSERT INTO `dish` VALUES ('57', '红酒', '108', '法国进口红酒', '4', 'http://localhost/book_dinner_backstage/assets/images/uploads/jj.jpg', '65');
INSERT INTO `dish` VALUES ('58', '洋酒', '99', '德国进口洋酒', '4', 'http://localhost/book_dinner_backstage/assets/images/uploads/hjjj.jpg', '59');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `time` varchar(255) NOT NULL COMMENT '下单时间',
  `name` varchar(255) NOT NULL COMMENT '收货人姓名',
  `phone` int(11) NOT NULL COMMENT '收货人电话',
  `total` varchar(255) NOT NULL COMMENT '总价',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `status` varchar(255) NOT NULL DEFAULT '0' COMMENT '订单状态 0：未处理；1：已处理',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('10', '2018-04-25 16:20:08', '聂', '2147483647', '78', '38', '海淀区清上园小区', '1');
INSERT INTO `order` VALUES ('11', '2018-04-25 16:26:50', '聂', '2147483647', '166', '38', '海淀区清上园小区', '1');
INSERT INTO `order` VALUES ('12', '2018-04-25 20:32:57', '聂某某', '2147483647', '36', '40', '海淀区清上园小区', '0');
INSERT INTO `order` VALUES ('13', '2018-04-25 20:33:25', '聂某某', '2147483647', '128', '40', '海淀区中关村', '0');
INSERT INTO `order` VALUES ('14', '2018-04-25 20:33:46', '聂某某', '2147483647', '130', '40', '海淀区中关村', '0');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) NOT NULL COMMENT '菜品id',
  `dname` varchar(255) NOT NULL COMMENT '菜品名称',
  `price` varchar(255) NOT NULL COMMENT '单价',
  `num` int(11) NOT NULL COMMENT '数量',
  `uid` varchar(255) NOT NULL COMMENT '用户id',
  `time` varchar(255) NOT NULL COMMENT '下单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('38', '17', '水煮花生米', '16', '1', '38', '2018-04-25 16:20:08');
INSERT INTO `order_detail` VALUES ('39', '18', '剁椒蒜苗', '20', '1', '38', '2018-04-25 16:20:08');
INSERT INTO `order_detail` VALUES ('40', '15', '避风塘炒虾', '42', '1', '38', '2018-04-25 16:20:08');
INSERT INTO `order_detail` VALUES ('41', '9', '红油冻豆腐', '28', '1', '38', '2018-04-25 16:26:50');
INSERT INTO `order_detail` VALUES ('42', '12', '东坡肉', '50', '1', '38', '2018-04-25 16:26:50');
INSERT INTO `order_detail` VALUES ('43', '14', '红烧大闸蟹', '88', '1', '38', '2018-04-25 16:26:50');
INSERT INTO `order_detail` VALUES ('44', '17', '水煮花生米', '16', '1', '40', '2018-04-25 20:32:57');
INSERT INTO `order_detail` VALUES ('45', '18', '剁椒蒜苗', '20', '1', '40', '2018-04-25 20:32:57');
INSERT INTO `order_detail` VALUES ('46', '12', '东坡肉', '50', '1', '40', '2018-04-25 20:33:25');
INSERT INTO `order_detail` VALUES ('47', '13', '干锅土豆片', '30', '1', '40', '2018-04-25 20:33:25');
INSERT INTO `order_detail` VALUES ('48', '16', '双腊味荷兰豆', '48', '1', '40', '2018-04-25 20:33:25');
INSERT INTO `order_detail` VALUES ('49', '14', '红烧大闸蟹', '88', '1', '40', '2018-04-25 20:33:46');
INSERT INTO `order_detail` VALUES ('50', '15', '避风塘炒虾', '42', '1', '40', '2018-04-25 20:33:46');

-- ----------------------------
-- Table structure for receipt
-- ----------------------------
DROP TABLE IF EXISTS `receipt`;
CREATE TABLE `receipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL COMMENT '收货地址',
  `phone` varchar(255) NOT NULL COMMENT '收货手机号',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '收货人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receipt
-- ----------------------------
INSERT INTO `receipt` VALUES ('6', '海淀区清上园小区', '18846792935', '38', '聂');
INSERT INTO `receipt` VALUES ('7', '海淀区清上园小区', '18846792935', '40', '聂某某');
INSERT INTO `receipt` VALUES ('8', '海淀区中关村', '18846792935', '40', '聂某某');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `sex` varchar(255) NOT NULL COMMENT '性别',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `permission` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('38', '聂', '男', '18846792935', '123', '1');
INSERT INTO `user` VALUES ('39', '李', '男', '18846792670', '123', '0');
INSERT INTO `user` VALUES ('40', '聂某某', '男', '18845071994', '123', '0');
INSERT INTO `user` VALUES ('41', '王某某', '男', '15946705900', '123', '0');
INSERT INTO `user` VALUES ('42', '聂某某', '男', '18846792936', '123', '0');
INSERT INTO `user` VALUES ('43', '聂某某', '男', '18846792937', '123', '0');
INSERT INTO `user` VALUES ('44', '聂', '男', '18846792939', '123', '0');
INSERT INTO `user` VALUES ('45', '聂', '男', '18846792930', '123', '0');
