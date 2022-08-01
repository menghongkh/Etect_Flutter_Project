import 'dart:async';
import 'package:flutter/material.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void didChangeDependencies() {
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, '/auth');
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/etec.png"),
                  radius: 100,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "ETEC Center -មជ្ឈមណ្ឌលបណ្តុះជំនាញ I.T",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text(
                "ស្វាគមន៍មកកាន់ ETEC Center",
                style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.only(top: 100),
            //   child: CircularProgressIndicator(),
            // ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 320,
                child: Image.asset(
                  "images/backgroundSplash.png",
                  fit: BoxFit.cover,
                ))
            // Padding(
            //   padding: EdgeInsets.only(top: 200),
            //   child: Text(
            //     "Welcome to ETEC Application",
            //     style: TextStyle(
            //         color: Colors.blueAccent,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 18),
            //   ),
            // ),
          ]),
        ),
      ),
    );
  }
}
