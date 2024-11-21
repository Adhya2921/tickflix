import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/setting_controller.dart';

class SettingView extends StatelessWidget {
  final SettingController controller = Get.put(SettingController());

  SettingView({super.key});

  void showUpdateDialog(BuildContext context, String field, String currentValue) {
    TextEditingController inputController = TextEditingController(text: currentValue);

    Get.defaultDialog(
      title: 'Update $field',
      content: Column(
        children: [
          TextField(
            controller: inputController,
            decoration: InputDecoration(
              labelText: 'New $field',
            ),
          ),
        ],
      ),
      textConfirm: 'Update',
      onConfirm: () {
        if (inputController.text.isNotEmpty) {
          // Memanggil metode updateField
          controller.updateField(field, inputController.text).catchError((e) {
            Get.snackbar('Error', 'Failed to update $field: $e');
          });
          Get.back();
        } else {
          Get.snackbar('Warning', 'Field cannot be empty');
        }
      },
      textCancel: 'Cancel',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () => showImageSourceDialog(context),
                child: Obx(() {
                  return CircleAvatar(
                    radius: 50,
                    backgroundImage: controller.profileImageUrl.value.isNotEmpty
                        ? NetworkImage(controller.profileImageUrl.value)
                        : (controller.profileImage.value != null
                            ? FileImage(controller.profileImage.value!)
                            : const NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRxL0Sd3z-nRjmTU_UVta84zEdjBmFQ17p_A&s',
                              )) as ImageProvider,
                    child: (controller.profileImageUrl.value.isEmpty &&
                            controller.profileImage.value == null)
                        ? const Icon(Icons.camera_alt, size: 40, color: Colors.white)
                        : null,
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Account Settings', style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() {
              return ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Username'),
                subtitle: Text(controller.username.value.isNotEmpty
                    ? controller.username.value
                    : 'Not set'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => showUpdateDialog(context, 'username', controller.username.value),
              );
            }),
            Obx(() {
              return ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Phone Number'),
                subtitle: Text(controller.phoneNumber.value.isNotEmpty
                    ? controller.phoneNumber.value
                    : 'Not set'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => showUpdateDialog(context, 'phoneNumber', controller.phoneNumber.value),
              );
            }),
            Obx(() {
              return ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                subtitle: Text(controller.email.value.isNotEmpty
                    ? controller.email.value
                    : 'Not set'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => showUpdateDialog(context, 'email', controller.email.value),
              );
            }),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.logout().catchError((e) {
                    Get.snackbar('Error', 'Failed to logout: $e');
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(150, 50),
                ),
                child: const Text('Logout', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showImageSourceDialog(BuildContext context) {
    Get.defaultDialog(
      title: 'Select Image Source',
      content: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () {
              controller.pickImageFromCamera();
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Gallery'),
            onTap: () {
              controller.pickImageFromFile();
              Get.back();
            },
          ),
        ],
      ),
      textCancel: 'Cancel',
    );
  }
}
