import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/colors.dart';

typedef DrawerItemCallback = void Function(String data);

class MyDrawer extends StatefulWidget {

  @required
  DrawerItemCallback onPress; //第二种:回调函数的签名，没有参数，也不返回数据。

  //MyCallBackFuture myCallBackFuture;//自定义
  MyDrawer(DrawerItemCallback onPress) {
    this.onPress = onPress;
  }

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  bool isExpand = false;

  List<String> mList = ['首页', '妹纸', '干货', '专题', '留言'];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context, 
        child: Container(
          color: ThemeColor.backDark,
          child: Stack(
            children: <Widget>[
              Image(image: AssetImage('images/drawer_bg.jpg'),),
              Positioned(
                left: 20,
                top: 200,
                child: Container(
                  width: (MediaQuery.of(context).size.width / 3) * 2 - 20,
                  height: 110,
                  decoration: BoxDecoration(
                    color: ThemeColor.lightDark,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(image: AssetImage('images/avatar.jpg'),width: 60, height: 60,)
                        ),
                      ),
                      Container(
                        alignment: Alignment(0, 0),
                        width: 80,
                        height: 24,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: ThemeColor.textBlue),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Text(
                          '立即登录',
                          style: TextStyle(
                            color: ThemeColor.textBlue,
                            fontSize: 14
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 330,
                child: Container(
                  width: (MediaQuery.of(context).size.width / 3) * 2 - 20,
                  height: MediaQuery.of(context).size.height - 330 - 64,
                  decoration: BoxDecoration(
                    color: ThemeColor.lightDark,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: _itemList(),
                ),
              )
            ],
          )
        )
      ),
    );
  }

  _itemList() {
    List<Widget> useList = [];
    mList.forEach((title) {
      bool isMore = title == '干货';

      Widget widget;
      if (isMore) {
        widget = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _item(title),
            isExpand 
              ? Icon(Icons.arrow_drop_up, color: ThemeColor.textBlue,)
              : Icon(Icons.arrow_drop_down, color: Colors.white,)
          ],
        );
        useList.add(widget);
        if (isExpand) {
          widget = _item('iOS');
          useList.add(widget);
          widget = _item('Android');
          useList.add(widget);
          widget = _item('flutter');
          useList.add(widget);
        }
      } else {
        widget = _item(title);
        useList.add(widget);
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: useList,
    );
  }

  _item(String title) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 20),
      height: 50,
      child: GestureDetector(
        onTap: () {
          _handleItemTap(title);
        },
        child: Container(
          width: (MediaQuery.of(context).size.width / 3) * 2 - 75,
          child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
        ),
      )
    );
  }

  _handleItemTap(String title) {
    if (title == '干货') {
      setState(() {
        isExpand = !isExpand;
      });
    } else {
      widget.onPress(title);
    }
  }
}