import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rider_flutter/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/Api.dart';
import 'api/ApiService.dart';
import 'order.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        cardColor: Colors.orange,
        useMaterial3: true,
      ),
      home: LoginPage(),
      builder: EasyLoading.init(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var phone = "";

  var password = "";
  var mContext = null;

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/login.png',
              height: 200,
              fit: BoxFit.fill,
            ),
            Transform(
              transform: Matrix4.translationValues(0, -60, 0),
              child: Card(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '登录',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: TextField(
                            onChanged: (value) {
                              this.phone = value;
                            },
                            controller: TextEditingController(text: phone),
                            maxLength: 11,
                            decoration: InputDecoration(
                              hintText: '请输入用户名',
                              labelText: '用户名',
                              prefixIcon: Icon(Icons.person),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: TextField(
                            onChanged: (value) {
                              this.password = value;
                            },
                            maxLength: 18,
                            controller: TextEditingController(text: password),
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: '请输入密码',
                              labelText: '密码',
                              prefixIcon: Icon(Icons.lock),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (phone.trim() == '' || password.trim() == '') {
                              const msg = '请输入手机号或者密码';
                              Fluttertoast.showToast(msg: msg);
                            } else {
                              homePage(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            textStyle: TextStyle(fontSize: 16),
                          ),
                          child: const Text(
                            '登录',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    readLogin().then((value) => {
          if (value != null && value) {homePage(mContext)}
        });
    super.initState();
  }

  @override
  void dispose() {
    print("disposed");
    super.dispose();
  }

  void homePage(BuildContext context) {
    saveLogin(true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }

  Future<void> saveLogin(bool isLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', isLogin);
  }

  Future<bool?> readLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool('isLogin');
    return value;
  }
}
