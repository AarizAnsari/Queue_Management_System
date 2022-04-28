import 'package:flutter/material.dart';
import 'package:queue_management/Screens/Payment_screen.dart';

class PaymentProcessing extends StatefulWidget {
  const PaymentProcessing({Key? key}) : super(key: key);

  @override
  State<PaymentProcessing> createState() => _PaymentProcessingState();
}

class _PaymentProcessingState extends State<PaymentProcessing> {

  changePage()async{
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Payment()));
  }

  @override
  void initState() {
    changePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      bottomNavigationBar: LinearProgressIndicator(),
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
            ),
            height: 120,
            width: 180,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Processing Payment",
                  style: TextStyle(
                    fontSize: 18
                  ),
                  ),
                  SizedBox(height: 20,),
                  CircularProgressIndicator()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
