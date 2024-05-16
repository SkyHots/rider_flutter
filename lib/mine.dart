import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rider_flutter/edit_password.dart';
import 'package:rider_flutter/main.dart';
import 'package:rider_flutter/qulifaction.dart';
import 'package:rider_flutter/widget/CustomDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xE8EF6C00),
                  Color(0xBCFF9100),
                ],
              ),
            ),
          ),
          title: const Align(
            alignment: Alignment.center,
            child: Text(
              '我的',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Container(
            color: const Color(0xFFF5F5F5),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              "assets/images/userimage.png",
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "张三",
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PassQualificationUploadPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(8),
                    height: 50,
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'assets/images/qualifications.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          '通行资质上传',
                          style: TextStyle(color: Color(0xFF454545)),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/arrow_right.png',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdatePasswordPage()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'assets/images/pass.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          '修改密码',
                          style: TextStyle(color: Color(0xFF454545)),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/arrow_right.png',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showLogout(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.logout,
                          size: 24,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          '退出登录',
                          style: TextStyle(color: Color(0xFF454545)),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/arrow_right.png',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }

  void showLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: "退出登录",
          content: "确定要退出吗？",
          onConfirm: () {
            saveLogin(false);
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  Future<void> saveLogin(bool isLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', isLogin);
  }
}
