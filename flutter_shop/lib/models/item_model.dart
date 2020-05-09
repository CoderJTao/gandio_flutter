/*
{
_id: "5e95907517bf93950887f213",
author: "鸢媛",
category: "Girl",
createdAt: "2020-05-07 08:00:00",
desc: "以前总以为，人生最美好的是相遇。 后来才明白，其实难得的是重逢。 如果说相遇是久别重逢，希望我们别来无恙。",
images:- [
"http://gank.io/images/e0b652d2a0cb46ba888a935c525bd312"
],
likeCounts: 0,
publishedAt: "2020-05-07 08:00:00",
stars: 1,
title: "第78期",
type: "Girl",
url: "http://gank.io/images/e0b652d2a0cb46ba888a935c525bd312",
views: 30
}
*/

class ItemModel {
  final String id;
  final String author;
  final String category;
  final String createdAt;
  final String desc;
  final List<String> images;
  final int likeCounts;
  final String publishedAt;
  final int stars;
  final String title;
  final String type;
  final String url;
  final int views;

  ItemModel({
    this.id, 
    this.author, 
    this.category, 
    this.createdAt, 
    this.desc, 
    this.images, 
    this.likeCounts, 
    this.publishedAt, 
    this.stars, 
    this.title, 
    this.type, 
    this.url, 
    this.views});

  factory ItemModel.fromJson(Map<String, dynamic> json) {   

    List<dynamic> lists = json['images'];
    List<String> imgs = [];
    lists.forEach((str) {
      imgs.add(str);
    });

    return ItemModel(
      id: json['_id'],
      author: json['author'],
      category: json['category'],
      createdAt: json['createdAt'],
      desc: json['desc'],
      images: imgs,
      likeCounts: json['likeCounts'],
      publishedAt: json['publishedAt'],
      stars: json['stars'],
      title: json['title'],
      type: json['type'],
      url: json['url'],
      views: json['views']
    );
  }

}
