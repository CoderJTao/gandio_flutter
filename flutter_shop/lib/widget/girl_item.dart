import 'package:flutter/material.dart';
import 'package:flutter_shop/config/colors.dart';
import 'package:flutter_shop/models/item_model.dart';

typedef ItemCallback = void Function(ItemModel model);

class GirlItem extends StatefulWidget {
  final ItemModel item;

  @required
  final ItemCallback onPress;

  const GirlItem({Key key, this.onPress, this.item}) : super(key: key);

  @override
  _GirlItemState createState() => _GirlItemState();
}

class _GirlItemState extends State<GirlItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeColor.lightDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onTap: () {
          widget.onPress(widget.item);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ThemeColor.lightDark
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: _itemTitle(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: _itemUser(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: _itemImage(),
              )
            ],
          ),
        ),
      ),
    );
  }

  _itemTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: ThemeColor.textBlue,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Text(
            widget.item.type,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14
            ),
          ),
        ),
        Expanded(
          child: Text(
            widget.item.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white,
                fontSize: 17
            ),
          ),
        )
      ],
    );
  }

  _itemUser() {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 30,
            height: 30,
            child: Image(image: AssetImage('images/avatar.jpg'),),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(widget.item.author, style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }

  _itemImage() {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      height: 220,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image(
          image: (widget.item.images.length == 0
              ? AssetImage('images/drawer_bg.jpg')
              : NetworkImage(widget.item.images.first)),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
