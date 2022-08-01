import 'package:etec_center/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../OTP/phonenumber.dart';
import '../app/widget/custom_button.dart';
import '../app/widget/custom_textfield.dart';
import '../check_auth/fuction_signin.dart';
import 'Reset_passwrd.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isPasswordMatched = false;
  final bool _emailvalidate = false;
  final bool _passvalidate = false;
  late String email;
  late String password;
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 20,
            ),
            width: 250,
            height: 190,

            child: Image.asset("images/sign in.png"),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Center(
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
            child: Custom_Textfield(
              controller: emailcontroller,
              hintText: "Email @gmail.com",
              onChanged: (value) => setState(() {
                email=value!;
              }),
              errorText: _emailvalidate ? "Invalid Code" : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: PasswordField(
              controller: passwordcontroller,
              hintText: "Password",
              onChanged: (value) => setState(() {
                password = value!;
              }),
              errorText: _passvalidate ? "Invalid Code" : null,
              iconButton: IconButton(
                icon: isPasswordMatched
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: () => setState(() {
                  isPasswordMatched = !isPasswordMatched;
                }),
              ),
              obscureText: isPasswordMatched,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButtontext(
                  titleButton: "Forgot Password?",
                  titlebuttonColor: Colors.indigo,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Reset_Password()));
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButtontext(
              onPressed: signIn,
              // () {
              //   context
              //       .read<Auth>()
              //       .signIn()
              //       .whenComplete(() => const Homepage());
              // },
              hightButton: 50,
              widthButton: 350,
              titleButton: "Log in",
              buttonColor: Colors.indigo,
              radiusButton: 10,
            ),
          ),
           const Padding(
             padding: EdgeInsets.all(8.0),
             child: Text("___ OR ___",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
           ),
          Container(
            margin: const EdgeInsets.only(left: 80, right: 80,top: 20),
            height: 40,
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ))),
                onPressed: () {
                  context.read<Auth>().signInWithGoogle(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Continue With google",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset("images/google.png"))
                  ],
                )),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 80, right: 80, top: 20, bottom: 30),
            height: 40,
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Phone_Number()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Continue With Phone",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset("images/phone.png"))
                  ],
                )),
          ),
          
        ]),
      )),
    );
  }
  // function for login with email password
   Future signIn() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // TODO
      print(e);
    }
  }
}
