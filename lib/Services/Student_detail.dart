import 'package:etec_center/Services/Student_service.dart';
import 'package:etec_center/app/model/register_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../app/widget/custom_button.dart';
import '../app/widget/custom_textfield.dart';

class Student_detail extends StatefulWidget {
  const Student_detail({Key? key, required this.people}) : super(key: key);
  final Student_register people;
  @override
  State<Student_detail> createState() => _Student_detailState();
}

class _Student_detailState extends State<Student_detail> {
  late TextEditingController fullname;
  late TextEditingController School;
  late TextEditingController place;
  late TextEditingController numbephone;
  late TextEditingController sex;
  late TextEditingController subject;
  final bool _fullname = false;

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
  void initState() {
    super.initState();
    fullname = TextEditingController(text: widget.people.name);
    School = TextEditingController(text: widget.people.school);
    place = TextEditingController(text: widget.people.place);
    numbephone = TextEditingController(text: widget.people.phonenumber);
    sex = TextEditingController(text: widget.people.sex);
    subject = TextEditingController(text: widget.people.subject);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Update information Student",
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
              titleButton: "Save",
              buttonColor: Colors.indigo,
              radiusButton: 10,
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 2));
                if (imageFile == null) {
                  Student_register peopleModel = Student_register(
                      name: fullname.text,
                      sex: sex.text,
                      school: School.text,
                      subject: subject.text,
                      place: place.text,
                      phonenumber: numbephone.text,
                      photo: widget.people.photo);
                  await StudentService().updatePeople(peopleModel);
                } else {
                  String? photoUrl =
                      await StudentService().uploadPhoto(File(imageFile!.path));
                  Student_register peopleModel = Student_register(
                    name: fullname.text,
                    sex: sex.text,
                    school: School.text,
                    subject: subject.text,
                    place: place.text,
                    phonenumber: numbephone.text,
                    photo: photoUrl,
                  );
                  await StudentService().updatePeople(peopleModel);
                  debugPrint("tru");
                }
              },
            ),
          ),
        ],
      )),
    );
  }
}
