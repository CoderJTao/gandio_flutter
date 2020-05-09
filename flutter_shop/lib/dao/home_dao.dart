

import 'dart:convert';

import 'package:flutter_shop/config/service_list.dart';
import 'package:flutter_shop/models/banner_model.dart';
import 'package:flutter_shop/models/item_model.dart';
import 'package:http/http.dart' as http;

class HomeDao {
  static Future<List<BannerModel>> getBanner() async {
    final response = await http.get(ServiceApi.banner);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // 修复中文乱码
      
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      List<dynamic> lists = result['data'];

      List<BannerModel> banners = [];
      lists.forEach((json) {
        BannerModel model = BannerModel.fromJson(json);
        banners.add(model);
      });
      return banners;
    } else {
      throw Exception('Failed to load home banner.');
    }
  }

  static Future<List<ItemModel>> getCategory(HomeCategory type) async {
    final response = await http.get(ServiceApi.homeCategory(type));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // 修复中文乱码
      
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      List<dynamic> lists = result['data'];

      List<ItemModel> items = [];
      lists.forEach((json) {
        ItemModel model = ItemModel.fromJson(json);
        items.add(model);
      });
      return items;
    } else {
      throw Exception('Failed to load home category.');
    }
  }
}
