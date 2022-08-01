import 'package:etec_center/app/Screens/subjects_detail/Java_detail.dart';
import 'package:etec_center/app/Screens/subjects_detail/c_programming.dart';
import 'package:etec_center/app/Screens/subjects_detail/flutter_detail.dart';
import 'package:etec_center/app/Screens/subjects_detail/php_detail.dart';
import 'package:etec_center/app/Screens/subjects_detail/web_detail.dart';
import 'package:flutter/material.dart';

import '../../check_auth/fuction_signin.dart';
import '../widget/fav_icon.dart';
import 'package:provider/provider.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "ETEC CENTER",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.normal),
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.read<Auth>().signOut(context);
              },
              icon: const Icon(
                Icons.logout,
                size: 30,
                color: Colors.red,
              ))
        ],
      ),
      drawer: Drawer(
          backgroundColor: Colors.indigo,
          child: ListView(children: <Widget>[
            DrawerHeader(
                margin: const EdgeInsets.only(bottom: 30),
                child: Column(children: <Widget>[
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    elevation: 10,
                    color: Colors.white,
                    child: Image.asset(
                      "images/etec.png",
                      width: 130,
                      height: 100,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'ETEC Center -មជ្ឈមណ្ឌលបណ្តុះជំនាញ I.T',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ])),
          ])),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const C_Programming()));
                    },
                    child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("images/c_pro.png")),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        )),
                  ),
                  const Text(
                    "C/C++",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () { const snackdemo = SnackBar(
                                    content:
                                        Text('No Data yet!',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    backgroundColor: Colors.red,
                                    elevation: 10,
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.all(5),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackdemo);},
                    child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("images/ps.png")),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        )),
                  ),
                  const Text(
                    "Design",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () { const snackdemo = SnackBar(
                                    content:
                                        Text('No Data yet!',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    backgroundColor: Colors.red,
                                    elevation: 10,
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.all(5),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackdemo);},
                    child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("images/bas.webp")),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        )),
                  ),
                  const Text(
                    "Basic",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () { const snackdemo = SnackBar(
                                    content:
                                        Text('No Data yet!',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    backgroundColor: Colors.red,
                                    elevation: 10,
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.all(5),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackdemo);},
                    child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("images/office.jpg"),
                              fit: BoxFit.fitWidth),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        )),
                  ),
                  const Text(
                    "MC_Office",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Web_detail()));
                    },
                    child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("images/html.png")),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        )),
                  ),
                  const Text(
                    "HTML/CSS",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () { const snackdemo = SnackBar(
                                    content:
                                        Text('No Data yet!',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    backgroundColor: Colors.red,
                                    elevation: 10,
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.all(5),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackdemo);},
                    child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("images/database.png")),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        )),
                  ),
                  const Text(
                    "Database",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "ADVANCE SUBJECTS",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  child: const Text(
                    "SEE ALL",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            width: 400,
            height: 120,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            child: Stack(
              children: [
                Row(children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(
                              "images/flutter.png",
                            ),
                            fit: BoxFit.cover)),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Text(
                              "Flutter Development",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // Icon Favorite
                          Favoriteicon(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              r"75.00$",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                  color: Colors.indigo),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: 100,
                            height: 40,
                            child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 0, 77, 154)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Flutter_detail()));
                              },
                              child: const Text(
                                'View More',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ])
              ],
            ),
          ),
          Container(
            width: 400,
            height: 120,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage(
                                "images/php.webp",
                              ),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Text(
                                "PHP Development",
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            // Icon Favorite
                            Favoriteicon(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                r"90.00$",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                    color: Colors.indigo),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              width: 100,
                              height: 40,
                              child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(255, 0, 77, 154)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Php_detail()));
                                },
                                child: const Text(
                                  'View More',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 400,
            height: 120,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage("images/c#.png"),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Text(
                                "C# Development",
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 22,
                            ),
                            // Icon Favorite
                            Favoriteicon(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                r"89.00$",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                    color: Colors.indigo),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              width: 100,
                              height: 40,
                              child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(255, 0, 77, 154)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ))),
                                onPressed: () {
                                  const snackdemo = SnackBar(
                                    content:
                                        Text('No Data yet!',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    backgroundColor: Colors.red,
                                    elevation: 10,
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.all(5),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackdemo);
                                },
                                child: const Text(
                                  'View More',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 400,
            height: 120,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage("images/java1.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Text(
                                "JAVA Development",
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // Icon Favorite
                            Favoriteicon(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                r"69.00$",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                    color: Colors.indigo),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              width: 100,
                              height: 40,
                              child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(255, 0, 77, 154)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Java_detail()));
                                },
                                child: const Text(
                                  'View More',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
