// ignore: file_names
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etec_center/app/model/register_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/cupertino.dart';

class StudentService {
  String Liststudent = 'List_student';
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage firestorage = FirebaseStorage.instance;

  Future<void> createPeople(Student_register studentModel) async {
    try {
      firestore.collection(Liststudent).add(studentModel.toMap());
    } catch (e) {
      debugPrint('Error create people => $e');
    }
  }

  Stream<List<Student_register>> getPeople() {
    return firestore
        .collection(Liststudent)
        .orderBy('name', descending: false)
        .snapshots()
        .map((event) {
      List<Student_register> list = [];
      for (var element in event.docs) {
        list.add(Student_register.fromDocumentSnapshot(element));
      }
      return list;
    });
  }

  Future<void> updatePeople(Student_register people) async {
    try {
      firestore.collection(Liststudent).doc(people.sex).update(people.toMap());
    } catch (e) {
      debugPrint('Error update people => $e');
    }
  }

  Future<void> deletePeople(String name) async {
    try {
      firestore.collection(Liststudent).doc(name).delete();
    } catch (e) {
      debugPrint('Error delete people => $e');
    }
  }

  uploadPhoto(File? image) async {
    if (image == null) {
      return;
    } else {
      await firestorage
          .ref('upload/${image.path.split("/").last}')
          .putFile(image);
      String downloadURL = await firestorage
          .ref('upload/${image.path.split("/").last}')
          .getDownloadURL();

      debugPrint("URL : $downloadURL");
      return downloadURL;
    }
  }
}
