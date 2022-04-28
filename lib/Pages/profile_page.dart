import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:queue_management/Screens/Authentication/sign_in_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var error = null;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey[800]
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 45,
                  ),
                  backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL.toString()),
                  backgroundColor: Colors.grey,

                ),
              ),
            ),
            Divider(thickness: 4,color: Colors.black,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("Email- "+FirebaseAuth.instance.currentUser!.email.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
              ),
            ),
            Divider(thickness: 1,color: Colors.black,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("Help",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),
            ),
            Divider(thickness: 1,color: Colors.black,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("Settings",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),
            ),
            Divider(thickness: 1,color: Colors.black,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: ()async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: Text("Log Out",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
