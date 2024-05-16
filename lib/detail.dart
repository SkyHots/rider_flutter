import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tencent_map_flutter/tencent_map_flutter.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<StatefulWidget> createState() => OrderDetailState();
}

class OrderDetailState extends State<OrderDetailPage> {
  var data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              AppBarLayout(),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
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
                            left: 12.5,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '桂桂茶',
                                        style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
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
                          Positioned(
                            top: 10,
                            right: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    callShop();
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/call.png",
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.fill,
                                      ),
                                      Text(
                                        '电话',
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    navShop();
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/guide.png",
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.fill,
                                      ),
                                      Text(
                                        '导航',
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  ),
                                )
                              ],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                          Positioned(
                            top: 85,
                            right: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    callShop();
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/call.png",
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.fill,
                                      ),
                                      Text(
                                        '电话',
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    navShop();
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/guide.png",
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.fill,
                                      ),
                                      Text(
                                        '导航',
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const PickupCodeWidget(),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 40,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '配送明细',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 1,
                          color: Color(0x33979797),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '商品详情',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '韩式炸鸡',
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '实付金额',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '￥25.00',
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '配送费',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '￥25.00',
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '订单编号',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '456123428541',
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '下单时间',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '2024-05-02 09:32:56',
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 92),
                ],
              ),
            ],
          )),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ButtonContainer(),
          ),
          Positioned(
            top: 10,
            child: FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              elevation: 0,
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }

  void callShop() {
    Fluttertoast.showToast(msg: "call");
  }

  void navShop() {
    Fluttertoast.showToast(msg: "nav");
  }
}

class PickupCodeWidget extends StatelessWidget {
  const PickupCodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 335,
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '到店提货码',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Divider(
            height: 0.5,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(height: 20),
          Image.asset(
            "assets/images/def.png",
            width: 160,
            height: 160,
          ),
          SizedBox(height: 20),
          const Text(
            '提  示：',
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 12,
            ),
          ),
          const Text(
            '骑手凭提货码，到达店铺进行扫码取货',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 12,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                // Replace with your desired color
                fixedSize: Size(double.infinity, 30),
              ),
              child: Text(
                '确认取货',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SupportMapFragment(),
    );
  }
}

class SupportMapFragment extends StatelessWidget {
  const SupportMapFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: 56,
      width: double.infinity,
      child: Expanded(
        flex: 1,
        child: Center(
          child: Text(''),
        ),
      ),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 12),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.orange, width: 0.5),
                  ),
                  child: Text(
                    '联系顾客',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 12),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white),
                  child: Text('接单'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
