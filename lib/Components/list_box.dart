import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queue_management/Components/product_tile.dart';
import 'package:queue_management/services/shopping_list.dart';

class ListBox extends StatefulWidget {
  const ListBox({Key? key}) : super(key: key);

  @override
  State<ListBox> createState() => ListBoxState();
}

class ListBoxState extends State<ListBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-230,
      child: ListView.builder(
        itemCount: shoppingList.length,
          itemBuilder: (_,index){
          return StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection('products').doc(shoppingList[index]).snapshots(),
              builder: (context,snapshot){
                var data = snapshot.data?.data();
              if(snapshot.hasData && data != null){
                  data = data as Map;
                return ProdTile(
                    name: data['name'],
                    price: data['price'],
                    url: data['url'],
                    index: index);
              }
              return SizedBox();
              }
          );
          }
      ),
    );
  }
}
