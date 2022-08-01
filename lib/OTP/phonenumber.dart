import 'package:etec_center/OTP/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../check_auth/fuction_signin.dart';


class Phone_Number extends StatefulWidget {
  const Phone_Number({Key? key}) : super(key: key);

  @override
  State<Phone_Number> createState() => _Phone_NumberState();
}

class _Phone_NumberState extends State<Phone_Number> {
  TextEditingController phonenameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Column(
          children: [
            Container(
                width: 45,
                height: 40,
                margin: const EdgeInsets.only(
                  top: 20,
                  right: 300,
                ),
     
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                    ))),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 50),
              child: const Text("Sign Up With Phone",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Colors.black)),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 20),
                  child: Text(
                    "Enter Phone number:",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  controller: phonenameController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Enter with number +855',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black)),
                )),
            Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.only(left: 10, right: 10, top: 100),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.blueGrey),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  onPressed: () {
                    context
                        .read<Auth>()
                        .sendOtp(context, phone: phonenameController.text)
                        .whenComplete(() => const Code_Phone());
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Code_Phone()));
                  },
                  child: const Text("Submmit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15)),
                ))
          ],
        ),
      ),
    );
  }
}
