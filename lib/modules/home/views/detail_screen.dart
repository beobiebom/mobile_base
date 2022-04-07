import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sqlite/core/utils/image_base64.dart';
import 'package:test_sqlite/modules/home/controllers/detail_controller.dart';

class DetailScreen extends StatelessWidget {
  final DetailController detailController = Get.put(DetailController());

  DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.close),
        ),
        title: const Text("Edit contact"),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: detailController.onPressSaveButton,
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Obx(
                () => Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.blue,
                  child: detailController.currentAvatarString.value == ""
                      ? const Icon(
                          Icons.person,
                          size: 230,
                          color: Colors.white,
                        )
                      : ImageBase64.imageFromBase64String(
                          detailController.currentAvatarString.value),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: IconButton(
                  onPressed: detailController.onPressButtonCamera,
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_android,
                        color: Colors.grey,
                        size: 26,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Saving to",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Device",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.person,
                        size: 26,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          controller: detailController.firstNameEditController,
                          decoration:
                              const InputDecoration(hintText: "First name"),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(Icons.keyboard_arrow_down_outlined)
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 46,
                      ),
                      Expanded(
                        child: TextField(
                          controller: detailController.lastNameEditController,
                          decoration:
                              const InputDecoration(hintText: "Last name"),
                        ),
                      ),
                      const SizedBox(
                        width: 43,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 26,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          controller: detailController.phoneEditController,
                          decoration: const InputDecoration(hintText: "Phone"),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(Icons.keyboard_arrow_down_outlined)
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 46,
                      ),
                      DropdownButton<String>(
                        value: detailController.currentPhoneDropdown.value,
                        icon: Row(
                          children: const [
                            SizedBox(
                              width: 50,
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        style: const TextStyle(color: Colors.grey),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {},
                        items: detailController.listPhoneDropdown
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 46,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: "Phone"),
                        ),
                      ),
                      SizedBox(
                        width: 43,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 46,
                      ),
                      DropdownButton<String>(
                        value: 'Mobile',
                        icon: Row(
                          children: const [
                            SizedBox(
                              width: 50,
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        style: const TextStyle(color: Colors.grey),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {},
                        items: detailController.listPhoneDropdown
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.email,
                        size: 26,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          controller: detailController.emailEditController,
                          decoration: const InputDecoration(hintText: "Email"),
                        ),
                      ),
                      const SizedBox(width: 44),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 46,
                      ),
                      DropdownButton<String>(
                        value: detailController.currentEmailDropdown.value,
                        icon: Row(
                          children: const [
                            SizedBox(
                              width: 50,
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        style: const TextStyle(color: Colors.grey),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {},
                        items: detailController.listPhoneDropdown
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
