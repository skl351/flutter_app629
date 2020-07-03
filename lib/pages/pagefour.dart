import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp629/common/api.dart';
import 'package:flutterapp629/entity/maindata.dart';
import 'package:flutterapp629/http/httpUtil.dart';

class Fourpage extends StatefulWidget {
  Fourpage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Fourpage>
    with AutomaticKeepAliveClientMixin {
  List<List_item> datas = List();

  @override
  void initState() {
    super.initState();
    _handleRefresh();
    print("fourpage");
  }
  List tabs = ["动态", "即将开始"];
  @override
  Widget build(BuildContext context) {
//    print(window.physicalSize);     //获取屏幕尺寸px----1080.0, 2196.0
//    print(window.devicePixelRatio); //设备像素比----3
//    print(MediaQuery.of(context).size);  //获得的是dp单位:360.0, 732.0

    return DefaultTabController(
      length: tabs.length,
      child:      Scaffold(
          appBar: AppBar(
            flexibleSpace: SafeArea(
              child: TabBar(   //生成Tab菜单
                  tabs: tabs.map((e) => Tab(text: e)).toList()
              ),
            ),
          ),
          backgroundColor: Colors.grey,
          body: TabBarView(
            children: tabs.map((e) { //分别创建对应的Tab页面
              return Container(
                alignment: Alignment.center,
                child:  RefreshIndicator(
                    onRefresh: _handleRefresh,
                    child: ListView.builder(
                        itemCount: datas.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.white),
                            child: GestureDetector(
                              child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6.0),
                                        child: Image.network(datas[index].avatar),
                                      ),
                                      width: 100,
                                      height: 100,
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                              child: Text(
                                                datas[index].title,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                ),
                                              )),
                                          Expanded(
                                              child: Text(
                                                '营主    ' + datas[index].masterName,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.black,
                                                ),
                                              )),
                                          Expanded(
                                              child: Text(
                                                '周期    ' +
                                                    datas[index].campDay.toString() +
                                                    '天',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.black,
                                                ),
                                              )),
                                          Expanded(
                                              child: Row(
                                                children: [
                                                  Text(datas[index].memberNum +
                                                      '人报名  |  ' +
                                                      datas[index].stopDay)
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.bottomRight,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(30.0),
                                            child: Container(
                                              width: 50,
                                              height: 20,
                                              alignment: Alignment.center,
                                              color: Colors.red,
                                              child: Text('asd',
                                                  style: TextStyle(color: Colors.white)),
                                            )
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: vonclzick,
                            ),
                          );
                        })),
              );
            }).toList(),
          ),

      ),
    );

  }

  Future<Null> _handleRefresh() async {
    try {
      var repost = await HttpUtil().post("",
          data: {"service": Api.MAINLIST, "currentpage": 1, "pagesize": 10});
      setState(() {
        datas = Maindata.map(jsonDecode(repost.toString())).data.list;
      });
    } catch (e) {
      print(e);
    }
  }

  void vonclzick() {
    Navigator.of(context).pushNamed('/a');
  }

  @override
  bool get wantKeepAlive => true;
}
