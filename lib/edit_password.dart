import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rider_flutter/api/Api.dart';
import 'package:rider_flutter/api/ApiService.dart';

class UpdatePasswordPage extends StatefulWidget {
  UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _passwordAgainController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('修改密码'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/userback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    buildInputField("新密码", "请输入新密码", true),
                    const Divider(
                      height: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    buildInputField("确认密码", "确认输入新密码", false),
                    const Divider(
                      height: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            String newPassword =
                                _passwordController.text.trim();
                            String passAgain =
                                _passwordAgainController.text.trim();
                            if (newPassword != "" && passAgain != "") {
                              if (newPassword != passAgain) {
                                Fluttertoast.showToast(msg: '两次输入密码不一致');
                              } else {
                                EasyLoading.show();
                                Map<String, dynamic> data = {
                                  "id": "undefined",
                                  "newPassword": newPassword
                                };
                                try {
                                  var res = await ApiService.put(
                                      Api.UPDATE_PASSWORD, data);
                                  Navigator.pop(context);
                                  EasyLoading.dismiss();
                                } catch (e) {
                                  EasyLoading.dismiss();
                                  Fluttertoast.showToast(msg: Api.ERROR);
                                }
                              }
                            } else {
                              Fluttertoast.showToast(msg: '请输入密码');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: const Text(
                            '提交',
                            style: TextStyle(color: Colors.white),
                          ),
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
    );
  }

  Widget buildInputField(String label, String hintText, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 67, 64, 64),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller:
                  isPassword ? _passwordController : _passwordAgainController,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(fontSize: 15),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
