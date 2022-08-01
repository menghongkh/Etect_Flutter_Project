import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'package:provider/provider.dart';

import '../check_auth/fuction_signin.dart';


class Code_Phone extends StatefulWidget {
  const Code_Phone({Key? key}) : super(key: key);

  @override
  State<Code_Phone> createState() => _Code_PhoneState();
}

class _Code_PhoneState extends State<Code_Phone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Text(
                    "Verification code",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 80, bottom: 20),
                      child: Text(
                        "Enter the code sent on Message:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Pinput(
                    length: 6,
                    onCompleted: (pin) async {
                      context.read<Auth>().login(context, OTP: pin);
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
