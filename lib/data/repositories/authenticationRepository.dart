import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopper/screens/onboarding/screen/onBoarding.dart';
import 'package:shopper/screens/login/screen/login.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopper/utils/exceptions/firebaseAuthException.dart';
import 'package:shopper/utils/exceptions/firebaseException.dart';
import 'package:shopper/utils/exceptions/formatException.dart';
import 'package:shopper/utils/exceptions/plateformException.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final localStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    localStorage.writeIfNull("isFirstTime", true);

    localStorage.read("isFirstTime") != false
        ? Get.offAll(() => const OnBoardingScreen())
        : Get.offAll(() => const LoginScreen());
  }

  /* ------------------------------- Register User ------------------------------- */
  Future<UserCredential> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException Code: ${e.code}');
      print('FirebaseAuthException Message: ${e.message}');
      throw AppFirebaseAuthException(code: e.code).message;
    } on FirebaseException catch (e) {
      print('FirebaseException Code: ${e.code}');
      print('FirebaseException Message: ${e.message}');
      throw AppFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      print('FormatException: ${e.message}');
      throw const AppFormatException().message;
    } on PlatformException catch (e) {
      print('PlatformException Code: ${e.code}');
      print('PlatformException Message: ${e.message}');
      throw AppPlatformException(code: e.code).message;
    } catch (e) {
      print('Unexpected Error: $e');
      throw 'Something went wrong. Please try again.';
    }
  }

  /* ------------------------------- Email Verification ------------------------------- */
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException().message;
    } on PlatformException catch (e) {
      throw AppPlatformException(code: e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
