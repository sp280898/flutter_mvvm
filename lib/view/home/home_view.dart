import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/app_exceptions.dart';
import 'package:flutter_mvvm/resources/components/general_exception.dart';
import 'package:flutter_mvvm/resources/components/internet_exceptions.dart';
import 'package:flutter_mvvm/response/status.dart';
import 'package:flutter_mvvm/routes/routes_name.dart';
import 'package:flutter_mvvm/view_models/controller/home/home_view_model.dart';
import 'package:flutter_mvvm/view_models/controller/login/user_prefernce/user_preferences_view_model.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //
  final homeController = Get.put(HomeController());
  //
  UserPreference userPreference = UserPreference();

  ///
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    userPreference.removeUser().then((value) {
                      Get.toNamed(RoutesName.loginView);
                    });
                  },
                  icon: Icon(Icons.logout)),
            )
          ],
        ),
        body: Obx(() {
          switch (homeController.rxRequestStatus.value) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            //
            case Status.ERROR:
              if (homeController.error.value == "No internet") {
                return GeneralExceptionWidget(onPress: () {
                  homeController.refreshApi();
                });
              } else {
                return InternetExceptionWidget(onPress: () {
                  homeController.refreshApi();
                });
              }
            //
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: homeController.UserList.value.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                            title: Row(
                              children: [
                                Text(homeController
                                    .UserList.value.data![index].firstName
                                    .toString()),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(homeController
                                    .UserList.value.data![index].lastName
                                    .toString()),
                              ],
                            ),
                            subtitle: Text(homeController
                                .UserList.value.data![index].email
                                .toString()),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(homeController
                                  .UserList.value.data![index].avatar
                                  .toString()),
                            )));
                  });
          }
        }));
  }
}
