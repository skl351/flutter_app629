import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Threepage extends StatefulWidget {
  Threepage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Threepage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Threepage");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); //必须添加.....        ));
    return Scaffold(
      body: GridView.count(
        padding:const EdgeInsets.all(20.0),
        crossAxisSpacing: 10.0,
        crossAxisCount: 3,
      children: <Widget>[
          const Text('I am Jspang'),
          const Text('I love Web'),
          const Text('jspang.com'),
          const Text('我喜欢玩游戏'),
          const Text('我喜欢看书'),
          const Text('我喜欢吃火锅')
        ],
      )

    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
