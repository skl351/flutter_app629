import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print("HomePage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(13),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      padding: EdgeInsets.all(13),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '即将开始的训练营',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 200,
                                  height: 300,
                                  child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        alignment: Alignment.center,
                                        height: 100,
                                        color: Colors.red,
                                        padding: EdgeInsets.all(10),
                                        child: Text('asd'),
                                      );
                                    },
                                  ))
                            ],
                          )
                        ],
                      ))),
            )
          ],
        ));
  }
}
