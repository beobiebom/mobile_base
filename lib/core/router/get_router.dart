import 'package:get/get.dart';
import 'package:test_sqlite/modules/home/views/detail_screen.dart';
import 'package:test_sqlite/modules/home/views/home_screen.dart';

class GetRouter {
  static const String home = '/home';
  static const String detail = '/detail';

  static List<GetPage<dynamic>> pages = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: detail, page: () => DetailScreen()),
  ];
}
