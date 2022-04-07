import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_sqlite/core/constants/sql_name.dart';
import 'package:test_sqlite/core/utils/image_base64.dart';
import 'package:test_sqlite/data/local/sqlite_repository.dart';
import 'package:test_sqlite/data/models/user.dart';

class DetailController extends GetxController {
  final SqliteRepository sqliteRepository = SqliteRepository();

  final GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameEditController = TextEditingController();
  final TextEditingController lastNameEditController = TextEditingController();
  final TextEditingController phoneEditController = TextEditingController();
  final TextEditingController emailEditController = TextEditingController();

  final RxString currentPhoneDropdown = 'Mobile'.obs;
  final RxString currentEmailDropdown = 'Home'.obs;
  final List<String> listPhoneDropdown = ['Mobile', 'Home'];

  final RxString currentAvatarString = "".obs;

  Future<void> onPressSaveButton() async {
    final Map<String, String> infoUser = {
      SqlName.columnFirstName: firstNameEditController.text,
      SqlName.columnLastName: lastNameEditController.text,
      SqlName.columnPhone: phoneEditController.text,
      SqlName.columnEmail: emailEditController.text,
      SqlName.columnAvatar: currentAvatarString.value
    };
    await sqliteRepository.insertUser(infoUser);
    final List<User> listSize = await sqliteRepository.getListUser();
  }

  Future<void> onPressButtonCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final Uint8List imageByte = await image.readAsBytes();
      final String imgString = ImageBase64.base64String(imageByte);
      currentAvatarString.value = imgString;
    }
  }
}
