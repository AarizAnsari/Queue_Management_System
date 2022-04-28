import 'package:flutter/material.dart';
import 'package:queue_management/Screens/Authentication/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:queue_management/Screens/home_screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String email;
  late String _pass;
  String warning = "";

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
      body: SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      height: 3,
                      decoration: const BoxDecoration(color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        warning,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      child: TextFormField(
                        onChanged: (val) {
                          email = val.toString();
                        },
                        cursorColor: Colors.black,
                        decoration:
                            const InputDecoration(label: Text("Enter Email")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      child: TextFormField(
                        onChanged: (val) {
                          _pass = val.toString();
                        },
                        cursorColor: Colors.black,
                        obscureText: true,
                        decoration: const InputDecoration(
                          label: Text("Enter Password"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("Alredy have an account?"),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          const Center(
                            child: Dialog(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email, password: _pass);
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email.toString(),
                                    password: _pass.toString());
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              setState(() {
                                warning = e.code;
                              });
                            } else if (e.code == 'email-already-in-use') {
                              setState(() {
                                warning = e.code;
                              });
                            }
                          }
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
