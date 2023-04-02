import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab_firebas/main.dart';
import 'package:flutter_lab_firebas/screens/create_account_screen.dart';
import 'package:flutter_lab_firebas/services/auth_service.dart';


class LoginScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthService _service = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ลงชื่อเข้าใช้งาน"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 90,
              backgroundImage: NetworkImage(
                  "https://t4.ftcdn.net/jpg/02/36/21/65/360_F_236216557_ReuukIEzoqTfhTMbTmaLF9l0LEaIaYsr.webp"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: "อีเมล"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: "รหัสผ่าน"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  bool res = await _service.login(
                      _emailController.text, _passwordController.text);
                  if (res) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Logged in")));

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyHomePage(title: 'ข้อมูลนักศึกษา')));
                  }
                },
                child: const Text("เข้าสู่ระบบ")),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CreateAccountScreen()));
              },
              child: const Text("ไม่มีบัญชี? สร้างบัญชี >>"),
            )
          ],
        ),
      ),
    );
  }
}