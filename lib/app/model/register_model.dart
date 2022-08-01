import 'package:cloud_firestore/cloud_firestore.dart';

class Student_register {
  String? name;
  String? sex;
  String? school;
  String? subject;
  String? place;
  String? phonenumber;
  String? photo;

  Student_register({
    this.name,
    this.sex,
    this.subject,
    this.school,
    this.place,
    this.phonenumber,
    this.photo,
  });

  Student_register.fromDocumentSnapshot(DocumentSnapshot doc) {
    name = doc['name'];
    sex = doc['sex'];
    subject = doc['subject'];
    school = doc['school'];
    place = doc['place'];
    phonenumber = doc['phonenumber'];
    photo = doc['photo'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sex': sex,
      'subject': subject,
      'school': school,
      'place': place,
      'phonenumber': phonenumber,
      'photo': photo,
    };
  }
}
