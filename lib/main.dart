import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp629/pages/pagefour.dart';

import 'pages/pageone.dart';
import 'pages/pagethree.dart';
import 'pages/pagetwo.dart';
import 'res/strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/a':(BuildContext context) => new Twopage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var pages = <Widget>[
    HomePage(),
    Twopage(),
    Threepage(),
    Fourpage(),
  ];
  int _selectedIndex = 0;
  var _pageController = PageController(initialPage: 0);
  String title = YStrings.appName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LogUtil.init(tag: "tag",isDebug: true,maxLen: 128);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: PageView.builder(
        onPageChanged: _pageChange,
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return pages.elementAt(_selectedIndex);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(YStrings.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_list),
            title: Text(YStrings.tree),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.low_priority),
            title: Text(YStrings.navi),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.label),
            title: Text(YStrings.project),
          ),
        ],
        //当前选中下标
        currentIndex: _selectedIndex,
        //显示模式
        type: BottomNavigationBarType.fixed,
        //选中颜色
        fixedColor: Theme.of(context).primaryColor,
        //点击事件
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    //bottomNavigationBar 和 PageView 关联
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
  void _pageChange(int index) {
    setState(() {
      _selectedIndex = index;
      //根据下标修改标题
      switch (index) {
        case 0:
          title = YStrings.appName;
          break;
        case 1:
          title = YStrings.tree;
          break;
        case 2:
          title = YStrings.navi;
          break;
        case 3:
          title = YStrings.project;
          break;
      }
    });
  }
}
