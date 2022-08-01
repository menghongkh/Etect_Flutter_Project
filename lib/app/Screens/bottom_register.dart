import 'package:etec_center/Services/Student_service.dart';
import 'package:etec_center/app/Screens/bottom_add_card.dart';
import 'package:etec_center/app/model/register_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../widget/custom_button.dart';
import '../widget/custom_textfield.dart';

class Account extends StatefulWidget {
  const Account({
    Key? key,
  }) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  TextEditingController fullname = TextEditingController();
  TextEditingController School = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController numbephone = TextEditingController();
  TextEditingController sex = TextEditingController();
  TextEditingController subject = TextEditingController();
  bool _fullname = false;
  //gender? _site = gender.Male;
  // set image profile
  XFile? imageFile;

  final ImagePicker _picker = ImagePicker();
  void _onImagePressed(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: double.maxFinite,
        maxHeight: double.maxFinite,
        imageQuality: 100,
      );
      setState(() {
        imageFile = pickedFile;
      });
    } catch (e) {
      print('Image Error : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Register",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
            child: InkWell(
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 3.0, color: Colors.indigo),
                  color: Colors.indigo,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageFile != null
                        ? Image.file(File(imageFile!.path)).image
                        : const NetworkImage(
                            'https://3znvnpy5ek52a26m01me9p1t-wpengine.netdna-ssl.com/wp-content/uploads/2017/07/noimage_person.png',
                          ),
                  ),
                ),
              ),
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                          actions: [
                            CupertinoActionSheetAction(
                                onPressed: () {
                                  _onImagePressed(ImageSource.camera);
                                },
                                child: const Text(
                                  "Take Photo",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 24, 85, 171)),
                                )),
                            CupertinoActionSheetAction(
                                onPressed: () {
                                  _onImagePressed(ImageSource.gallery);
                                },
                                child: const Text(
                                  "Choose from Gallery",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 24, 85, 171)),
                                )),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 24, 85, 171)),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Custom_Textfield(
              controller: fullname,
              hintText: "Full Name",
              onChanged: (_) => setState(() {}),
              errorText: _fullname ? "Invalid Code" : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Custom_Textfield(
              controller: sex,
              hintText: "Sex",
              onChanged: (_) => setState(() {}),
              errorText: _fullname ? "Invalid Code" : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Custom_Textfield(
              controller: subject,
              hintText: "Subject You register",
              onChanged: (_) => setState(() {}),
              errorText: _fullname ? "Invalid Code" : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Custom_Textfield(
              controller: School,
              hintText: "University",
              onChanged: (_) => setState(() {}),
              errorText: _fullname ? "Invalid Code" : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Custom_Textfield(
              controller: place,
              hintText: "Place of birth",
              onChanged: (_) => setState(() {}),
              errorText: _fullname ? "Invalid Code" : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Custom_Textfield(
              controller: numbephone,
              hintText: "Phone Number",
              onChanged: (_) => setState(() {}),
              errorText: _fullname ? "Invalid Code" : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 50),
            child: CustomButtontext(
              hightButton: 55,
              widthButton: 330,
              titleButton: "Submit",
              buttonColor: Colors.indigo,
              radiusButton: 10,
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));
                String photoUrl =
                    await StudentService().uploadPhoto(File(imageFile!.path));
                Student_register people = Student_register(
                    name: fullname.text,
                    sex: sex.text,
                    subject: subject.text,
                    school: School.text,
                    place: place.text,
                    phonenumber: numbephone.text,
                    photo: photoUrl);
                await StudentService().createPeople(people);
                //debugPrint("successful");

                showDialog<String>(
                  // show alert subscribe
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                    ),
                    content: SizedBox(
                      width: 302,
                      height: 350,
                      child: Column(
                        children: [
                          // decoration icon done
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            width: 119,
                            height: 119,
                            child: const CircleAvatar(
                              backgroundColor: Color.fromARGB(46, 38, 153, 251),
                              radius: 115,
                              child: CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 38, 153, 251),
                                radius: 50,
                                child: Icon(
                                  Icons.done,
                                  size: 60,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(
                                top: 32, left: 26, right: 18),
                            child: const Center(
                              child: Text(
                                'Register Successful!',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 73, 75, 94)),
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(
                              top: 34,
                            ),
                            child: CustomButtontext(
                              widthButton: 280,
                              hightButton: 51,
                              radiusButton: 8,
                              maginRight: 10,
                              maginleft: 10,
                              titleButton: "OK",
                              titlebuttonColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              buttonColor:
                                  const Color.fromARGB(255, 38, 153, 251),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Add_Card()));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
