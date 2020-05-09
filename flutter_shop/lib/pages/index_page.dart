import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/config/colors.dart';
import 'package:flutter_shop/pages/home_page.dart';
import 'package:flutter_shop/widget/my_drawer.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool isSearchExpand = false;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeColor.lightDark,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white,),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(
          '干货集中营',
          style: TextStyle(color: Colors.white, fontSize: 17)
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              isSearchExpand ? Icons.close : Icons.search, 
              color: isSearchExpand ? Colors.blue : Colors.white,),
            onPressed: _navSearchTapped,
          )
        ],
      ),
      drawer: MyDrawer(onPress),
      body: _bodyBuild(),
    );
  }

  void onPress(String itemTitle) {
    print(itemTitle);
  }

  _bodyBuild() {
    return Stack(
      children: <Widget>[
        HomePage(),
        isSearchExpand
          ? Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                color: ThemeColor.lightDark,
                child: _searchBody(),
              ),
            )
          : Container(
              width: 0,
              height: 0,
              child: Text(''),
          )
      ],
    );
  }

  _navSearchTapped() {
    setState(() {
      isSearchExpand = !isSearchExpand;
    });
  }

  _searchBody() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              '请输入搜索关键词并按回车键...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      );
  }
}


