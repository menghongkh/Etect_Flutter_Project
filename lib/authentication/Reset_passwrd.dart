import 'package:etec_center/authentication/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../app/widget/custom_button.dart';
import '../app/widget/custom_textfield.dart';

class Reset_Password extends StatefulWidget {
  const Reset_Password({Key? key}) : super(key: key);

  @override
  State<Reset_Password> createState() => _Reset_PasswordState();
}

class _Reset_PasswordState extends State<Reset_Password> {
  TextEditingController emailcontroller = TextEditingController();
    final bool _emailvalidate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          
          children: [
            Row(
              children:  [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon:const Icon(Icons.arrow_back_ios_new_outlined,size: 20,color:Colors.black ,),onPressed: (){
                    Navigator.pop(context);

                  },)
                ),
              ],
            ),
          Container(
            margin: const EdgeInsets.only(
              top: 0,
              left: 20,
            ),
            width: 250,
            height: 200,
            child: Image.network(
                "https://inextrix.com/wp-content/uploads/2019/08/SIP_Dialer_product_V1.png"),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Center(
              child: Text(
                "Reset Password",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
            child: Custom_Textfield(
              controller: emailcontroller,
              hintText: "Email @gmail.com",
            
              errorText: _emailvalidate ? "Invalid Code" : null,
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButtontext(
              onPressed: resetPassword,
              // () {
              //   context
              //       .read<Auth>()
              //       .signIn()
              //       .whenComplete(() => const Homepage());
              // },
              hightButton: 50,
              widthButton: 350,
              titleButton: "Reset Password",
              buttonColor: Colors.indigo,
              radiusButton: 10,
            ),
          ),
        ]
        )
          )
      )
    );
  }
  // function sent password new
   Future resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailcontroller.text.trim(),
        
      );
    debugPrint("success Sent");
    } on FirebaseAuthException catch (e) {
      // TODO
      print(e);
    }
  }
}