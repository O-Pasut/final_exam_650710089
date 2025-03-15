import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Adjust shadow visibility
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://i.pinimg.com/736x/c2/b8/4c/c2b84c5efcd83e5f72ff92f6a6c626eb.jpg",
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Pasut Ounthaisong",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "[ 650710089 ]",
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.email,
                color: const Color.fromARGB(255, 236, 183, 102),
              ),
              SizedBox(width: 5),
              Text("ounthaisong_p@su.ac.th"),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.phone,
                color: const Color.fromARGB(255, 236, 183, 102),
              ),
              SizedBox(width: 5),
              Text("099-190-1322"),
            ],
          ),
        ],
      ),
    );
  }
}
