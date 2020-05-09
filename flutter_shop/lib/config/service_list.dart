class ServiceApi {
  // 轮播图 GET
  static const String banner = 'https://gank.io/api/v2/banners';

  // 首页分类下数据  GET
  //'https://gank.io/api/v2/data/category/GanHuo/type/Android/page/1/count/10';
  static String homeCategory(HomeCategory type, {int page = 1, int count = 10}) {
    List<String> category = [
      'hot',
      'girl',
      'iOS',
      'Android',
      'Flutter',
      'frontend',
      'backend',
      'app'
    ];

    switch (type) {
      case HomeCategory.hot:
        return 'https://gank.io/api/v2/hot/views/category/Article/count/${count}';
        break;
      case HomeCategory.girl:
        return 'https://gank.io/api/v2/data/category/Girl/type/Girl/page/${page}/count/${count}';
        break;
      default:
        String p = category[type.index] ?? 'iOS';
        return 'https://gank.io/api/v2/data/category/GanHuo/type/${p}/page/${page}/count/${count}';
    }
  }
}

enum HomeCategory {
  hot,
  girl,
  ios,
  android,
  flutter,
  frontend,
  backend,
  app
}