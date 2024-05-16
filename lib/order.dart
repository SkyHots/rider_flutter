import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rider_flutter/detail.dart';
import 'package:rider_flutter/widget/CustomDialog.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int status = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xE8EF6C00),
                      Color(0xBCFC9203),
                    ],
                  ),
                ),
              ),
              title: SizedBox(
                height: kToolbarHeight, // 使用AppBar的高度作为父容器高度
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          (status == 0) ? '待签到' : '开工中...',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          if (status == 1) {
                            siginOut(context);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Color(0xFFEDEDED), // 自定义背景颜色
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                status == 0
                                    ? 'assets/images/image6.png'
                                    : 'assets/images/image7.png',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                status == 0 ? '离线' : '在线',
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Image.asset(
                                'assets/images/expand.png',
                                width: 16,
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              bottom: const TabBar(
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
            body: (status == 0)
                ? Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(bottom: 30),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            onPressed: () {
                              if (status == 0) {
                                setState(() {
                                  status = 1;
                                });
                              }
                            },
                            child: const Text(
                              '签到',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: Color(0XFFF5F5F5),
                    child: TabBarView(
                      children: [
                        buildList('新任务'),
                        buildList('待取货'),
                        buildList('配送中'),
                        buildList('已完成')
                      ],
                    ),
                  ),
          ),
        ));
  }

  void siginOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: "提示",
          content: "你确定要签退吗？",
          onConfirm: () {
            setState(() {
              status = 0;
            });
            Navigator.of(context).pop();
          },
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  ListView buildList(String tabName) {
    return ListView.builder(
      itemCount: 10, // 这里设置要显示的任务数量
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderDetailPage()));
          },
          child: Container(
            margin: index == 0
                ? const EdgeInsets.fromLTRB(16, 16, 16, 8)
                : const EdgeInsets.fromLTRB(16, 8, 16, 8),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // 阴影颜色
                  spreadRadius: 1, // 扩散半径
                  blurRadius: 1, // 模糊半径
                  offset: Offset(0, 1), // 阴影偏移量 (x, y)
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
                    const SizedBox(width: 3.0),
                    const Text('(已超时,原定时间(13:12)送达)'),
                    const Spacer(),
                    Image.asset(
                      'assets/images/integral.png',
                      height: 20,
                      width: 20,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 3.0),
                    const Text('0'),
                  ],
                ),
                SizedBox(
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
                          color: Colors
                              .orange, // Update with the actual color value
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
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 75,
                          child: Column(
                            children: [
                              const Expanded(
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
                                  child: const Text(
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
                              const Expanded(
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
                                  child: const Text(
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
          ),
        );
      },
    );
  }
}
