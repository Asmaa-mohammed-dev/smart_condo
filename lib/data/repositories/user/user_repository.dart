import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_condo/data/repositories/authentication.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> saveUserData(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'شيء ما حدث خطأ. يرجى المحاولة مرة أخرى لاحقًا.';
    }
  }

  /// لاسترجاع بيانات المستخدم الحالي
  Future<UserModel> fetchUserDetails() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) throw 'لم يتم تسجيل الدخول بعد.';

      final snapshot = await _db.collection('Users').doc(currentUser.uid).get();

      if (!snapshot.exists) throw 'لم يتم العثور على بيانات المستخدم.';

      return UserModel.fromSnapshot(snapshot);
    } catch (e) {
      throw 'فشل في استرجاع بيانات المستخدم: $e';
    }
  }
}
