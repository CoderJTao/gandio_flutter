import 'package:flutter/material.dart';
import 'package:flutter_shop/config/colors.dart';
import 'package:flutter_shop/pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.grey
        ),
        home: IndexPage(),
      ),
    );
  }
}

