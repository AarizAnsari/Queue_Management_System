import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:queue_management/Pages/history_page.dart';
import 'package:queue_management/Pages/home_page.dart';
import 'package:queue_management/Pages/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index=0;

  List pages = [HomePage(),History(),Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(70, 100, 100, 100),
          child: Image.asset("assets/Qmanager_logo_white.png"),
        ),
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(
          color: Colors.black
        ),
        currentIndex: index,
        onTap: (int i){
          setState(() {
            index = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt),label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
      ),
    );
  }
}
