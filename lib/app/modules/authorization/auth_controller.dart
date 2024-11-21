import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/authorization/login_page.dart';
import 'package:myapp/app/modules/home/views/home_view.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var isLoading = false.obs;

  Future<void> registerUser(String email, String password) async {
    try {
      isLoading.value = true;

      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get user ID
      String uid = userCredential.user!.uid;

      // Save additional user information to Firestore
      await _firestore.collection('users').doc(uid).set({
        'password': password,
        'email': email,
        'username': '', // Optional: You can add more fields as needed
        'phoneNumber': '', // Optional: You can add more fields as needed
        // You can add any additional user data here
      });

      Get.snackbar('Success', 'Registration successful!', snackPosition: SnackPosition.TOP);
      Get.offAll(const LoginPage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'Registration failed', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // Login user method
  Future<void> loginUser(String email, String password) async {
  try {
    isLoading.value = true;

    // Sign in user with email and password
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Optionally, you can retrieve additional user info from Firestore
    DocumentSnapshot userDoc = await _firestore.collection('users').doc(userCredential.user!.uid).get();

    if (userDoc.exists) {
      // You can use this user data as needed
      Get.snackbar('Success', 'Login successful!', snackPosition: SnackPosition.BOTTOM);

      // Navigate to HomeView after successful login
      Get.offAll(const HomeView()); // Make sure this route is defined in your routes
    } else {
      Get.snackbar('Error', 'User data not found.', snackPosition: SnackPosition.BOTTOM);
    }
  } on FirebaseAuthException catch (e) {
    Get.snackbar('Error', e.message ?? 'Login failed', snackPosition: SnackPosition.BOTTOM);
  } finally {
    isLoading.value = false;
  }
}

}
