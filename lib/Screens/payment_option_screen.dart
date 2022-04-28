import 'package:flutter/material.dart';
import 'package:queue_management/Screens/Payment_screen.dart';
import 'package:queue_management/Screens/payment_processing.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    navigator(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PaymentProcessing()));
    }

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Choose Payment Option",
        style: TextStyle(
          color: Colors.white
        ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
                onPressed: (){
                  navigator();
                },
                icon: Icon(Icons.phone_android,size: 40,),
                label: Text("Pay With UPI",
                style: TextStyle(
                  fontSize: 20
                ),
                )),
          ),
          Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
                onPressed: (){
                  navigator();
                },
                icon: Icon(Icons.credit_card_outlined,size: 40,),
                label: Text("Pay Credit Card",
                  style: TextStyle(
                      fontSize: 20
                  ),
                )),
          ),
          Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
                onPressed: (){
                  navigator();
                },
                icon: Icon(Icons.credit_card_outlined,size: 40,),
                label: Text("Pay Debit Card",
                  style: TextStyle(
                      fontSize: 20
                  ),
                )),
          ),
          Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
                onPressed: (){
                  navigator();
                },
                icon: Icon(Icons.monitor,size: 40,),
                label: Text("Net Banking",
                  style: TextStyle(
                      fontSize: 20
                  ),
                )),
          ),
          Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
                onPressed: (){
                  navigator();
                },
                icon: Icon(Icons.attach_money_sharp,size: 40,),
                label: Text("Pay Cash At Counter",
                  style: TextStyle(
                      fontSize: 20
                  ),
                )),
          ),
          Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
