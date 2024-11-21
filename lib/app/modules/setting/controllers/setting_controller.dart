import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class SettingController extends GetxController {
  var username = ''.obs;
  var phoneNumber = ''.obs;
  var email = ''.obs;
  var profileImage = Rxn<File>();
  var profileImageUrl = ''.obs; // URL untuk menyimpan gambar profil

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _imagePicker = ImagePicker();

  late final Stream<DocumentSnapshot<Map<String, dynamic>>> userDocStream;


  // Upload file ke Firebase Storage
  Future<String?> uploadImageToFirebase(File image) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String filePath = 'profile_images/${user.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg';
        TaskSnapshot uploadTask = await _storage.ref(filePath).putFile(image);
        String downloadUrl = await uploadTask.ref.getDownloadURL();
        return downloadUrl;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload image: $e', snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }

  // Ambil gambar dari kamera
  Future<void> pickImageFromCamera() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
      await _saveProfileImage();
    }
  }

  // Ambil gambar dari file sistem
  Future<void> pickImageFromFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      profileImage.value = File(result.files.single.path!);
      await _saveProfileImage();
    }
  }

  // Simpan gambar ke Firebase Storage dan update Firestore
  Future<void> _saveProfileImage() async {
    if (profileImage.value != null) {
      String? downloadUrl = await uploadImageToFirebase(profileImage.value!);
      if (downloadUrl != null) {
        await _updateProfileImageUrl(downloadUrl);
      }
    }
  }

  // Update URL gambar profil ke Firestore
  Future<void> _updateProfileImageUrl(String imageUrl) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({'profileImageUrl': imageUrl});
      profileImageUrl.value = imageUrl;
    }
  }

    Future<void> updateField(String field, String value) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({field: value});
      switch (field) {
        case 'username':
          username.value = value;
          break;
        case 'phoneNumber':
          phoneNumber.value = value;
          break;
        case 'email':
          email.value = value;
          break;
      }
    }
  }


  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  void fetchUserData() {
    User? user = _auth.currentUser;
    if (user != null) {
      userDocStream = _firestore.collection('users').doc(user.uid).snapshots();
      userDocStream.listen((DocumentSnapshot doc) {
        if (doc.exists) {
          username.value = doc['username'] ?? '';
          phoneNumber.value = doc['phoneNumber'] ?? '';
          email.value = doc['email'] ?? '';
          profileImageUrl.value = doc['profileImageUrl'] ?? '';
        }
      });
    }
  }

  Future<void> logout() async {
    try {
      username.value = '';
      phoneNumber.value = '';
      email.value = '';
      profileImage.value = null;
      await _auth.signOut();
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar('Error', 'Failed to logout: $e', snackPosition: SnackPosition.BOTTOM);
    }
  }
}
