import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:queue_management/Components/product_tile.dart';
import 'package:queue_management/Screens/payment_option_screen.dart';
import 'package:queue_management/Screens/scan_product.dart';
import 'package:queue_management/services/shopping_list.dart';

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(70, 100, 100, 100),
          child: Image.asset("assets/Qmanager_logo_white.png"),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentOptions()));
                },
                child: const Text(
                  "Save to Cart",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentOptions()));
                },
                child: const Text(
                  "Check Out",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton.icon(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const ScanProduct()));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: const Text(
                "Add Item ",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 230,
            child: ListView.builder(
                itemCount: shoppingList.length,
                itemBuilder: (_, index) {
                  if(shoppingList.isNotEmpty){
                    return StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('products')
                            .doc(shoppingList[index])
                            .snapshots(),
                        builder: (context, snapshot) {
                          var data = snapshot.data?.data();
                          if (snapshot.hasData && data != null) {
                            data = data as Map;
                            int pquant = 0;
                            return Padding(
                              padding:EdgeInsets.all(1),
                              child: ListTile(
                                contentPadding: EdgeInsets.all(3),
                                tileColor: Colors.white,
                                title: Text(data['name']),
                                subtitle: Row(
                                  children: [
                                    Text("price- "+data["price"].toString()+"/-  "),
                                    Text("Total- "+(data["price"]* pquant).toString())
                                  ],
                                ),
                                leading: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image(image: NetworkImage(data["url"]),fit: BoxFit.cover,)),
                                trailing: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 30,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 29,
                                          child: TextButton(onPressed: (){
                                            if(pquant>0){setState(() {
                                              pquant--;
                                            });}
                                            if(pquant==0){
                                              setState(() {
                                                shoppingList.removeAt(index);
                                              });
                                            }
                                          },
                                              child: Text("-",style: TextStyle(color: Colors.white),)),
                                        ),
                                        SizedBox(width: 30,
                                          child: Center(child: Text(pquant.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)),),
                                        SizedBox(width: 29,
                                          child: TextButton(onPressed: (){
                                            setState(() {
                                              pquant++;
                                            });
                                          },
                                              child: Text("+",style: TextStyle(color: Colors.white),)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        });
                  }
                  else return SizedBox();
                }),
          )
        ],
      ),
    );
  }
}
