import 'package:flutter/material.dart';
import 'package:queue_management/services/shopping_list.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25,),
                Center(
                  child: Text("Thankyou",
                  style: TextStyle(
                    fontSize: 52
                  ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text("For helping us get better",
                  style: TextStyle(
                    fontSize: 22
                  ),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Currently the app is in development stage and we are open to your suggestions, opinions and advices.",
                    style: TextStyle(
                        fontSize: 22
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Feel free to contact us at:\n\npingintelligence2022@gmail.com",
                    style: TextStyle(
                        fontSize: 22
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
