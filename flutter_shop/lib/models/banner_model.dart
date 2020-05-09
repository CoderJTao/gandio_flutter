
/*
{
image: "http://gank.io/images/cfb4028bfead41e8b6e34057364969d1",
title: "干货集中营新版更新",
url: "https://gank.io/migrate_progress"
}
*/

class BannerModel {
  final String image;
  final String title;
  final String url;

  BannerModel({this.image, this.title, this.url});
  
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      image: json['image'],
      title: json['title'],
      url: json['url']
    );
  }
}