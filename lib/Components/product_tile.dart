import 'package:flutter/material.dart';
import 'package:queue_management/services/shopping_list.dart';

class ProdTile extends StatefulWidget {
  ProdTile({required this.name,required this.price,required this.url,required this.index});
  late String name;
  late int price;
  late String url;
  late int index;

  @override
  State<ProdTile> createState() => _ProdTileState(name: name,price: price,url: url,index: index);
}

class _ProdTileState extends State<ProdTile> {
  _ProdTileState({required this.name,required this.price,required this.url,required this.index});
  late String name;
  late int price;
  late String url;
  late int index;

  int pquant =1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.all(1),
      child: ListTile(
        contentPadding: EdgeInsets.all(3),
        tileColor: Colors.white,
        title: Text(name),
        subtitle: Row(
          children: [
            Text("price- "+price.toString()+"/-  "),
            Text("Total- "+(price * pquant).toString())
          ],
        ),
        leading: SizedBox(
          height: 40,
            width: 40,
            child: Image(image: NetworkImage(url),fit: BoxFit.cover,)),
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

}

