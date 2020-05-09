import 'package:flutter/material.dart';
import 'package:flutter_shop/config/colors.dart';
import 'package:flutter_shop/config/service_list.dart';
import 'package:flutter_shop/dao/home_dao.dart';
import 'package:flutter_shop/models/banner_model.dart';
import 'package:flutter_shop/models/item_model.dart';
import 'package:flutter_shop/widget/card_item.dart';
import 'package:flutter_shop/widget/girl_item.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<BannerModel> banners;
  List<String> category = ['最热', '妹纸', 'iOS', 'Android', 'Flutter', '前端', '后端', 'App'];
  Map<String, List<ItemModel>> itemList = {
    '最热': [],
    '妹纸': [],
    'iOS': [],
    'Android': [],
    'Flutter': [],
    '前端': [],
    '后端': [],
    'App': []
  };

  @override
  void initState() {
    _loadData();
    _loadCategory();
    super.initState();
  }

  _loadData() {
    HomeDao.getBanner().then((List<BannerModel> list) {
      setState(() {
        banners = list;
      });
    });
  }

  _loadCategory({HomeCategory type = HomeCategory.hot}) {
    String key = category[type.index];
    HomeDao.getCategory(type).then((List<ItemModel> list) {
      setState(() {
        itemList[key] = list;
      });
    });
  }

  void _subTitleTapped(String subTitle) {
    int selected = category.indexOf(subTitle);
    if (selected != currentIndex) {
      setState(() {
        currentIndex = selected;
        _loadCategory(type: HomeCategory.values[currentIndex]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.backDark,
      body: ListView(
          scrollDirection: Axis.vertical,
          children: _listTotal()
      ),
    );
  }

  List<Widget> _listTotal() {
    List<Widget> totalList = [];

    totalList.add(_banner);
    totalList.add(_subTitle);

    totalList.addAll(_itemBuild());

    return totalList;
  }

  List<Widget> _itemBuild() {
    List<Widget> cards = [];

    String key = category[currentIndex];
    List<ItemModel> items = itemList[key];

    items.forEach((item) {
      Widget card = Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: currentIndex == 1
          ? GirlItem(
              item: item,
              onPress: (model) {

              }
            )
          : CardItem(
            item: item,
            onPress: (model) {

            },
          )
      );
      cards.add(card);
    });

    return cards;
  }

  Widget get _banner {
    return Container(
      color: ThemeColor.lightDark,
      child: Container(
        height: 180,
        child: Swiper(
          autoplay: true,
          itemCount: banners?.length ?? 0,
          pagination: new SwiperPagination(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                BannerModel model = banners[index];

              },
              child: Image.network(
                banners[index].image,
                fit: BoxFit.fitWidth,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget get _subTitle {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 6, 0, 12),
      child: Container(
        color: ThemeColor.backDark,
        height: 40,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: category.map((title){
            return _subTitleBuild(title);
          }).toList(),
        ),
      ),
    );
  }

  Widget _subTitleBuild(String subTitle) {
    String selected = category[currentIndex];
    bool isSelected = selected == subTitle;
    return GestureDetector(
      onTap: () {
        _subTitleTapped(subTitle);
      },
      child: Container(
        color: (isSelected ? ThemeColor.textBlue : ThemeColor.backDark),
        width: 60,
        height: 40,
        child: Center(child: Text(subTitle, style: TextStyle(color: (isSelected ? Colors.white : ThemeColor.textGrey)),)),
      ),
    );
  }

  void onPress(String itemTitle) {
    print(itemTitle);
  }
}