import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp629/Custom/StarView.dart';

class Twopage extends StatefulWidget {
  Twopage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Twopage> with AutomaticKeepAliveClientMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Twopage");
  }
  List tabs = ["新闻", "历史", "图片"];
  @override
  Widget build(BuildContext context) {
    super.build(context);//必须添加.....        ));
    return new DefaultTabController(
        length: tabs.length,
        child: new Scaffold(
            appBar: AppBar(
              flexibleSpace: SafeArea(
                child: TabBar(   //生成Tab菜单
                    tabs: tabs.map((e) => Tab(text: e)).toList()
                ),
              ),
            ),
    body: new TabBarView(
    children: tabs.map((e) { //分别创建对应的Tab页面
    return Container(
    alignment: Alignment.center,
    child: Text(e, textScaleFactor: 5),
    );
    }).toList(),
    ),
    ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
