import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sqlite/data/models/user.dart';
import 'package:test_sqlite/modules/home/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 10, left: 10, right: 10),
        child: FutureBuilder<List<User>>(
          future: homeController.getListUser(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Text(
                    snapshot.data![index].firstName,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error!"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homeController.onPressFloatButton,
        child: const Icon(Icons.add),
      ),
    );
  }
}
