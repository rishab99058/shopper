import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopper/models/authentication/userModel.dart';
import 'package:shopper/utils/constants/keys.dart';
import 'package:shopper/utils/exceptions/firebaseAuthException.dart';
import 'package:shopper/utils/exceptions/firebaseException.dart';
import 'package:shopper/utils/exceptions/formatException.dart';
import 'package:shopper/utils/exceptions/plateformException.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db
          .collection(AppKeys.userCollection)
          .doc(user.id)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      print('saveUserRecord FirebaseAuthException Code: ${e.code}');
      print('saveUserRecord FirebaseAuthException Message: ${e.message}');
      throw AppFirebaseAuthException(code: e.code).message;
    } on FirebaseException catch (e) {
      print('saveUserRecord FirebaseException Code: ${e.code}');
      print('saveUserRecord FirebaseException Message: ${e.message}');
      throw AppFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      print('saveUserRecord FormatException: ${e.message}');
      throw const AppFormatException().message;
    } on PlatformException catch (e) {
      print('saveUserRecord PlatformException Code: ${e.code}');
      print('saveUserRecord PlatformException Message: ${e.message}');
      throw AppPlatformException(code: e.code).message;
    } catch (e) {
      print('saveUserRecord Unexpected Error: $e');
      throw 'Something went wrong. Please try again.';
    }
  }
}
