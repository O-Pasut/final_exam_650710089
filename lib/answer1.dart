import 'package:flutter/material.dart';

class Answer1 extends StatelessWidget {
  const Answer1({super.key});

  Widget getListTile(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(text),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("โปรไฟล์ผู้ใช้"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://www.kasandbox.org/programming-images/avatars/leaf-blue.png",
                      ),
                    ),
                    SizedBox(height: 20),
                    const Text(
                      "ชื่อผู้ใช้: John Doe",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5),
                    const Text(
                      "อีเมล: johndoe@example.com",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              getListTile(Icons.settings, "การตั้งค่า"),
              getListTile(Icons.lock, "เปลี่ยนรหัสผ่าน"),
              getListTile(Icons.privacy_tip_rounded, "ความเป็นส่วนตัว"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("แก้ไขโปรไฟล์")));
                },
                child: const Text("แก้ไขโปรไฟล์"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("ออกจากระบบ")));
                },
                child: const Text("ออกจากระบบ"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
