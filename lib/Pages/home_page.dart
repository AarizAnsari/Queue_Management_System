import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:queue_management/Screens/shopping_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Color> clr = [Colors.amber,Colors.purpleAccent,Colors.lightGreenAccent,Colors.orange,Colors.lightBlueAccent];
    List<String> offers =["30% OFF","Buy 2 Get 1 Free","40% OFF","50% Cashback","Upto 80% OFF"];
    List<String> discount = ["On Electronics","On Men's Wear","On Grocery Items","On Using RuPay Card","Only For You"];
    return ListView(
      children: [
        SizedBox(height: 20,),
        CarouselSlider(
          options: CarouselOptions(
              height: 150,
            autoPlay: true,
              autoPlayInterval: Duration(seconds: 2)
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: clr[i-1]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text(offers[i-1],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.w500),),
                          Text(discount[i-1],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),)
                        ],
                      ),
                    )
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Shopping()));
              },
                  child: Text("Start Shopping",
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                      )
                  )
              ),
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              GestureDetector(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Choose Location",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Icon(Icons.location_on)
                  ],)
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Offers ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.black,
                        child: Icon(Icons.percent_rounded,size: 15,))
                  ],)
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Coupons ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Icon(Icons.discount)
                  ],)
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ],
    );
  }
}
