import 'package:flutter/material.dart';
import 'package:queue_management/Screens/Authentication/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:queue_management/Screens/home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? email;
  String? _pass;
  String warning = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Padding(
          padding:  const EdgeInsets.fromLTRB(70, 100, 100, 100),
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
                margin:  const EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text("Sign In",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                    Container(height: 3,decoration:  const BoxDecoration(color: Colors.black),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(warning,style:  const TextStyle(color: Colors.red),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                      child: TextFormField(
                        controller: emailController,
                        onChanged: (val){
                          email=val;
                        },
                        cursorColor: Colors.black,
                        decoration:  const InputDecoration(
                            label: Text("Enter Email")
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                      child: TextFormField(
                        controller: passController,
                        onChanged: (val){
                          _pass = val;
                        },
                        cursorColor: Colors.black,
                        obscureText: true,
                        decoration:  const InputDecoration(
                          label: Text("Enter Password"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const Register()));
                      },
                      child:  const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("Sign Up here!"),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () async{
                          const Center(
                            child: AlertDialog(
                              content: CircularProgressIndicator(),
                            ),
                          );
                          FocusScope.of(context).unfocus();
                          try {
                             await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: email.toString(),
                                password: _pass.toString()
                            );
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const Home()));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              setState(() {
                                warning = e.code;
                              });
                            } else if (e.code == 'wrong-password') {
                              setState(() {
                                warning=e.code;
                              });
                            }
                          }
                        },
                        child:  const Text("Sign In",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                      ),
                    )
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
