import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lab_firebas/screens/login_screen.dart';
import 'package:flutter_lab_firebas/services/auth_service.dart';

class CreateAccountScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthService _service = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("สร้างบัญชีใหม่"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  "https://tse3.mm.bing.net/th?id=OIP.Y7kmZR6x6Pi2QBAXPOYp4AHaHa&pid=Api&P=0"),
            ),
            TextField(
  controller: _emailController,
  decoration: InputDecoration(
    hintText: 'อีเมล',
    prefixIcon: Icon(Icons.email),
  ),
),
SizedBox(height: 10),
TextField(
  controller: _passwordController,
  obscureText: true,
  decoration: InputDecoration(
    hintText: 'รหัสผ่าน',
    prefixIcon: Icon(Icons.lock),
  ),
),
SizedBox(height: 20),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  bool res = await _service.register(
                      _emailController.text, _passwordController.text);
                  if (res) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Account Created")));
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
                },
                child: const Text("สร้างบัญชี"))
          ],
        ),
      ),
    );
  }
}
