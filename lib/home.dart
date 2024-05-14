import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _timer;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    startPolling();
  }

  @override
  void dispose() {
    stopPolling();
    super.dispose();
  }

  void startPolling() {
    const duration = Duration(milliseconds: 1);
    _timer = Timer.periodic(duration, (Timer timer) {
      setState(() => _counter++);
    });
  }

  void stopPolling() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF3366FF), // 渐变起始颜色
                      Color(0xFF00CCFF), // 渐变结束颜色
                    ],
                  ),
                ),
              ),
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  'Home',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              backgroundColor: Colors.white,
              bottom: TabBar(
                tabs: [
                  Tab(text: '新任务'),
                  Tab(text: '待取货'),
                  Tab(text: '配送中'),
                  Tab(text: '已完成'),
                ],
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                dividerColor: Colors.black12,
              ),
            ),
            body: TabBarView(
              children: [
                buildList('新任务'),
                buildList('待取货'),
                buildList('配送中'),
                buildList('已完成')
              ],
            ),
          ),
        ));
  }

  ListView buildList(String tabName) {
    return ListView.builder(
      itemCount: 10, // 这里设置要显示的任务数量
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // 阴影颜色
                spreadRadius: 2, // 扩散半径
                blurRadius: 2, // 模糊半径
                offset: Offset(0, 3), // 阴影偏移量 (x, y)
              ),
            ],
            color: Colors.white,
            // border: Border.all(color: Colors.blue, width: 0.5),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/receivingordersimg.png',
                    height: 25,
                    width: 25,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 3.0),
                  Text('(已超时,原定时间(13:12)送达)'),
                  Spacer(),
                  Image.asset(
                    'assets/images/integral.png',
                    height: 20,
                    width: 20,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 3.0),
                  Text('0'),
                ],
              ),
              Container(
                height: 150,
                width: double.infinity,
                child: Stack(
                  children: [
                    // Shop Icon
                    Positioned(
                      left: 0,
                      top: 25,
                      child: Image.asset(
                        'assets/images/shop.png',
                        // Update the path according to your asset directory
                        height: 25,
                        width: 25,
                        fit: BoxFit.contain,
                      ),
                    ),
                    // Vertical Divider
                    Positioned(
                      left: 12.5, // 25 + 12.5
                      top: 50,
                      bottom: 40,
                      child: Container(
                        width: 1,
                        color: Colors.orange, // Update with the actual color value
                      ),
                    ),
                    // People Icon
                    Positioned(
                      left: 0,
                      bottom: 25,
                      child: Image.asset(
                        'assets/images/people.png',
                        // Update the path according to your asset directory
                        height: 25,
                        width: 25,
                        fit: BoxFit.contain,
                      ),
                    ),
                    // Top RelativeLayout equivalent
                    Positioned(
                      left: 40,
                      top: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 75,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '桂桂茶',
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      // Update with the actual color value
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  '交通中心靠南步段大洋洲街L1-11号商户',
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Bottom RelativeLayout equivalent
                    Positioned(
                      left: 40,
                      top: 75,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 75,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '陈先生',
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      // Update with the actual color value
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  '桂桂茶(交通中心店)',
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
