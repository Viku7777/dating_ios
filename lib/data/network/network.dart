import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class NetworkBaseApis {
  static Future<QuerySnapshot> fQureyData(String collection) async {
    FirebaseFirestore fCloud = FirebaseFirestore.instance;
    try {
      return await fCloud.collection(collection).get();
    } on SocketException {
      throw Exception("Please check your internet connection");
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<DocumentSnapshot> fCollectionData(
      String collection, String path) async {
    FirebaseFirestore fCloud = FirebaseFirestore.instance;
    try {
      return await fCloud.collection(collection).doc(path).get();
    } on SocketException {
      throw Exception("Please check your internet connection");
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<QuerySnapshot> fQureyFind(dynamic query) async {
    try {
      return await query.get();
    } on SocketException {
      throw "Please check your internet connection";
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw Exception(e);
    }
  }
}
