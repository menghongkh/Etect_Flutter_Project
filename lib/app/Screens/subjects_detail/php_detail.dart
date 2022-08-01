import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widget/custom_button.dart';
import '../../widget/fav_icon.dart';
import '../bottom_register.dart';

class Php_detail extends StatefulWidget {
  const Php_detail({Key? key}) : super(key: key);

  @override
  State<Php_detail> createState() => _Php_detailState();
}

class _Php_detailState extends State<Php_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          //title: const Text("PHP Programming",style: TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold),),
          leading: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Custom_button_Back(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Account()));}, 
        icon: Icon(Icons.app_registration),backgroundColor: Colors.indigo,
        label: Text("Register")),
        body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('php_program').get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<DocumentSnapshot> document = snapshot.data!.docs;

                return ListView(
                    children: document
                        .map((doc) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(doc['img']),
                                              fit: BoxFit.cover),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        doc['title'],
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Favoriteicon(),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        doc['price'],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        doc['pr'],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        doc['course'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 50, right: 50),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // kitchen and heat
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.done_all_outlined,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            'Basic',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.done_all_outlined,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            'Function',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // row wifi_ hot bath
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 50, top: 15, right: 50),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.done_all_outlined,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            'Algorithm',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.done_all_outlined,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Text(
                                            'Structure',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 50, top: 15, right: 50),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.done_all_outlined,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            'Class',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.done_all_outlined,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Text(
                                            'R & W file',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        doc['des'],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    doc['des_detail'],
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        doc['stu'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Column(
                                //     children: [
                                //       SingleChildScrollView(
                                //           scrollDirection: Axis.horizontal,
                                //           child: Row(children: [
                                //             Container(
                                //                 width: 300,
                                //                 height: 200,
                                //                 decoration: BoxDecoration(
                                //                     color: Colors.indigo,
                                //                     image: DecorationImage(
                                //                         image: NetworkImage(
                                //                             doc['img']),
                                //                         fit: BoxFit.cover),
                                //                     border: Border.all(
                                //                         color: Colors.black),
                                //                     borderRadius:
                                //                     BorderRadius.circular(
                                //                         15))),
                                //             const SizedBox(
                                //               width: 20,
                                //             ),
                                //             Container(
                                //                 width: 300,
                                //                 height: 200,
                                //                 decoration: BoxDecoration(
                                //                     color: Colors.indigo,
                                //                     image: DecorationImage(
                                //                         image: NetworkImage(
                                //                             doc['img']),
                                //                         fit: BoxFit.cover),
                                //                     border: Border.all(
                                //                         color: Colors.black),
                                //                     borderRadius:
                                //                     BorderRadius.circular(
                                //                         15))),
                                //           ])),
                                //     ],
                                //   ),
                                // )
                              ],
                            ))
                        .toList());
              } else if (snapshot.hasError) {
                return const Text("Something went wrong");
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
