import 'dart:developer';

import 'package:get/get.dart';
import 'package:test_sqlite/core/router/get_router.dart';
import 'package:test_sqlite/data/local/sqlite_repository.dart';
import 'package:test_sqlite/data/models/user.dart';

class HomeController extends GetxController {
  final SqliteRepository sqliteRepository = SqliteRepository();
  final RxList<User> listUser = <User>[].obs;

  Future<List<User>> getListUser() async {
    try {
      listUser.value = await sqliteRepository.getListUser();
    } catch (e) {
      log("Exception in getListUser() from HomeController: ${e.toString()}");
    }
    return listUser;
  }

  void onPressFloatButton() {
    Get.toNamed(GetRouter.detail);
  }
}
