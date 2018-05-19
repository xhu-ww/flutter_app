import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: new Text("Flutter App")),
        body: new HomePage(),
      ),
    );
  }
}

//主页要展示的内容
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new GridViewState();
}

//得到一个ListView
class ListState extends State {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemCount: 40, itemBuilder: buildItem);
  }

  //ListView的Item
  Widget buildItem(BuildContext context, int index) {
    //设置分割线
    if (index.isOdd) return new Divider();
    //设置字体样式
    TextStyle textStyle =
        new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0);
    return new GestureDetector(
      onTap: () {
        showCustomDialog(context);
      },
      child: new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Text("xhu_ww", style: textStyle),
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          getDialog();
        });
  }

  Widget getDialog() {
    return new AlertDialog(
      title: new Text("点击提示"),
      content: new SingleChildScrollView(
          child: new ListBody(children: <Widget>[new Text("你点击了Item")])),
      actions: <Widget>[
        new FlatButton(
          child: new Text("取消"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: new Text("确认"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class GridViewState extends State {
  @override
  Widget build(BuildContext context) => new GridView.count(
      primary: false,
      padding: const EdgeInsets.all(8.0),
      mainAxisSpacing: 8.0,
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      children: buildGridTileList(5));

  List<Widget> buildGridTileList(int number) {
    List<Widget> widgetList = new List();
    for (int i = 0; i < number; i++) {
      widgetList.add(getItemWidget());
    }
    return widgetList;
  }

  String url =
      "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=495625508,"
      "3408544765&fm=27&gp=0.jpg";

  Widget getItemWidget() {
    //BoxFit 可设置展示图片时 的填充方式
    return new GestureDetector(
      onTap: () {
        showCustomDialog(context);
      },
      child: new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Image(image: new NetworkImage(url), fit: BoxFit.cover),
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text("点击提示"),
            content: new SingleChildScrollView(
                child: new ListBody(children: <Widget>[new Text("你点击了Item")])),
            actions: <Widget>[
              new FlatButton(
                child: new Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text("确认"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
