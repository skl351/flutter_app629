



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("HomePage");
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);//必须添加.....        ));
   return Scaffold(
     body: Text("HomePage"),
   );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}